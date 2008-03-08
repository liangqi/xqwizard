package xqwlight.util;

import java.util.Stack;

public abstract class Pool<T> {
	protected abstract T makeObject();
	protected abstract void destroyObject(T obj);
	protected abstract boolean activateObject(T obj);
	protected abstract boolean passivateObject(T obj);

	private Stack<T> pool = new Stack<T>();

	public synchronized T borrowObject() {
		T obj;
		while (!pool.isEmpty()) {
			obj = pool.pop();
			if (activateObject(obj)) {
				return obj;
			}
			destroyObject(obj);
		}
		obj = makeObject();
		return obj == null ? null : activateObject(obj) ? obj : null;
	}

	public synchronized void returnObject(T obj) {
		if (passivateObject(obj)) {
			pool.push(obj);
		} else {
			destroyObject(obj);
		}
	}

	public synchronized void addObject() {
		T obj = makeObject();
		if (obj != null) {
			pool.push(obj);
		}
	}

	public synchronized void removeObject() {
		if (!pool.empty()) {
			T obj = pool.pop();
			destroyObject(obj);
		}
	}

	public synchronized void invalidateObject(T obj) {
		passivateObject(obj);
		destroyObject(obj);
	}

	public synchronized void clear() {
		while (!pool.empty()) {
			T obj = pool.pop();
			destroyObject(obj);
		}
	}

	public int getNumIdle() {
		return pool.size();
	}
}