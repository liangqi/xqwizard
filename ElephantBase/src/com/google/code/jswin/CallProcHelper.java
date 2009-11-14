package com.google.code.jswin;

public class CallProcHelper {
	private int hMod, lpProc;

	public static String getStr(int lpcstr) {
		int len = 0;
		while (CallProc.getMem1(lpcstr + len) != 0) {
			len ++;
		}
		byte[] buffer = new byte[len];
		CallProc.getByteArray(lpcstr, buffer, 0, len);
		return new String(buffer);
	}

	public CallProcHelper(String libFileName, String procName) {
		hMod = CallProc.loadLibrary(libFileName.getBytes());
		if (hMod == 0) {
			throw new RuntimeException("File not found: " + libFileName);
		}
		lpProc = CallProc.getProcAddress(hMod, procName.getBytes());
		if (lpProc == 0) {
			throw new RuntimeException("Can't find DLL/so entry point " + procName + " in " + libFileName);
		}
	}

	public int callProc(Object... params) {
		int[] intParams = new int[params.length];
		for (int i = 0; i < params.length; i ++) {
			if (false) {
				//
			} else if (params[i] instanceof Integer) {
				intParams[i] = ((Integer) params[i]).intValue();
			} else if (params[i] instanceof byte[]) {
				byte[] bb = (byte[]) params[i];
				intParams[i] = CallProc.alloc(bb.length);
				CallProc.putByteArray(intParams[i], bb, 0, bb.length);
			} else if (params[i] instanceof String) {
				byte[] bb = ((String) params[i]).getBytes();
				intParams[i] = CallProc.alloc(bb.length + 1);
				CallProc.putByteArray(intParams[i], bb, 0, bb.length);
				CallProc.putMem1(intParams[i] + bb.length, (byte) 0);
			} else if (params[i] instanceof CallbackHelper) {
				intParams[i] = ((CallbackHelper) params[i]).getCallbackMem();
			} else {
				intParams[i] = 0;
			}
		}
		int ret = CallProc.callProc(lpProc, intParams);
		for (int i = 0; i < params.length; i ++) {
			if (params[i] instanceof byte[] || params[i] instanceof String) {
				CallProc.free(intParams[i]);
			}
		}
		return ret;
	}

	@Override
	public void finalize() {
		CallProc.freeLibrary(hMod);
	}
}