<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK" import="java.sql.*"%>
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
		 String goodsprice=request.getParameter("goodsprice");
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
				String sql = "SELECT goodsId,goodsName,goodsMaterial,goodsPackage,goodsLanguage,goodsPrice,goodsPlace,goodsHabitus FROM goods WHERE goodsPrice='"+ goodsprice + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(); 
		%>
		<center>
			<table border="1" width="90%">
				<!-- 行输出  tr -->
				<tr>
					<td>商品号</td>
					<td>商品名</td>
					<td>商品材料</td>
					<td>商品包装</td>
					<td>商品代表语言</td>
					<td>商品价格</td>
					<td>商品应用范围</td>
					<td>是否上架</td>
				</tr>
				<%
					while (rs.next()) {

							int goodsId = rs.getInt(1);
							String goodsName = rs.getString(2);
							String goodsMaterial = rs.getString(3);
							String goodsPackage = rs.getString(4);
							String goodsLanguage = rs.getString(5);
							String goodsPrice = rs.getString(6);
							String goodsPlace = rs.getString(7);
							String goodsHabitus = rs.getString(8);
							 
				%>
				<tr>
					<td><%=goodsId%></td>
					<td><%=goodsName%></td>
					<td><%=goodsMaterial%></td>
					<td><%=goodsPackage%></td>
					<td><%=goodsLanguage%></td>
					<td><%=goodsPrice%></td>
					<td><%=goodsPlace%></td>
					<td><%=goodsHabitus%></td>
					<td><a href="deleteGoodsSuccess.jsp?id=<%=goodsId%>">删除</a></td>
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