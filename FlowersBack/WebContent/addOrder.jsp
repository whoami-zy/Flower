<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			request.setCharacterEncoding("GBK");
			response.setCharacterEncoding("GBK");
			String orderName = request.getParameter("orderName");
			String totalPrice = request.getParameter("totalPrice");
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String dbname = "root";
			String dbpass = "6482";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, dbname,
					dbpass);
			String sql = "INSERT into orders values(null,'" + orderName
					+ "','" + totalPrice + "',null);";
			PreparedStatement pst = (PreparedStatement) conn
					.prepareStatement(sql);
			try {
				boolean rs = pst.execute();

				out.print("<script>alert('下单成功');</script>");

			} catch (Exception e) {
				out.print("<script>alert('下单失败');</script>");
				out.print("<script>location = 'addUsers_menu.html';</script>");
			}
			pst.close();
			conn.close();
		} catch (Exception e) {

		}
	%>
</body>
</html>