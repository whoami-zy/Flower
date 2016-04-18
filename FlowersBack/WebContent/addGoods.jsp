<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK" import="java.sql.*"%>
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
    String goodsName=request.getParameter("goodsName");
	String goodsMaterial=request.getParameter("goodsMaterial");
	String goodsPackage=request.getParameter("goodsPackage");
	String goodsLanguage=request.getParameter("goodsLanguage");
	String goodsPrice=request.getParameter("goodsPrice");
	String goodsCent=request.getParameter("goodsCent");
	String goodsScope=request.getParameter("goodsScope");
	String goodsPlace=request.getParameter("goodsPlace");
	String goodsHabitus=request.getParameter("goodsHabitus");
	String sortName=request.getParameter("sortName");
	String imageId=request.getParameter("imageId");
    if(goodsName.equals("")||goodsPackage.equals("")||goodsPrice.equals("")||sortName.equals("")||goodsCent.equals("")){
		out.print("<script>alert('注册失败，请填写完整的信息');</script>");
		out.print("<script>location='addUsers_menu.html'</script>");
	}else{
		
			String url="jdbc:mysql://localhost:3306/backadmin";
			String dbname="root";
			String dbpass="6482";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,dbname,dbpass);
			String sql="INSERT into goods values(null,'"+ goodsName +"','"+goodsMaterial+"','"+goodsPackage+"','"
					+goodsLanguage+ "','"+goodsPrice+"','"+goodsCent+"','"
							+ goodsScope+"','"+goodsPlace+"','"+goodsHabitus+"','"+sortName+"','"+imageId+"');";
			PreparedStatement pst=(PreparedStatement) conn.prepareStatement(sql);
			try{
				boolean rs=pst.execute();
	     
				out.print("<script>alert('添加商品成功');</script>");
		    	
			}catch(Exception e){
				out.print("<script>alert('添加商品失败');</script>");
	           out.print("<script>location = 'addUsers_menu.html';</script>");
			}
			pst.close();
			conn.close();
		}
		
	

	}catch(Exception e){
		

	}
%>
</body>
</html>