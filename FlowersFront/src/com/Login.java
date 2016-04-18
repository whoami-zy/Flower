package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("GBK");
			 response.setCharacterEncoding("GBK");
			 String User = request.getParameter("adminName").replaceAll("'", "");   
			 String Password = request.getParameter("adminPass").replaceAll("'", ""); ;
		      String url = "jdbc:mysql://localhost:3306/backadmin";
			  String user = "root";
		      String dbPassword = "6482";
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection  conn = (Connection) DriverManager.getConnection(url, user, dbPassword);
			String sql = "SELECT adminName,adminPass FROM admin WHERE adminName='"
					+ User + "' AND adminPass='" + Password + "'";
			PreparedStatement pstmt=(PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs=(ResultSet) pstmt.executeQuery();
			PrintWriter out=response.getWriter();
			if(rs.next()){
		    	out.print("<script>alert('µÇÂ½³É¹¦');</script>");
		    	out.print("<script>location = 'Index.html';</script>");
		    	}else{
		    		out.print("<script>alert('µÇÂ½Ê§°Ü£¬ÇëÖØÐÂµÇÂ¼');</script>");
			    	out.print("<script>location = 'UserLogin.html';</script>");
		    	}
		    rs.close();
			pstmt.close();
			conn.close();
		 
		}catch(Exception e){
			System.out.println(e);
		} 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
