<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
		   request.setCharacterEncoding("GBK");
		   response.setCharacterEncoding("GBK");
		 String User = request.getParameter("adminName").replaceAll("'", "");   
		 String Password = request.getParameter("adminPass").replaceAll("'", ""); ;
	      String DBDRIVER = "org.gjt.mm.mysql.Driver";
		  String url = "jdbc:mysql://localhost:3306/backadmin";
		  String user = "root";
	      String dbPassword = "6482";
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection  conn = DriverManager.getConnection(url, user, dbPassword);
		String sql = "SELECT usersName,usersPass FROM users WHERE usersName='"
				+ User + "' AND usersPass='" + Password + "'";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
	    if(rs.next()){
	    	out.print("<script>alert('登陆成功');</script>");
	    	out.print("<script>location = 'Index.html';</script>");
	    	}else{
	    		out.print("<script>alert('登陆失败，请重新登录');</script>");
		    	out.print("<script>location = 'UserLogin.html';</script>");
	    	}
	    rs.close();
		pstmt.close();
		conn.close();
	 
	}catch(Exception e){
		System.out.println(e);
	} 
	%>
</body>
</html>