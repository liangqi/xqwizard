package net.elephantbase.util;

import java.util.EmptyStackException;
import java.util.Stack;

public abstract class Pool<T> {
	protected abstract T makeObject();
	protected abstract void destroyObject(T obj);

	/** @param obj */
	protected boolean activateObject(T obj) {
		return true;
	}

	/** @param obj */
	protected boolean passivateObject(T obj) {
		return true;
	}

	private Stack<T> pool = new Stack<T>();

	private T pop() {
		try {
			return pool.pop();
		} catch (EmptyStackException e) {
			return null;
		}
	}

	public T borrowObject() {
		while (true) {
			T obj = pop();
			if (obj == null) {
				obj = makeObject();
				if (obj == null) {
					return null;
				}
				if (activateObject(obj)) {
					return obj;
				}
				destroyObject(obj);
				return null;
			}
			if (activateObject(obj)) {
				return obj;
			}
			destroyObject(obj);
		}
	}

	public void returnObject(T obj) {
		if (passivateObject(obj)) {
			pool.push(obj);
		} else {
			destroyObject(obj);
		}
	}

	public void addObject() {
		T obj = makeObject();
		if (obj != null) {
			pool.push(obj);
		}
	}

	public void removeObject() {
		T obj = pop();
		if (obj != null) {
			destroyObject(obj);
		}
	}

	public void invalidateObject(T obj) {
		passivateObject(obj);
		destroyObject(obj);
	}

	public void clear() {
		T obj = pop();
		while (obj != null) {
			destroyObject(obj);
			obj = pop();
		}
	}

	public int getNumIdle() {
		return pool.size();
	}
}