<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>购买</title>
<script type="text/javascript">
function buy(){
	  if(document.getElementById("danshu").value==""){
		  alert('不能为空的数量');
		}else{
			var getdanshu=document.getElementById("danshu").value;
			if(getdanshu!=0){}
			else{
				alert('请正确填写，不能填写数量为0');
			}
		}
		}
</script>
<style>
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video
	{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section
	{
	display: block;
}

body {
	line-height: 1;
}

ol,ul {
	list-style: none;
}

blockquote,q {
	quotes: none;
}

blockquote:before,blockquote:after,q:before,q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

body {
	background: #f8f8f8;
	font-family: 'PT Sans', Helvetica, Arial, sans-serif;

	color: #fff;
}

.page-container {
	margin: 120px auto 0 auto;
}

h1 {
	font-size: 30px;
	font-weight: 700;
	text-shadow: 0 1px 4px rgba(0, 0, 0, .2);
}

form {
	position: relative;
	width: 305px;
	margin: 15px auto 0 auto;
	text-align: center;
}

input {
	width: 270px;
	height: 42px;
	margin-top: 25px;
	padding: 0 15px;
	background: #2d2d2d; /* browsers that don't support rgba */
	background: rgba(45, 45, 45, .15);
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #3d3d3d; /* browsers that don't support rgba */
	border: 1px solid rgba(255, 255, 255, .15);
	-moz-box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
	-webkit-box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
	box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
	font-family: 'PT Sans', Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #fff;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	-o-transition: all .2s;
	-moz-transition: all .2s;
	-webkit-transition: all .2s;
	-ms-transition: all .2s;
}

input:-moz-placeholder {
	color: #fff;
}

input:-ms-input-placeholder {
	color: #fff;
}

input::-webkit-input-placeholder {
	color: #fff;
}

input:focus {
	outline: none;
	-moz-box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset, 0 2px 7px 0
		rgba(0, 0, 0, .2);
	-webkit-box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset, 0 2px 7px 0
		rgba(0, 0, 0, .2);
	box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset, 0 2px 7px 0
		rgba(0, 0, 0, .2);
}

button {
	cursor: pointer;
	width: 300px;
	height: 44px;
	margin-top: 25px;
	padding: 0;
	background: #ef4300;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #ff730e;
	-moz-box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset, 0 2px 7px
		0 rgba(0, 0, 0, .2);
	-webkit-box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset, 0 2px
		7px 0 rgba(0, 0, 0, .2);
	box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset, 0 2px 7px 0
		rgba(0, 0, 0, .2);
	font-family: 'PT Sans', Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: 700;
	color: #fff;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	-o-transition: all .2s;
	-moz-transition: all .2s;
	-webkit-transition: all .2s;
	-ms-transition: all .2s;
}

.error {
	display: none;
	position: absolute;
	top: 27px;
	right: -55px;
	width: 40px;
	height: 40px;
	background: #2d2d2d; /* browsers that don't support rgba */
	background: rgba(45, 45, 45, .25);
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px;
}

.error span {
	display: inline-block;
	margin-left: 2px;
	font-size: 40px;
	font-weight: 700;
	line-height: 40px;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	-o-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
}

* {
	margin: 0;
	padding: 0;
}

body {
	background: #111;
	height: 100%;
}

img {
	border: none;
}

#supersized-loader {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 0;
	width: 60px;
	height: 60px;
	margin: -30px 0 0 -30px;
	text-indent: -999em;
	background: url(../img/progress.gif) no-repeat center center;
}

#supersized {
	display: block;
	position: fixed;
	left: 0;
	top: 0;
	overflow: hidden;
	z-index: -999;
	height: 100%;
	width: 100%;
}

#supersized img {
	width: auto;
	height: auto;
	position: relative;
	display: none;
	outline: none;
	border: none;
}

#supersized.speed img {
	-ms-interpolation-mode: nearest-neighbor;
	image-rendering: -moz-crisp-edges;
} /*Speed*/
#supersized.quality img {
	-ms-interpolation-mode: bicubic;
	image-rendering: optimizeQuality;
} /*Quality*/
#supersized li {
	display: block;
	list-style: none;
	z-index: -30;
	position: fixed;
	overflow: hidden;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #111;
}

#supersized a {
	width: 100%;
	height: 100%;
	display: block;
}

#supersized li.prevslide {
	z-index: -20;
}

#supersized li.activeslide {
	z-index: -10;
}

#supersized li.image-loading {
	background: #111 url(../img/progress.gif) no-repeat center center;
	width: 100%;
	height: 100%;
}

#supersized li.image-loading img {
	visibility: hidden;
}

#supersized li.prevslide img,#supersized li.activeslide img {
	display: inline;
}

#supersized img {
	max-width: none !important
}
#main {
	margin: 5px auto;
	width: 940px;
	background: transparent;
	padding-bottom: 30px;
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
				<h4>购物车</h4>
			</div>
			<hr style="color: #24D369" />
		</div>
	<%
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		String name = new String (request.getParameter("name").getBytes("iso-8859-1"),"GBK"); 
		String price = request.getParameter("price");
		session.setAttribute("name", name);
		session.setAttribute("price", price);
	%>
	<center>
	<div class="page-container">
		<h1>购买</h1>
		<form action="basket.jsp" method="post">
			<input type="text" id="danshu" name="geshu" class="username"placeholder="请输入你要购买的数量" onblur="buy()">
			<button type="submit">确认加入购物车</button>

		</form>

	</div>
</center>
</body>
</html>