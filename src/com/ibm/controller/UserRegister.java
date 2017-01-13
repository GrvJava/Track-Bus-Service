package com.ibm.controller;
import com.ibm.dao.BusConnect;
import com.ibm.model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserRegister() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String age=request.getParameter("age");
		String email=request.getParameter("email");
		String Gen=request.getParameter("Gen");
		String city=request.getParameter("city");
		String address=request.getParameter("address");
		String dob=request.getParameter("mydate");
		String password=request.getParameter("passwordPwd");
		
		
		try
		{
			Statement st=BusConnect.Connect();
			ResultSet rs=st.executeQuery("select * from password where common='"+password.trim()+"'");
			int cn=0;
			while(rs.next())
			{
				cn++;
			}
			out.print("************************"+cn+"*********************");
			if(cn>=1)
			{
			   request.setAttribute("MSG","Hey ! Your Password is common and match with our Common password database please try agin...");
			   getServletContext().getRequestDispatcher("/Register.jsp").forward(request,response);
			}
			
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
		out.println(username+"||"+age+"||"+email+"||"+Gen+"||"+city+"||"+address+"||"+dob+"||"+password);
	
		Register obj=new Register();
		obj.setUserid(username);
		obj.setAge(age);
		obj.setEmail(email);
		obj.setGen(Gen);
		obj.setCity(city);
		obj.setAddress(address);
		obj.setDob(dob);
		obj.setPassword(password);
		
		
		try
		{
		  String msg=obj.Insert();
		  out.println("----"+msg+"----");
		  if(msg.equals("Success"))
		  {
			  request.setAttribute("msg", "Successfully registered Login here to Continue......");
			getServletContext().getRequestDispatcher("/UserLogin.jsp").forward(request,response);
		  }
		  else
		  {
			  request.setAttribute("msg", "Please Register  again thanx!");
			getServletContext().getRequestDispatcher("/Register.jsp").forward(request,response);
		  }
		}
		catch(Exception e)
		{
			out.println(e);
		}
	
	}

}
