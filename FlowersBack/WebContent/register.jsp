<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
<% 
try{
	request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");
    String usersName=request.getParameter("usersName");
	String usersPass=request.getParameter("usersPass");
	String usersRepass=request.getParameter("usersRepass");
	String usersPassQuestion=request.getParameter("usersPassQuestion");
	String usersPassReply=request.getParameter("usersPassReply");
	String usersTrueName=request.getParameter("usersTrueName");
	String usersAddress=request.getParameter("usersAddress");
	String usersPhone=request.getParameter("usersPhone");
	String usersE_mail=request.getParameter("usersE_mail");
    if(usersName.equals("")||usersPass.equals("")||usersPhone.equals("")||usersE_mail.equals("")||usersAddress.equals("")){
		out.print("<script>alert('注册失败，请填写完整的信息');</script>");
		out.print("<script>location='addUsers_menu.html'</script>");
	}else{
		if(usersPass.equals(usersRepass)){
			String url="jdbc:mysql://localhost:3306/backadmin";
			String dbname="root";
			String dbpass="6482";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,dbname,dbpass);
			String sql="INSERT into users values(null,'"+ usersName +"','"+usersPass+"','"+usersRepass+"','"
					+usersPassQuestion+ "','"+usersPassReply+"','"+usersTrueName+"','"
							+ usersAddress+"','"+usersPhone+"','"+usersE_mail+"');";
			PreparedStatement pst=(PreparedStatement) conn.prepareStatement(sql);
			try{
				boolean rs=pst.execute();
	     
				out.print("<script>alert('注册成功');</script>");
		    	
			}catch(Exception e){
				out.print("<script>alert('注册失败');</script>");
	           out.print("<script>location = 'addUsers_menu.html';</script>");
			}
			pst.close();
			conn.close();
		}
		else{
			out.print("<script>alert('注册失败，两次输入密码不同');</script>");
			out.print("<script>location='addUsers_menu.html'</script>");
		}
	}
	

	}catch(Exception e){
		

	}
%>
</body>
</html>