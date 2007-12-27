/*
Test.java - Source Code for XiangQi Wizard Light, Part VI

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.13, Last Modified: Dec. 2007
Copyright (C) 2004-2007 www.elephantbase.net

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
package xqwlight;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test {
	public static void main(String[] args) throws Exception {
		Search search = new Search();
		int[] mvs = new int[Position.MAX_GEN_MOVES];
		int legal = 0, gened = 0, moved = 0, check = 0;
		BufferedReader in = new BufferedReader(new InputStreamReader(Test.class.getResourceAsStream("/test/FUNNY.EPD")));
		String str = in.readLine();
		while (str != null) {
			search.pos.fromFen(str);
			for (int sqSrc = 0; sqSrc < 256; sqSrc ++) {
				if (Position.IN_BOARD(sqSrc)) {
					for (int sqDst = 0; sqDst < 256; sqDst ++) {
						if (Position.IN_BOARD(sqDst)) {
							legal += (search.pos.legalMove(Position.MOVE(sqSrc, sqDst)) ? 1 : 0);
						}
					}
				}
			}
			int moveNum = search.pos.generateAllMoves(mvs);
			for (int i = 0; i < moveNum; i ++) {
				if (search.pos.makeMove(mvs[i])) {
					moved ++;
					check += (search.pos.inCheck() ? 1 : 0);
					search.pos.undoMakeMove();
				}
			}
			gened += moveNum;
			str = in.readLine();
		}
		in.close();
		System.out.println("Legal: " + legal); // 7809
		System.out.println("Gened: " + gened); // 7809
		System.out.println("Moved: " + moved); // 7207
		System.out.println("Check: " + check); // 718
		search.pos.fromFen("rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKAB1R w - - 0 1");
		long l = System.currentTimeMillis();
		search.searchMain(1);
		System.out.println("NPS = " + (search.allNodes / (System.currentTimeMillis() - l)) + "K");
	}
}