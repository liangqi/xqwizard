package com.google.code.jswin;

import java.io.Closeable;

public abstract class CallbackHelper implements Closeable {
	private static int lpGenericCallback = CallProc.getCallbackAddress();

	protected abstract int callback(int[] params);

	int numParams;

	private int lpucCallbackMem = CallProc.alloc(CallProc.CALLBACK_SIZE);
	private int lpContext = CallProc.newRef(new Callback() {
		@Override
		public int callback(int lpcParam) {
			int[] params = new int[numParams];
			for (int i = 0; i < numParams; i ++) {
				params[i] = CallProc.getMem4(lpcParam + i * 4);
			}
			return CallbackHelper.this.callback(params);
		}
	});

	protected CallbackHelper(int numParams) {
		this.numParams = numParams;
		CallProc.prepareCallback(lpucCallbackMem, lpGenericCallback, lpContext, numParams * 4);
	}

	public int getCallbackMem() {
		return lpucCallbackMem;
	}

	@Override
	public void close() {
		CallProc.delRef(lpContext);
		CallProc.free(lpucCallbackMem);
	}
}