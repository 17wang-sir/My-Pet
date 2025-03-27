<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	    <% String username = (String)session.getAttribute("username");
				   if(username!=null)%>
				   <a href="">欢迎您！<%= username %>管理员</a> &nbsp;&nbsp;<a href="logoutservlet">注销</a>
		</div> 
</body>
</html>