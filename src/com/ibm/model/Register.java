package com.ibm.model;
import com.ibm.dao.*;
import java.sql.*;

public class Register {
	public String userid;
	public String age;
	public String email;
	public String Gen;
	public String city;
	public String address;
	public String dob;
	public String password;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGen() {
		return Gen;
	}
	public void setGen(String gen) {
		Gen = gen;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	
	public String Insert() throws Exception
	{
		Statement st=BusConnect.Connect();
		st.executeUpdate("insert into Register values('"+userid+"','"+age+"','"+email+"','"+Gen+"','"+city+"','"+address+"','"+dob+"','"+password+"')");
		return "Success";
	}

}
