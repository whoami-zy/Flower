<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
			String id = request.getParameter("id");
			String username = request.getParameter("username");
			String referer = request.getHeader("referer");//获取上个页面的网址
			String DBDRIVER = "org.gjt.mm.mysql.Driver";
			String url="jdbc:mysql://localhost:3306/backadmin";
			String dbname="root";
			String dbpass="6482";
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conn=DriverManager.getConnection(url, dbname, dbpass);
			//String sql="DELETE FROM  users WHERE usersId='"+ id + "'";
			//if(referer.equals("http://localhost:8080/backadmin/viewUserByUsersName.jsp")){
				if(referer.equals("http://localhost:8080/backadmin/viewUsersByUserName.jsp")){
			String sql1="DELETE FROM  users WHERE usersName='"+ username + "'";
			PreparedStatement pst=conn.prepareStatement(sql1);
			
			try{
				boolean rs=pst.execute();
				System.out.print("rs"+rs);
				
				
				if(!rs){
				
				out.print("<script>alert('删除成功');</script>");
		    	out.print("<script>location='viewAllusers.jsp';</script>");
				}else{
		    	out.print("<script>alert('删除失败');</script>");
		        out.print("<script>location = 'viewAllusers.jsp';</script>");
				}
			}catch(Exception e){
	         
				
			}
		
			pst.close();
			conn.close();
			}else{
				String sql="DELETE FROM  users WHERE usersId='"+ id + "'";
				PreparedStatement pst1=conn.prepareStatement(sql);
				
				try{
					boolean rs=pst1.execute();
					out.print("<script>alert('删除成功');</script>");
			    	out.print("<script>location='viewAllusers.jsp';</script>");
				}catch(Exception e){
		         
					out.print("<script>alert('删除失败');</script>");
		           out.print("<script>location = 'viewAllusers.jsp';</script>");
				}
			
				pst1.close();
				conn.close();
			}
			
		}
	catch(Exception e){
		
	}
	%>
</body>
</html>