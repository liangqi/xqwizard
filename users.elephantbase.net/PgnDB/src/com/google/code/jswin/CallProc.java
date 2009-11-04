package com.google.code.jswin;

import com.google.code.jswin.util.ClassPath;

public class CallProc {
	static {
		System.load(ClassPath.getInstance().append("../lib/CALLPROC.DLL").toString());
	}

	public static final int CALLBACK_SIZE = 32;

	public static native int newRef(Object o);
	public static native void delRef(int ref);
	public static native void memCpy(int lpDst, int lpSrc, int count);
	public static native byte getMem1(int lpuc);
	public static native short getMem2(int lpw);
	public static native int getMem4(int lpdw);
	public static native void getByteArray(int lpucSrc, byte[] dest, int destPos, int length);
	public static native void getShortArray(int lpwSrc, short[] dest, int destPos, int length);
	public static native void getIntArray(int lpdwSrc, int[] dest, int destPos, int length);
	public static native void putMem1(int lpuc, byte uc);
	public static native void putMem2(int lpw, short w);
	public static native void putMem4(int lpdw, int dw);
	public static native void putByteArray(int lpucDest, byte[] src, int srcPos, int length);
	public static native void putShortArray(int lpwDest, short[] src, int srcPos, int length);
	public static native void putIntArray(int lpdwDest, int[] src, int srcPos, int length);
	public static native String getStr(int lpcwstr);
	public static native void putStr(int lpwstr, String str);
	public static native int alloc(int size);
	public static native int allocStr(String str);
	public static native void free(int lp);

	public static native int loadLibrary(String libFileName);
	public static native int getProcAddress(int hMod, String procName);
	public static native int callProc(int lpProc, int... params);
	public static native void prepareCallback(int lpucCallbackMem, int lpGenericCallback, int lpContext, int paramLen);
	public static native int getCallbackAddress();
}