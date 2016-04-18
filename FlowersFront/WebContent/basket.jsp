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
		String name=(String)session.getAttribute("name");
		String price=(String)session.getAttribute("price");
		String geshu=request.getParameter("geshu");
		double aa=Double.parseDouble(price);
		double bb=Double.parseDouble(geshu);
		double cc=aa*bb;
		String totalPrice=new Double(cc).toString();
		String url = "jdbc:mysql://localhost:3306/backadmin";
		String dbname = "root";
		String dbpass = "6482";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, dbname,dbpass);
		String sql = "INSERT into orders values(null,'" + name + "','" + totalPrice + "',null,0);";
		PreparedStatement pst = (PreparedStatement) conn.prepareStatement(sql);
		try {
			boolean rs = pst.execute();

			out.print("<script>alert('添加购物车成功');</script>");
			out.print("<script>location = 'Home.html';</script>");

		} catch (Exception e) {
			out.print("<script>alert('添加购物车失败');</script>");
			out.print("<script>location = 'Home.html';</script>");
		}
		pst.close();
		conn.close();
	}catch(Exception e){}
	%>
</body>
</html>