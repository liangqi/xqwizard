package com.google.code.jswin;

import java.util.LinkedHashMap;

public class CallProcHelper {
	public static final String KERNEL32_DLL = "KERNEL32.DLL";
	public static final String USER32_DLL = "USER32.DLL";

	private static int lpProcFreeLibrary, lpProcStrLen;
	private static LinkedHashMap<String, Integer> hModMap = new LinkedHashMap<String, Integer>();

	static {
		int modKernel = CallProc.loadLibrary(KERNEL32_DLL);
		lpProcFreeLibrary = CallProc.getProcAddress(modKernel, "FreeLibrary");
		lpProcStrLen = CallProc.getProcAddress(modKernel, "lstrlenA");
		hModMap.put(KERNEL32_DLL, Integer.valueOf(modKernel));
		hModMap.put(USER32_DLL, Integer.valueOf(CallProc.loadLibrary(USER32_DLL)));
	}

	private int hMod, lpProc;

	public static String getStrA(int lpcstr) {
		int len = CallProc.callProc(lpProcStrLen, lpcstr);
		byte[] buffer = new byte[len];
		CallProc.getByteArray(lpcstr, buffer, 0, len);
		return new String(buffer);
	}

	public CallProcHelper(String libFileName, String procName) {
		Integer modInteger = hModMap.get(libFileName);
		hMod = (modInteger == null ? CallProc.loadLibrary(libFileName) : modInteger.intValue());
		if (hMod == 0) {
			throw new RuntimeException("File not found: " + libFileName);
		}
		lpProc = CallProc.getProcAddress(hMod, procName);
		if (lpProc == 0) {
			throw new RuntimeException("Can't find DLL entry point " + procName + " in " + libFileName);
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
		if (!hModMap.containsValue(Integer.valueOf(hMod))) {
			CallProc.callProc(lpProcFreeLibrary, hMod);
		}
	}
}