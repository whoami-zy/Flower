<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>登陆</title>
</head>
<body>
<FORM action="login" method="post" >
  <p>
    <INPUT type=hidden name=col>
    <INPUT type=hidden name=cate>
</p>
 
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2"><img src="images/Admin_Login1.gif" width="600" height="126"></td>
    </tr>
    <tr>
      <td width="508" valign="top" background="images/Admin_Login2.gif"><table width="508" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="37" colspan="6">&nbsp;</td>
        </tr>
        <tr>
          <td width="75" rowspan="2">&nbsp;</td>
          <td width="126"><font color="#043BC9">用户名称：</font></td>
          <td width="39" rowspan="2">&nbsp;</td>
          <td width="131"><font color="#043BC9">用户密码：</font></td>
          <td width="34">&nbsp;</td>
          <td width="103">&nbsp;</td>
        </tr>
        <tr>
          <td><input type="text" size=15 name=adminName></td>
          <td><input type=password size=12 name=adminPass></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
      <td>
       

      <input type="image" name="Submit" src="images/Admin_Login3.gif" style="width:92px; HEIGHT: 126px;"></td>
      
    </tr>
  </table>
</FORM>
</body>
</html>