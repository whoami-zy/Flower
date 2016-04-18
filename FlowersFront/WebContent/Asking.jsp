<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>慰问探望</title>
<script type="text/javascript">
	function showChild(obj) {
		//var ul1 = document.getElementById("a");
		//var showBtn = document.getElementById("showPic");
		var img = obj.getElementsByTagName('div')[0];
		var button = obj.getElementsByTagName('a')[0];
		if (button.style.display == "block") {
			button.style.display = "none";
			img.style.display='block';
		} else {
			button.style.display = "block";
			img.style.display='none';
		}
	}
</script>
<style>
#main {
	margin: 5px auto;
	width: 940px;
	background: transparent;
	padding-bottom: 30px;
}
body {
	background:black;
	font-family: 'PT Sans', Helvetica, Arial, sans-serif;
	color: #fff;
}
</style>
</head>

<body>
	<div id="main">
		<div>
			<div id="logo_text">

				<h1>
					<a href="Home.html" style="text-decoration: none">网上花店</a>
				</h1>
				<h4>慰问探望</h4>
			</div>
			<hr style="color: #24D369" />
		</div>





		<%
			request.setCharacterEncoding("GBK");
			response.setCharacterEncoding("GBK");
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String username = "root";
			String password = "6482";

			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, username,
					password);
			Statement stmt = conn.createStatement();
			String sql = "SELECT goodsId,goodsName,goodsMaterial,goodsPackage,goodsLanguage,goodsPrice,goodsPlace,imageId FROM goods Where  sortName LIKE'%慰问探望%'";
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
				<td>商品号</td>
				<td>商品名</td>
				<td>商品材料</td>
				<td>商品包装</td>
				<td>商品代表语言</td>
				<td>商品价格</td>
				<td>商品应用范围</td>
				<td>查看照片</td>
				<td>是否购买</td>


			</tr>
			<%
				request.setCharacterEncoding("GBK");
				response.setCharacterEncoding("GBK");
				while (i < pageSize && !rs.isAfterLast()) {

					int goodsId = rs.getInt(1);
					String goodsName = rs.getString(2);
					String goodsMaterial = rs.getString(3);
					String goodsPackage = rs.getString(4);
					String goodsLanguage = rs.getString(5);
					String goodsPrice = rs.getString(6);
					String goodsPlace = rs.getString(7);
					String imageId = rs.getString(8);
			%>
			<tr>
				<td><%=goodsId%></td>
				<td><%=goodsName%></td>
				<td><%=goodsMaterial%></td>
				<td><%=goodsPackage%></td>
				<td><%=goodsLanguage%></td>
				<td><%=goodsPrice%></td>
				<td><%=goodsPlace%></td>
				<td onclick="showChild(this)">
					<div style="display: none;">
						<img src="<%=imageId%>" />
					</div>
					<a style="display: block;">点击查看</a>
				</td>

				<td><a href="Buy.jsp?name=<%=goodsId%>&price=<%=goodsPrice%>">加入购物车</a></td>
			</tr>

			<%
		
				out.println("<br>");
					rs.next();
					i++;
				}
			%>
		</table>
	</div>
	<%
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		out.println("        ");
		if (list_notice < pageCount) {
			out.println(" <a href=Asking.jsp?list_notice="
					+ (list_notice + 1) + ">[下一页] </a>");
		}

		if (list_notice > 1) {
			out.println(" <a href=Asking.jsp?list_notice="
					+ (list_notice - 1) + ">[上一页] </a>");
		}
		out.println("        ");
		out.println("共" + pageCount + "页");
		out.println("        ");
		out.println("第" + list_notice + "页");
		out.println("        ");
		out.println(" <a href=Asking.jsp?list_notice=" + 1 + ">『首页』 </a>");
		out.println("        ");
		out.println(" <a href=Asking.jsp?list_notice=" + pageCount
				+ ">『尾页』 </a>");

		rs.close();
		stmt.close();
		conn.close();
	%>

</body>
</html>