package net.elephantbase.pgndb.biz;

import java.util.ArrayList;

import net.elephantbase.ecco.Ecco;

public class EccoUtil {
	public static int ecco2id(String ecco) {
		return (ecco.charAt(0) - 'A') * 100 + Integer.parseInt(ecco.substring(1));
	}

	public static String id2ecco(int id) {
		return String.format("%c%02d", Character.valueOf((char) ('A' + id / 100)),
				Integer.valueOf(id % 100));
	}

	public static final String[] LEVEL_1 = {
		"A.非中炮类开局",
		"B.中炮对反宫马及其他",
		"C.中炮对屏风马",
		"D.顺炮局和列炮局",
		"E.仙人指路局",
	};

	public static final String[][] LEVEL_2 = {
		{
			"A0.非常见开局",
			"A1.飞相局(一)",
			"A2.飞相局(二)",
			"A3.飞相局(三)",
			"A4.起马局",
			"A5.仕角炮局",
			"A6.过宫炮局",
		}, {
			"B0.中炮对非常见开局",
			"B1.中炮对单提马",
			"B2.中炮对左三步虎",
			"B3.中炮对反宫马(一)",
			"B4.中炮对反宫马(二)——五六炮对反宫马",
			"B5.中炮对反宫马(三)——五七炮对反宫马",
		}, {
			"C0.中炮对屏风马(一)",
			"C1.中炮对屏风马(二)",
			"C2.中炮过河车七路马对屏风马两头蛇",
			"C3.中炮过河车互进七兵对屏风马",
			"C4.中炮过河车互进七兵对屏风马平炮兑车",
			"C5.五六炮对屏风马",
			"C6.五七炮对屏风马(一)",
			"C7.五七炮对屏风马(二)",
			"C8.中炮巡河炮对屏风马",
			"C9.五八炮和五九炮对屏风马",
		}, {
			"D0.顺炮局",
			"D1.顺炮直车对缓开车",
			"D2.顺炮直车对横车",
			"D3.中炮对左炮封车转列炮",
			"D4.中炮对左三步虎转列炮",
			"D5.中炮对列炮",
		}, {
			"E0.仙人指路局",
			"E1.仙人指路对卒底炮",
			"E2.仙人指路转左中炮对卒底炮飞左象(一)",
			"E3.仙人指路转左中炮对卒底炮飞左象(二)",
			"E4.对兵局",
		}
	};

	public static String[][][] LEVEL_3;

	static {
		int iMax = LEVEL_2.length;
		LEVEL_3 = new String[iMax][][];
		for (int i = 0; i < iMax; i ++) {
			int jMax = LEVEL_2[i].length;
			LEVEL_3[i] = new String[jMax][];
			for (int j = 0; j < jMax; j ++) {
				ArrayList<String> openVarList = new ArrayList<String>();
				String eccoLevel2 = "" + (char) ('A' + i) + (char) ('0' + j);
				for (int k = 0; k < 10; k ++) {
					String ecco = eccoLevel2 + (char) ('0' + k);
					String opening = Ecco.opening(ecco);
					String variation = Ecco.variation(ecco);
					if (opening.isEmpty()) {
						if (k == 0) {
							opening = "不合理开局";
						} else {
							break;
						}
					}
					openVarList.add(ecco + "." + opening +
							(variation.isEmpty() ? "" : "——" + variation));
				}
				LEVEL_3[i][j] = openVarList.toArray(new String[0]);
			}
		}
	}
}