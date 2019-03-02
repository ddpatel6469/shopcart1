<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="com.demo.service.*,com.demo.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.ProductService"/>
<%
	String id1 = request.getParameter("id");
	int num = service.delete(id1);
	response.sendRedirect("index.jsp");
	
%>
</body>
</html>