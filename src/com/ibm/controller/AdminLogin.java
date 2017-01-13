package com.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.model.Admin;

public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminLogin() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Admin obj=new Admin();
		obj.setUsername(username);
		obj.setPassword(password);
		
		try
		{
			String msg=obj.Validate();
			out.println(msg);
			
			if(msg.equals("success"))
			{
				HttpSession session=request.getSession();
				session.setAttribute("admin",username);
				getServletContext().getRequestDispatcher("/AdminHome.jsp").forward(request, response);
			}
			else
			{
				getServletContext().getRequestDispatcher("/AdminLogin.jsp").forward(request, response);
			}
		}
		catch(Exception e)
		{
		out.println(e);	
		}
		
	}

}
