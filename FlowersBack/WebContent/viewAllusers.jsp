<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>查看所有的用户</h1>
		<%
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String username = "root";
			String password = "6482";

			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, username,password);
			Statement stmt = conn.createStatement();
			String sql = "SELECT usersId,usersName,usersTureName,usersPhone,usersAddress,usersE_mail FROM users";
			ResultSet rs = stmt.executeQuery(sql);
			rs.last();

			int pageSize = 5; //每页显示的记录数 
			int pageCount = 0; //总页数 
			int rowCount = rs.getRow(); //获取记录总数
			//out.println(rowCount);
			pageCount = (rowCount + pageSize - 1) / pageSize;
			int list_notice = 1; //当前页 
			//取得用户所指定的页 
			String goToPage = request.getParameter("list_notice");
			if (goToPage == null) {
				goToPage = "1";
			}
			//转换成整形 
			try {
				list_notice = Integer.parseInt(goToPage);
			} catch (NumberFormatException ex) {
				list_notice = 1;
			}
			//当前页小于等于第一页 则按第一页算 如果 当前页大于等于总页数则为最后页 
			if (list_notice <= 1) {
				list_notice = 1;
			} else if (list_notice >= pageCount) {
				list_notice = pageCount;
			}
			//游标的位置 (当前页 - 1) * 页面大小 + 1 
			int posion = (list_notice - 1) * pageSize + 1;
			//设置游标的位置 
			rs.absolute(posion);
			//循环显示表中的数据 pageSize(每页所显示的记录) 
			//rs.isAfterLast() 游标是否在最后一行之后 说明后面已经没记录 
			int i = 0;
		%>
		<table border="1">
			<tr>
				<td>用户号</td>
					<td>用户名</td>
					<td>真实姓名</td>
					<td>电话</td>
					<td>地址</td>
					<td>Email</td>
					<td>删除此用户</td>
			</tr>
			<%
				while (i < pageSize && !rs.isAfterLast()) {
					int usersId = rs.getInt(1);
					String usersName = rs.getString(2);
					String usersTureName = rs.getString(3);
					String usersPhone = rs.getString(4);
					String usersAddress = rs.getString(5);
					String usersEmail = rs.getString(6);
			%>
			<tr>
				<td><%=usersId%></td>
					<td><%=usersName%></td>
					<td><%=usersTureName%></td>
					<td><%=usersPhone%></td>
					<td><%=usersAddress%></td>
					<td><%=usersEmail%></td>
					<td><a href="deleteUserSuccess.jsp?id=<%=usersId%>">删除</a></td>
			</tr>

			<%
				out.println("<br>");
					rs.next();
					i++;
				}
			%>
		</table>
		<%
			out.println("<br>");
			out.println("<br>");
			out.println("<br>");
			out.println("<br>");
			out.println("        ");
			if (list_notice < pageCount) {
				out.println(" <a href=viewAllusers.jsp?list_notice="
						+ (list_notice + 1) + ">[下一页] </a>");
			}

			if (list_notice > 1) {
				out.println(" <a href=viewAllusers.jsp?list_notice="
						+ (list_notice - 1) + ">[上一页] </a>");
			}
			out.println("        ");
			out.println("共" + pageCount + "页");
			out.println("        ");
			out.println("第" + list_notice + "页");
			out.println("        ");
			out.println(" <a href=viewAllusers.jsp?list_notice=" + 1 + ">『首页』 </a>");
			out.println("        ");
			out.println(" <a href=viewAllusers.jsp?list_notice=" + pageCount
					+ ">『尾页』 </a>");

			rs.close();
			stmt.close();
			conn.close();
		%>
		</center>
</body>
</html>