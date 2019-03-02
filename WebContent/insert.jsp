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
	String name = request.getParameter("name");
	double price = Double.parseDouble (request.getParameter("price"));
	String seller = request.getParameter("seller");
	int num = service.insert(name, price, seller);
	response.sendRedirect("index.jsp");
%>
	
</body>
</html>