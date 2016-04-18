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
<center>
        
		<%
		 request.setCharacterEncoding("GBK");
		 response.setCharacterEncoding("GBK");
		 String orderstime=request.getParameter("orderstime");
		 String url = "jdbc:mysql://localhost:3306/backadmin";
		//数据库连接用户
		 String user = "root";
		 String dbPassword = "6482";
	%>
		<%
			//声明数据库对象
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;//声明数据库结果集
		%>
		<%
			//try..catch处理连接数据库是产生的异常
			try {
				Class.forName("org.gjt.mm.mysql.Driver");
				conn = DriverManager.getConnection(url, user, dbPassword);
				String sql = "SELECT ordersId,ordersName,ordersPrice,ordersDatetime FROM orders WHERE ordersDatetime LIKE '%"+ orderstime + "%'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
		<center>
			<table border="1" width="90%">
				<!-- 行输出  tr -->
				<tr>
					<td>订单号</td>
					<td>订单名</td>
					<td>订单价格</td>
					<td>下单时间</td>
				</tr>
				<%
					while (rs.next()) {
						int orderdId = rs.getInt(1);
						String ordersName = rs.getString(2);
						String orsersPrice = rs.getString(3);
						String ordersDatetime = rs.getString(4);
				
							 
				%>
				<tr>
					<td><%=orderdId%></td>
					<td><%=ordersName%></td>
					<td><%=orsersPrice%></td>
					<td><%=ordersDatetime%></td>
					<td><a href="deleteOrderSuccess.jsp?id=<%=orderdId%>">删除</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</center>
		<%
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				rs.close();
				pstmt.close();
				conn.close();

			}
		%>

	</center>
</body>
</html>