package xqwajax.util;

import java.util.concurrent.atomic.AtomicInteger;

public class Lock {
	private volatile AtomicInteger lock = new AtomicInteger(0);

	private boolean tryLock0() {
		return lock.compareAndSet(0, 1);
	}

	public boolean tryLock() {
		return !isLocked() && tryLock0();
	}

	public void lock() {
		while (!tryLock()) {
			try {
				Thread.sleep(1);
			} catch (Exception e) {
				// Ignored
			}
		}
	}

	public void unlock() {
		lock.set(0);
	}

	public boolean isLocked() {
		return lock.get() != 0;
	}
}