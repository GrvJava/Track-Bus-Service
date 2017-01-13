package com.ibm.model;
import com.ibm.dao.*;
import java.sql.*;

public class Login {
	
	public String username;
	public String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String Validate() throws Exception
	{
		
		Statement st=BusConnect.Connect();
		ResultSet rs=st.executeQuery("select * from register where userid='"+username+"' AND password='"+password+"'");
		int count=0;
		while(rs.next())
		{
			count++;
		}
		if(count>0)
		{
			return "success";
		}
		else
		{
		    return "fail";
		}
		
	}
	

}
