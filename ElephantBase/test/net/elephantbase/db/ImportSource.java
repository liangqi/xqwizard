package net.elephantbase.db;

import net.elephantbase.util.ClassPath;

public class ImportSource {
	public static void main(String[] args) {
		DBUtil.importSource(ClassPath.getInstance("../etc/MysqlDB.sql"));
	}
}