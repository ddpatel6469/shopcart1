<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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
	String id = request.getParameter("id");
	Product p = service.getRecordById(Integer.parseInt(id));
%>
<form action="update.jsp" method="post">
<input type="hidden" name="id" value="<%=p.getId() %>"/>
<table>
<tr>
		<td>Name</td>
		<td><input type="text" name="name" value="<%=p.getName() %>"/></td>
	</tr>
	
	<tr>
		<td>Price</td>
		<td><input type="text" name="price" value="<%=p.getPrice() %>"/></td>
	</tr>
	
	<tr>
		<td>Seller</td>
		<td><input type="text" name="seller" value="<%=p.getSeller() %>"/></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="update"/></td>
	</tr>
</table>
</form>
</body>
</html>