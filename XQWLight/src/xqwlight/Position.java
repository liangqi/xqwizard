/*
Position.java - Source Code for XiangQi Wizard Light, Part I

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

import java.io.InputStream;
import java.util.Random;


public class Position {
	public static final int MATE_VALUE = 10000;
	public static final int BAN_VALUE = MATE_VALUE - 100;
	public static final int WIN_VALUE = MATE_VALUE - 200;
	public static final int NULL_SAFE_MARGIN = 400;
	public static final int NULL_OKAY_MARGIN = 200;
	public static final int DRAW_VALUE = 20;
	public static final int ADVANCED_VALUE = 3;

	public static final int MAX_MOVE_NUM = 256;
	public static final int MAX_GEN_MOVES = 128;

	public static final int PIECE_KING = 1;
	public static final int PIECE_ADVISOR = 2;
	public static final int PIECE_BISHOP = 3;
	public static final int PIECE_KNIGHT = 4;
	public static final int PIECE_ROOK = 5;
	public static final int PIECE_CANNON = 6;
	public static final int PIECE_PAWN = 7;

	public static final int RANK_TOP = 3;
	public static final int RANK_BOTTOM = 12;
	public static final int FILE_LEFT = 3;
	public static final int FILE_RIGHT = 11;
	
	public static final byte[] IN_BOARD = new byte[] {
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	};

	public static final byte[] IN_FORT = new byte[] {
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	};

	public static final byte[] LEGAL_SPAN = new byte[] {
							 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0,
	};

	public static final byte[] KNIGHT_PIN = new byte[] {
									0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,-16,  0,-16,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0, -1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0, -1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0, 16,  0, 16,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0
	};

	public static final int[] KING_DELTA = {-16, -1, 1, 16}; 
	public static final int[] ADVISOR_DELTA = {-17, -15, 15, 17}; 
	public static final int[][] KNIGHT_DELTA = {{-33, -31}, {-18, 14}, {-14, 18}, {31, 33}}; 
	public static final int[][] KNIGHT_CHECK_DELTA = {{-33, -18}, {-31, -14}, {14, 31}, {18, 33}};
	public static final int[] MVV_VALUE = {0, 50, 10, 10, 30, 40, 30, 20};

	public static final short[][] PIECE_VALUE = {
		{
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  9,  9,  9, 11, 13, 11,  9,  9,  9,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 34, 42, 44, 42, 34, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 32, 37, 37, 37, 32, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 23, 27, 29, 30, 29, 27, 23, 19,  0,  0,  0,  0,
			0,  0,  0, 14, 18, 20, 27, 29, 27, 20, 18, 14,  0,  0,  0,  0,
			0,  0,  0,  7,  0, 13,  0, 16,  0, 13,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  7,  0,  7,  0, 15,  0,  7,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0, 11, 15, 11,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20,  0,  0,  0, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0, 18,  0,  0, 20, 23, 20,  0,  0, 18,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0, 23,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20, 20,  0, 20, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20,  0,  0,  0, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0, 18,  0,  0, 20, 23, 20,  0,  0, 18,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0, 23,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20, 20,  0, 20, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0, 90, 90, 90, 96, 90, 96, 90, 90, 90,  0,  0,  0,  0,
			0,  0,  0, 90, 96,103, 97, 94, 97,103, 96, 90,  0,  0,  0,  0,
			0,  0,  0, 92, 98, 99,103, 99,103, 99, 98, 92,  0,  0,  0,  0,
			0,  0,  0, 93,108,100,107,100,107,100,108, 93,  0,  0,  0,  0,
			0,  0,  0, 90,100, 99,103,104,103, 99,100, 90,  0,  0,  0,  0,
			0,  0,  0, 90, 98,101,102,103,102,101, 98, 90,  0,  0,  0,  0,
			0,  0,  0, 92, 94, 98, 95, 98, 95, 98, 94, 92,  0,  0,  0,  0,
			0,  0,  0, 93, 92, 94, 95, 92, 95, 94, 92, 93,  0,  0,  0,  0,
			0,  0,  0, 85, 90, 92, 93, 78, 93, 92, 90, 85,  0,  0,  0,  0,
			0,  0,  0, 88, 85, 90, 88, 90, 88, 90, 85, 88,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,206,208,207,213,214,213,207,208,206,  0,  0,  0,  0,
			0,  0,  0,206,212,209,216,233,216,209,212,206,  0,  0,  0,  0,
			0,  0,  0,206,208,207,214,216,214,207,208,206,  0,  0,  0,  0,
			0,  0,  0,206,213,213,216,216,216,213,213,206,  0,  0,  0,  0,
			0,  0,  0,208,211,211,214,215,214,211,211,208,  0,  0,  0,  0,
			0,  0,  0,208,212,212,214,215,214,212,212,208,  0,  0,  0,  0,
			0,  0,  0,204,209,204,212,214,212,204,209,204,  0,  0,  0,  0,
			0,  0,  0,198,208,204,212,212,212,204,208,198,  0,  0,  0,  0,
			0,  0,  0,200,208,206,212,200,212,206,208,200,  0,  0,  0,  0,
			0,  0,  0,194,206,204,212,200,212,204,206,194,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,100,100, 96, 91, 90, 91, 96,100,100,  0,  0,  0,  0,
			0,  0,  0, 98, 98, 96, 92, 89, 92, 96, 98, 98,  0,  0,  0,  0,
			0,  0,  0, 97, 97, 96, 91, 92, 91, 96, 97, 97,  0,  0,  0,  0,
			0,  0,  0, 96, 99, 99, 98,100, 98, 99, 99, 96,  0,  0,  0,  0,
			0,  0,  0, 96, 96, 96, 96,100, 96, 96, 96, 96,  0,  0,  0,  0,
			0,  0,  0, 95, 96, 99, 96,100, 96, 99, 96, 95,  0,  0,  0,  0,
			0,  0,  0, 96, 96, 96, 96, 96, 96, 96, 96, 96,  0,  0,  0,  0,
			0,  0,  0, 97, 96,100, 99,101, 99,100, 96, 97,  0,  0,  0,  0,
			0,  0,  0, 96, 97, 98, 98, 98, 98, 98, 97, 96,  0,  0,  0,  0,
			0,  0,  0, 96, 96, 97, 99, 99, 99, 97, 96, 96,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  9,  9,  9, 11, 13, 11,  9,  9,  9,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 34, 42, 44, 42, 34, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 32, 37, 37, 37, 32, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 23, 27, 29, 30, 29, 27, 23, 19,  0,  0,  0,  0,
			0,  0,  0, 14, 18, 20, 27, 29, 27, 20, 18, 14,  0,  0,  0,  0,
			0,  0,  0,  7,  0, 13,  0, 16,  0, 13,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  7,  0,  7,  0, 15,  0,  7,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0, 11, 15, 11,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		},
	};

	public static final String[] STARTUP_FEN = {
		"rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1",
		"rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKAB1R w - - 0 1",
		"rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/R1BAKAB1R w - - 0 1",
		"rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/9/1C5C1/9/RN2K2NR w - - 0 1",
	};

	public static final boolean IN_BOARD(int sq) {
		return IN_BOARD[sq] != 0;
	}

	public static final boolean IN_FORT(int sq) {
		return IN_FORT[sq] != 0;
	}

	public static final int RANK_Y(int sq) {
		return sq >> 4;
	}

	public static final int FILE_X(int sq) {
		return sq & 15;
	}

	public static final int COORD_XY(int x, int y) {
		return x + (y << 4);
	}

	public static final int SQUARE_FLIP(int sq) {
		return 254 - sq;
	}

	public static final int FILE_FLIP(int x) {
		return 14 - x;
	}

	public static final int RANK_FLIP(int y) {
		return 15 - y;
	}

	public static final int MIRROR_SQUARE(int sq) {
		return COORD_XY(FILE_FLIP(FILE_X(sq)), RANK_Y(sq));
	}

	public static final int SQUARE_FORWARD(int sq, int sd) {
		return sq - 16 + (sd << 5);
	}

	public static final int SQUARE_BACKWARD(int sq, int sd) {
		return sq + 16 - (sd << 5);
	}

	public static final boolean KING_SPAN(int sqSrc, int sqDst) {
		return LEGAL_SPAN[sqDst - sqSrc + 256] == 1;
	}

	public static final boolean ADVISOR_SPAN(int sqSrc, int sqDst) {
		return LEGAL_SPAN[sqDst - sqSrc + 256] == 2;
	}

	public static final boolean BISHOP_SPAN(int sqSrc, int sqDst) {
		return LEGAL_SPAN[sqDst - sqSrc + 256] == 3;
	}

	public static final int BISHOP_PIN(int sqSrc, int sqDst) {
		return (sqSrc + sqDst) >> 1;
	}

	public static final int KNIGHT_PIN(int sqSrc, int sqDst) {
		return sqSrc + KNIGHT_PIN[sqDst - sqSrc + 256];
	}

	public static final boolean HOME_HALF(int sq, int sd) {
		return (sq & 0x80) != (sd << 7);
	}

	public static final boolean AWAY_HALF(int sq, int sd) {
		return (sq & 0x80) == (sd << 7);
	}

	public static final boolean SAME_HALF(int sqSrc, int sqDst) {
		return ((sqSrc ^ sqDst) & 0x80) == 0;
	}

	public static final boolean DIFF_HALF(int sqSrc, int sqDst) {
		return ((sqSrc ^ sqDst) & 0x80) != 0;
	}

	public static final boolean SAME_RANK(int sqSrc, int sqDst) {
		return ((sqSrc ^ sqDst) & 0xf0) == 0;
	}

	public static final boolean SAME_FILE(int sqSrc, int sqDst) {
		return ((sqSrc ^ sqDst) & 0x0f) == 0;
	}

	public static final int SIDE_TAG(int sd) {
		return 8 + (sd << 3);
	}

	public static final int OPP_SIDE_TAG(int sd) {
		return 16 - (sd << 3);
	}

	public static final int SRC(int mv) {
		return mv & 255;
	}

	public static final int DST(int mv) {
		return mv >> 8;
	}

	public static final int MOVE(int sqSrc, int sqDst) {
		return sqSrc + (sqDst << 8);
	}

	public static final int MIRROR_MOVE(int mv) {
		return MOVE(MIRROR_SQUARE(SRC(mv)), MIRROR_SQUARE(DST(mv)));
	}

	public static final int MVV_LVA(int pc, int lva) {
		return MVV_VALUE[pc & 7] - lva;
	}

	public static int PreGen_zobristKeyPlayer;
	public static int PreGen_zobristLockPlayer;
	public static int[][] PreGen_zobristKeyTable = new int[14][256];
	public static int[][] PreGen_zobristLockTable = new int[14][256];

	public static class RC4 {
		public int[] state = new int[256];
		public int x, y;

		public void swap(int i, int j) {
			int t = state[i];
			state[i] = state[j];
			state[j] = t;
		}

		public RC4(byte[] key) {
			x = 0;
			y = 0;
			for (int i = 0; i < 256; i ++) {
				state[i] = i;
			}
			int j = 0;
			for (int i = 0; i < 256; i ++) {
				j = (j + state[i] + key[i % key.length]) & 0xff;
				swap(i, j);
			}
		}

		public int nextByte() {
			x = (x + 1) & 0xff;
			y = (y + state[x]) & 0xff;
			swap(x, y);
			int t = (state[x] + state[y]) & 0xff;
			return state[t];
		}

		public int nextLong() {
			int n0, n1, n2, n3;
			n0 = nextByte();
			n1 = nextByte();
			n2 = nextByte();
			n3 = nextByte();
			return n0 + (n1 << 8) + (n2 << 16) + (n3 << 24);
		}
	}

	/** byte[2] (Little Endian) -> short */
	public static int toShort(byte[] b) {
		return ((b[0] & 0xff) | ((b[1] & 0xff) << 8));
	}

	/** byte[4] (Little Endian) -> long */
	public static int toInt(byte[] b) {
		return (b[0] & 0xff) | ((b[1] & 0xff) << 8) | ((b[2] & 0xff) << 16) | ((b[3] & 0xff) << 24);
	}

	public static Random random = new Random();

	public static int bookSize;
	public static int[] bookLock;
	public static short[] bookMove, bookValue;

	static {
		RC4 rc4 = new RC4(new byte[] {0});
		PreGen_zobristKeyPlayer = rc4.nextLong();
		rc4.nextLong(); // Skip ZobristLock0
		PreGen_zobristLockPlayer = rc4.nextLong();
		for (int i = 0; i < 14; i ++) {
			for (int j = 0; j < 256; j ++) {
				PreGen_zobristKeyTable[i][j] = rc4.nextLong();
				rc4.nextLong(); // Skip ZobristLock0
				PreGen_zobristLockTable[i][j] = rc4.nextLong();
			}
		}
		try {
			byte[] intData = new byte[4];
			byte[] shortData = new byte[2];
			InputStream in = rc4.getClass().getResourceAsStream("/book/BOOK.DAT");
			bookSize = in.available() / 8;
			bookLock = new int[bookSize];
			bookMove = new short[bookSize];
			bookValue = new short[bookSize];
			for (int i = 0; i < bookSize; i ++) {
				in.read(intData);
				bookLock[i] = toInt(intData) >>> 1; // Convert into Unsigned
				in.read(shortData);
				bookMove[i] = (short) toShort(shortData);
				in.read(shortData);
				bookValue[i] = (short) toShort(shortData);
			}
			in.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static int binarySearch(int vl, int[] vls, int from, int to) {
		int low = from;
		int high = to - 1;
		while (low <= high) {
			int mid = (low + high) / 2;
			if (vls[mid] < vl) {
				low = mid + 1;
			} else if (vls[mid] > vl) {
				high = mid - 1;
			} else {
				return mid;
			}
		}
		return -1;
	}

	public int sdPlayer;
	public byte[] squares = new byte[256];

	public int zobristKey;
	public int zobristLock;
	public int vlWhite, vlBlack;
	public int moveNum, distance;

	public int[] mvList = new int[MAX_MOVE_NUM];
	public int[] pcList = new int[MAX_MOVE_NUM];
	public int[] keyList = new int[MAX_MOVE_NUM];
	public boolean[] chkList = new boolean[MAX_MOVE_NUM];

	public void clearBoard() {
		sdPlayer = 0;
		for (int sq = 0; sq < 256; sq ++) {
			squares[sq] = 0;
		}
		zobristKey = zobristLock = 0;
		vlWhite = vlBlack = 0;
	}

	public void setIrrev() {
		mvList[0] = pcList[0] = 0;
		chkList[0] = checked(sdPlayer);
		moveNum = 1;
		distance = 0;
	}

	public void addPiece(int sq, int pc, boolean del) {
		int pcAdjust;
		squares[sq] = (byte) (del ? 0 : pc);
		if (pc < 16) {
			pcAdjust = pc - 9;
			vlWhite += del ? -PIECE_VALUE[pcAdjust][sq] : PIECE_VALUE[pcAdjust][sq];
		} else {
			pcAdjust = pc - 17;
			vlBlack += del ? -PIECE_VALUE[pcAdjust][SQUARE_FLIP(sq)] :
					PIECE_VALUE[pcAdjust][SQUARE_FLIP(sq)];
			pcAdjust += 7;
		}
		zobristKey ^= PreGen_zobristKeyTable[pcAdjust][sq];
		zobristLock ^= PreGen_zobristLockTable[pcAdjust][sq];
	}

	public void addPiece(int sq, int pc) {
		addPiece(sq, pc, false);
	}

	public void delPiece(int sq, int pc) {
		addPiece(sq, pc, true);
	}

	public int movePiece(int mv) {
		int sqSrc = SRC(mv);
		int sqDst = DST(mv);
		int pcCaptured = squares[sqDst];
		if (pcCaptured > 0) {
			delPiece(sqDst, pcCaptured);
		}
		int pc = squares[sqSrc];
		delPiece(sqSrc, pc);
		addPiece(sqDst, pc);
		return pcCaptured;
	}

	public void undoMovePiece(int mv, int pcCaptured) {
		int sqSrc = SRC(mv);
		int sqDst = DST(mv);
		int pc = squares[sqDst];
		delPiece(sqDst, pc);
		addPiece(sqSrc, pc);
		if (pcCaptured > 0) {
			addPiece(sqDst, pcCaptured);
		}
	}

	public void changeSide() {
		sdPlayer = 1 - sdPlayer;
		zobristKey ^= PreGen_zobristKeyPlayer;
		zobristLock ^= PreGen_zobristLockPlayer;
	}

	public boolean makeMove(int mv) {
		keyList[moveNum] = zobristKey;
		int pcCaptured = movePiece(mv);
		if (checked(sdPlayer)) {
			undoMovePiece(mv, pcCaptured);
			return false;
		}
		changeSide();
		mvList[moveNum] = mv;
		pcList[moveNum] = pcCaptured;
		chkList[moveNum] = checked(sdPlayer);
		moveNum ++;
		distance ++;
		return true;
	}

	public void undoMakeMove() {
		moveNum --;
		distance --;
		changeSide();
		undoMovePiece(mvList[moveNum], pcList[moveNum]);
	}

	public void nullMove() {
		keyList[moveNum] = zobristKey;
		changeSide();
		mvList[moveNum] = pcList[moveNum] = 0;
		chkList[moveNum] = false;
		moveNum ++;
		distance ++;
	}

	public void undoNullMove() {
		moveNum --;
		distance --;
		changeSide();
	}

	public int fenPiece(char c) {
		switch (c) {
		case 'K':
			return 1;
		case 'A':
			return 2;
		case 'B':
		case 'E':
			return 3;
		case 'H':
		case 'N':
			return 4;
		case 'R':
			return 5;
		case 'C':
			return 6;
		case 'P':
			return 7;
		default:
			return 0;
		}
	}

	public void fromFen(String fen) {
		clearBoard();
		int rank = RANK_TOP;
		int file = FILE_LEFT;
		// Assume fen is not empty
		int index = 0;
		char c = fen.charAt(index);
		// Assume a space exists
		while (c != ' ') {
			if (c == '/') {
				file = FILE_LEFT;
				rank ++;
				if (rank > RANK_BOTTOM) {
					break;
				}
			} else if (c >= '1' && c <= '9') {
				for (int k = 0; k < (c - '0'); k ++) {
					if (file >= FILE_RIGHT) {
						break;
					}
					file ++;
				}
			} else if (c >= 'A' && c <= 'Z') {
				if (file <= FILE_RIGHT) {
					addPiece(COORD_XY(file, rank), fenPiece(c) + 8);
					file ++;
				}
			} else if (c >= 'a' && c <= 'z') {
				if (file <= FILE_RIGHT) {
					addPiece(COORD_XY(file, rank), fenPiece((char) (c + 'A' - 'a')) + 16);
					file ++;
				}
			}
			index ++;
			c = fen.charAt(index);
		}
		// Assume 'w' or 'b' at last
		index ++;
		if (sdPlayer == (fen.charAt(index) == 'b' ? 0 : 1)) {
			changeSide();
		}
		setIrrev();
	}

	public int generateAllMoves(int[] mvs) {
		return generateMoves(mvs, null);
	}

	public int generateMoves(int[] mvs, int[] vls) {
		int moves = 0;
		int pcSelfSide = SIDE_TAG(sdPlayer);
		int pcOppSide = OPP_SIDE_TAG(sdPlayer);
		for (int sqSrc = 0; sqSrc < 256; sqSrc ++) {
			int pcSrc = squares[sqSrc];
			if ((pcSrc & pcSelfSide) == 0) {
				continue;
			}
			switch (pcSrc - pcSelfSide) {
			case PIECE_KING:
				for (int i = 0; i < 4; i ++) {
					int sqDst = sqSrc + KING_DELTA[i];
					if (!IN_FORT(sqDst)) {
						continue;
					}
					int pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = MOVE(sqSrc, sqDst);
						vls[moves] = MVV_LVA(pcDst, 5);
						moves ++;
					}
				}
				break;
			case PIECE_ADVISOR:
				for (int i = 0; i < 4; i ++) {
					int sqDst = sqSrc + ADVISOR_DELTA[i];
					if (!IN_FORT(sqDst)) {
						continue;
					}
					int pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = MOVE(sqSrc, sqDst);
						vls[moves] = MVV_LVA(pcDst, 1);
						moves ++;
					}
				}
				break;
			case PIECE_BISHOP:
				for (int i = 0; i < 4; i ++) {
					int sqDst = sqSrc + ADVISOR_DELTA[i];
					if (!(IN_BOARD(sqDst) && HOME_HALF(sqDst, sdPlayer) && squares[sqDst] == 0)) {
						continue;
					}
					sqDst += ADVISOR_DELTA[i];
					int pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = MOVE(sqSrc, sqDst);
						vls[moves] = MVV_LVA(pcDst, 1);
						moves ++;
					}
				}
				break;
			case PIECE_KNIGHT:
				for (int i = 0; i < 4; i ++) {
					int sqDst = sqSrc + KING_DELTA[i];
					if (squares[sqDst] > 0) {
						continue;
					}
					for (int j = 0; j < 2; j ++) {
						sqDst = sqSrc + KNIGHT_DELTA[i][j];
						if (!IN_BOARD(sqDst)) {
							continue;
						}
						int pcDst = squares[sqDst];
						if (vls == null) {
							if ((pcDst & pcSelfSide) == 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								moves ++;
							}
						} else if ((pcDst & pcOppSide) != 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							vls[moves] = MVV_LVA(pcDst, 1);
							moves ++;
						}
					}
				}
				break;
			case PIECE_ROOK:
				for (int i = 0; i < 4; i ++) {
					int delta = KING_DELTA[i];
					int sqDst = sqSrc + delta;
					while (IN_BOARD(sqDst)) {
						int pcDst = squares[sqDst];
						if (pcDst == 0) {
							if (vls == null) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								moves ++;
							}
						} else {
							if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								if (vls != null) {
									vls[moves] = MVV_LVA(pcDst, 4);
								}
								moves ++;
							}
							break;
						}
						sqDst += delta;
					}
				}
				break;
			case PIECE_CANNON:
				for (int i = 0; i < 4; i ++) {
					int delta = KING_DELTA[i];
					int sqDst = sqSrc + delta;
					while (IN_BOARD(sqDst)) {
						int pcDst = squares[sqDst];
						if (pcDst == 0) {
							if (vls == null) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								moves ++;
							}
						} else {
							break;
						}
						sqDst += delta;
					}
					sqDst += delta;
					while (IN_BOARD(sqDst)) {
						int pcDst = squares[sqDst];
						if (pcDst > 0) {
							if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								if (vls != null) {
									vls[moves] = MVV_LVA(pcDst, 4);
								}
								moves ++;
							}
							break;
						}
						sqDst += delta;
					}
				}
				break;
			case PIECE_PAWN:
				int sqDst = SQUARE_FORWARD(sqSrc, sdPlayer);
				if (IN_BOARD(sqDst)) {
					int pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = MOVE(sqSrc, sqDst);
						vls[moves] = MVV_LVA(pcDst, 2);
						moves ++;
					}
				}
				if (AWAY_HALF(sqSrc, sdPlayer)) {
					for (int delta = -1; delta <= 1; delta += 2) {
						sqDst = sqSrc + delta;
						if (IN_BOARD(sqDst)) {
							int pcDst = squares[sqDst];
							if (vls == null) {
								if ((pcDst & pcSelfSide) == 0) {
									mvs[moves] = MOVE(sqSrc, sqDst);
									moves ++;
								}
							} else if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								vls[moves] = MVV_LVA(pcDst, 2);
								moves ++;
							}
						}
					}
				}
				break;
			}
		}
		return moves;
	}

	public boolean legalMove(int mv) {
		int sqSrc = SRC(mv);
		int pcSrc = squares[sqSrc];
		int pcSelfSide = SIDE_TAG(sdPlayer);
		if ((pcSrc & pcSelfSide) == 0) {
			return false;
		}

		int sqDst = DST(mv);
		int pcDst = squares[sqDst];
		if ((pcDst & pcSelfSide) != 0) {
			return false;
		}

		switch (pcSrc - pcSelfSide) {
		case PIECE_KING:
			return IN_FORT(sqDst) && KING_SPAN(sqSrc, sqDst);
		case PIECE_ADVISOR:
			return IN_FORT(sqDst) && ADVISOR_SPAN(sqSrc, sqDst);
		case PIECE_BISHOP:
			return SAME_HALF(sqSrc, sqDst) && BISHOP_SPAN(sqSrc, sqDst) &&
					squares[BISHOP_PIN(sqSrc, sqDst)] == 0;
		case PIECE_KNIGHT:
			int sqPin = KNIGHT_PIN(sqSrc, sqDst);
			return sqPin != sqSrc && squares[sqPin] == 0;
		case PIECE_ROOK:
		case PIECE_CANNON:
			int delta;
			if (SAME_RANK(sqSrc, sqDst)) {
				delta = (sqDst < sqSrc ? -1 : 1);				
			} else if (SAME_FILE(sqSrc, sqDst)) {
				delta = (sqDst < sqSrc ? -16 : 16);				
			} else {
				return false;
			}
			sqPin = sqSrc + delta;
			while (sqPin != sqDst && squares[sqPin] == 0) {
				sqPin += delta;
			}
			if (sqPin == sqDst) {
				return pcDst == 0 || pcSrc - pcSelfSide == PIECE_ROOK;
			} else if (pcDst > 0 && pcSrc - pcSelfSide == PIECE_CANNON) {
				sqPin += delta;
				while (sqPin != sqDst && squares[sqPin] == 0) {
					sqPin += delta;
				}
				return sqPin == sqDst;
			} else {
				return false;
			}
		case PIECE_PAWN:
			if (AWAY_HALF(sqDst, sdPlayer) && (sqDst == sqSrc - 1 || sqDst == sqSrc + 1)) {
				return true;
			} else {
				return sqDst == SQUARE_FORWARD(sqSrc, sdPlayer);
			}
		default:
			return false;
		}
	}

	public boolean checked(int sd) {
		int pcSelfSide = SIDE_TAG(sd);
		int pcOppSide = OPP_SIDE_TAG(sd);
		for (int sqSrc = 0; sqSrc < 256; sqSrc ++) {
			if (squares[sqSrc] != pcSelfSide + PIECE_KING) {
				continue;
			}
			if (squares[SQUARE_FORWARD(sqSrc, sd)] == pcOppSide + PIECE_PAWN) {
				return true;
			}
			for (int delta = -1; delta <= 1; delta += 2) {
				if (squares[sqSrc + delta] == pcOppSide + PIECE_PAWN) {
					return true;
				}
			}
			for (int i = 0; i < 4; i ++) {
				if (squares[sqSrc + ADVISOR_DELTA[i]] != 0) {
					continue;
				}
				for (int j = 0; j < 2; j ++) {
					int pcDst = squares[sqSrc + KNIGHT_CHECK_DELTA[i][j]];
					if (pcDst == pcOppSide + PIECE_KNIGHT) {
						return true;
					}
				}
			}
			for (int i = 0; i < 4; i ++) {
				int delta = KING_DELTA[i];
				int sqDst = sqSrc + delta;
				while (IN_BOARD(sqDst)) {
					int pcDst = squares[sqDst];
					if (pcDst > 0) {
						if (pcDst == pcOppSide + PIECE_ROOK || pcDst == pcOppSide + PIECE_KING) {
							return true;
						}
						break;
					}
					sqDst += delta;
				}
				sqDst += delta;
				while (IN_BOARD(sqDst)) {
					int pcDst = squares[sqDst];
					if (pcDst > 0) {
						if (pcDst == pcOppSide + PIECE_CANNON) {
							return true;
						}
						break;
					}
					sqDst += delta;
				}
			}
		}
		return false;
	}

	public boolean isMate() {
		int[] mvs = new int[MAX_GEN_MOVES];
		int moves = generateAllMoves(mvs);
		for (int i = 0; i < moves; i ++) {
			if (makeMove(mvs[i])) {
				undoMakeMove();
				return false;
			}
		}
		return true;
	}

	public int mateValue() {
		return distance - MATE_VALUE;
	}

	public int banValue() {
		return distance - BAN_VALUE;
	}

	public int drawValue() {
		return (distance & 1) == 0 ? -DRAW_VALUE : DRAW_VALUE;
	}

	public int evaluate() {
		int vl = (sdPlayer == 0 ? vlWhite - vlBlack : vlBlack - vlWhite) + ADVANCED_VALUE;
		return vl == drawValue() ? vl - 1 : vl;
	}

	public boolean nullOkay() {
		return (sdPlayer == 0 ? vlWhite : vlBlack) > NULL_OKAY_MARGIN;
	}

	public boolean nullSafe() {
		return (sdPlayer == 0 ? vlWhite : vlBlack) > NULL_SAFE_MARGIN;
	}

	public boolean inCheck() {
		return chkList[moveNum - 1];
	}

	public int repValue(int vlRep) {
		int vlReturn = ((vlRep & 2) == 0 ? 0 : banValue()) + ((vlRep & 4) == 0 ? 0 : -banValue());
	    return vlReturn == 0 ? drawValue() : vlReturn;
	}

	public int repStatus() {
		return repStatus(1);
	}

	public int repStatus(int recur) {
		int recurLocal = recur;
		boolean selfSide = false;
		boolean perpCheck = true;
		boolean oppPerpCheck = true;
		int index = moveNum - 1;
		while (mvList[index] > 0 && pcList[index] == 0) {
			if (selfSide) {
				perpCheck = perpCheck && chkList[index];
				if (keyList[index] == zobristKey) {
					recurLocal --;
					if (recurLocal == 0) {
						return 1 + (perpCheck ? 2 : 0) + (oppPerpCheck ? 4 : 0);
					}
				}
			} else {
				oppPerpCheck = oppPerpCheck && chkList[index];
			}
			selfSide = !selfSide;
			index --;
		}
		return 0;
	}

	public Position mirror() {
		Position pos = new Position();
		pos.clearBoard();
		for (int sq = 0; sq < 256; sq ++) {
			int pc = squares[sq];
			if (pc > 0) {
				pos.addPiece(MIRROR_SQUARE(sq), pc);
			}
		}
		if (sdPlayer == 1) {
			pos.changeSide();
		}
		return pos;
	}

	public int bookMove() {
		if (bookSize == 0) {
			return 0;
		}
		boolean mirror = false;
		int lock = zobristLock >>> 1; // Convert into Unsigned
		int index = binarySearch(lock, bookLock, 0, bookSize);
		if (index < 0) {
			mirror = true;
			lock = mirror().zobristLock >>> 1; // Convert into Unsigned
			index = binarySearch(lock, bookLock, 0, bookSize);
		}
		if (index < 0) {
			return 0;
		}
		index --;
		while (index >= 0 && bookLock[index] == lock) {
			index --;
		}
		int[] mvs = new int[MAX_GEN_MOVES];
		int[] vls = new int[MAX_GEN_MOVES];
		int value = 0;
		int moves = 0;
		index ++;
		while (index < bookSize && bookLock[index] == lock) {
			int mv = 0xffff & bookMove[index];
			mv = (mirror ? MIRROR_MOVE(mv) : mv);
			if (legalMove(mv)) {
				mvs[moves] = mv;
				vls[moves] = bookValue[index];
				value += vls[moves];
				moves ++;
				if (moves == MAX_GEN_MOVES) {
					break;
				}
			}
			index ++;
		}
		if (value == 0) {
			return 0;
		}
		value = Math.abs(random.nextInt()) % value;
		for (index = 0; index < moves; index ++) {
			value -= vls[index];
			if (value < 0) {
				break;
			}
		}
		return mvs[index];
	}

	public int historyIndex(int mv) {
		return ((squares[SRC(mv)] - 8) << 8) + DST(mv);
	}
}