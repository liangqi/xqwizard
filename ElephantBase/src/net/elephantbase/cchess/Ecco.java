package net.elephantbase.cchess;

import net.elephantbase.util.Bytes;

import com.google.code.jswin.CallProcHelper;
import com.google.code.jswin.util.ClassPath;

public class Ecco {
	public static String VERSION;

	private static CallProcHelper cphEccoOpening, cphEccoVariation, cphEccoIndex;

	static {
		String libEcco = "" + ClassPath.getInstance().append("../lib/ECCO.DLL");
		CallProcHelper cphEccoVersion = new CallProcHelper(libEcco, "_EccoVersion@0");
		VERSION = CallProcHelper.getStrA(cphEccoVersion.callProc());
		CallProcHelper cphEccoInit = new CallProcHelper(libEcco, "_EccoInitOpenVar@4");
		cphEccoInit.callProc(Integer.valueOf(0));
		cphEccoOpening = new CallProcHelper(libEcco, "_EccoOpening@4");
		cphEccoVariation = new CallProcHelper(libEcco, "_EccoVariation@4");
		cphEccoIndex = new CallProcHelper(libEcco, "_EccoIndex@4");
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

	private static final byte[] EMPTY_BYTES_4 = new byte[] {0, 0, 0, 0};

	private static int sz2dw(String sz) {
		byte[] buffer = Bytes.add(sz.getBytes(), EMPTY_BYTES_4);
		return Bytes.toInt(buffer, Bytes.LITTLE_ENDIAN);
	}

	public static String opening(String ecco) {
		int lpcstr = cphEccoOpening.callProc(Integer.valueOf(sz2dw(ecco)));
		return CallProcHelper.getStrA(lpcstr);
	}

	public static String variation(String ecco) {
		int lpcstr = cphEccoVariation.callProc(Integer.valueOf(sz2dw(ecco)));
		return CallProcHelper.getStrA(lpcstr);
	}

	public static String index(String fileStr) {
		return dw2sz(cphEccoIndex.callProc(fileStr));
	}

	public static int getId(String ecco) {
		return (ecco.charAt(0) - 'A') * 100 + Integer.parseInt(ecco.substring(1));
	}

	public static String getEcco(int id) {
		return String.format("%c%02d", Character.valueOf((char) ('A' + id / 100)),
				Integer.valueOf(id % 100));
	}
}