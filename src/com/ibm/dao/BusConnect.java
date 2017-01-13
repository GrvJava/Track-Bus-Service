package com.ibm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BusConnect {
	
	public static String url="jdbc:db2://localhost:50000/SRTC";
	public static String username="prashant";
	public static String  password="mivas";
	

	public static Statement Connect() throws Exception
	{
		
		 
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection(url,username,password);
		System.out.println("successfully connected with SRTC database");
		Statement st=con.createStatement();
		return st;
	}

}
