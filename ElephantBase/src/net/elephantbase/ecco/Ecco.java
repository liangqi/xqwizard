package net.elephantbase.ecco;

import java.io.File;

import net.elephantbase.util.Bytes;
import net.elephantbase.util.ClassPath;

import com.google.code.jswin.CallProcHelper;

public class Ecco {
	public static String VERSION;

	private static boolean traditional;
	private static CallProcHelper cphEccoInit, cphEccoOpening, cphEccoVariation, cphEccoIndex;

	static {
		CallProcHelper cphEccoVersion;
		if (File.separatorChar == '\\') {
			String libEcco = ClassPath.getInstance("../lib/ECCO.DLL").toString();
			cphEccoVersion = new CallProcHelper(libEcco, "_EccoVersion@0");
			cphEccoInit = new CallProcHelper(libEcco, "_EccoInitOpenVar@4");
			cphEccoOpening = new CallProcHelper(libEcco, "_EccoOpening@4");
			cphEccoVariation = new CallProcHelper(libEcco, "_EccoVariation@4");
			cphEccoIndex = new CallProcHelper(libEcco, "_EccoIndex@4");
		} else {
			String libEcco = ClassPath.getInstance("../lib/libecco.so").toString();
			cphEccoVersion = new CallProcHelper(libEcco, "EccoVersion");
			cphEccoInit = new CallProcHelper(libEcco, "EccoInitOpenVar");
			cphEccoOpening = new CallProcHelper(libEcco, "EccoOpening");
			cphEccoVariation = new CallProcHelper(libEcco, "EccoVariation");
			cphEccoIndex = new CallProcHelper(libEcco, "EccoIndex");
		}
		VERSION = CallProcHelper.getStr(cphEccoVersion.callProc());
		setTraditional(false);
	}

	public static void setTraditional(boolean traditional) {
		Ecco.traditional = traditional;
		cphEccoInit.callProc(Integer.valueOf(traditional ? 1 : 0));
	}

	private static String dw2sz(int dw) {
		byte[] buffer = Bytes.fromInt(dw, Bytes.LITTLE_ENDIAN);
		for (int i = 0; i < 4; i ++) {
			if (buffer[i] == 0) {
				return new String(buffer, 0, i);
			}
		}
		return new String(buffer, 0, 4);
	}

	private static final byte[] EMPTY_BYTES_4 = {0, 0, 0, 0};

	private static int sz2dw(String sz) {
		byte[] buffer = Bytes.add(sz.getBytes(), EMPTY_BYTES_4);
		return Bytes.toInt(buffer, Bytes.LITTLE_ENDIAN);
	}

	private static String decode(String in) {
		if (!traditional) {
			return in;
		}
		try {
			return new String(in.getBytes(), "BIG5");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static String opening(String ecco) {
		int lpcstr = cphEccoOpening.callProc(Integer.valueOf(sz2dw(ecco)));
		return decode(CallProcHelper.getStr(lpcstr));
	}

	public static String variation(String ecco) {
		int lpcstr = cphEccoVariation.callProc(Integer.valueOf(sz2dw(ecco)));
		return decode(CallProcHelper.getStr(lpcstr));
	}

	public static String ecco(String fileStr) {
		return dw2sz(cphEccoIndex.callProc(fileStr));
	}
}