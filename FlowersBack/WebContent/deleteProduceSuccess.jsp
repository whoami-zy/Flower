<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
		   request.setCharacterEncoding("GBK");
		   response.setCharacterEncoding("GBK");
		try {

			String id = request.getParameter("id");
			String referer = request.getHeader("referer");//获取上个页面的网址
			String DBDRIVER = "org.gjt.mm.mysql.Driver";
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String dbname = "root";
			String dbpass = "6482";
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conn = DriverManager.getConnection(url, dbname,dbpass);
				String sql = "DELETE FROM  produce WHERE produceId='" + id
						+ "'";
				PreparedStatement pst1 = conn.prepareStatement(sql);

				try {
					boolean rs = pst1.execute();
					if (!rs) {

						out.print("<script>alert('删除成功');</script>");
						out.print("<script>location='viewAllProduce.jsp';</script>");
					} else {
						out.print("<script>alert('删除失败');</script>");
						out.print("<script>location = 'viewAllProduce.jsp';</script>");
					}
				} catch (Exception e) {

				}

				pst1.close();
				conn.close();
		} catch (Exception e) {

		}
	%>

</body>
</html>