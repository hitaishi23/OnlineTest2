package com.online.jdbc.util;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBUtil {
	private static String url;
	private static Properties p;
	static {
		try {
			p = new Properties();
			p.load(DBUtil.class.getClassLoader().getResourceAsStream(
					"oracle.properties"));
			String driver = p.getProperty("driver");
			url = p.getProperty("url");

			Class.forName(driver);
		} catch (Exception e) {
			System.out.println("DBUtil.Static Block: "+e);
		}
	}

	public static Connection connect() {
		try {
			return DriverManager.getConnection(url, p);
		} catch (Exception e) {
			System.out.println("ERROR: " + e);
		}
		return null;
	}
}
