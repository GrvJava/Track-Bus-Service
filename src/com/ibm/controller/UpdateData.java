package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.*;
import java.sql.*;

public class UpdateData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateData() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String service=request.getParameter("service");
		String station=request.getParameter("station");
		String lati=request.getParameter("lati");
		String longi=request.getParameter("longi");
		String curl=request.getParameter("curl");
		String des=request.getParameter("des");
	
	    try
	    {
		Statement st=BusConnect.Connect();
		st.executeUpdate("update busdetails set station='"+station+"',latitude='"+lati+"',longitude='"+longi+"',curlocation='"+curl+"',destination='"+des+"' where busservice='"+service+"'");
		HttpSession session=request.getSession();
		session.setAttribute("waypoints",curl);
		session.setAttribute("start",station);
		session.setAttribute("end",des);
		request.setAttribute("MSG","UDATION FOR BUS SERVICE SUCCESSFULL");
		getServletContext().getRequestDispatcher("/UpdateDataAdmin.jsp").forward(request,response);
	    }
	    catch(Exception e)
	    {
	    	System.out.println(e);
	    }
	
	    }

}
