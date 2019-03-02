<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="com.demo.service.*,com.demo.model.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.ProductService"/>
<%	
	
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	Double price = Double.parseDouble(request.getParameter("price"));
	String seller = request.getParameter("seller");
	int number = service.update(id, name, price, seller);
	out.println("before service.update()");
	response.sendRedirect("index.jsp");
%>
</body>
</html>