<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@	page import="com.demo.service.*,com.demo.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"/>
<script type="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.ProductService"/>

<a href="insert.html"><img src="images/insert1.png"/></a>

<%
	ArrayList<Product> list = service.viewAll();
	if(list!=null && list.size()>0){
%>
<table class="table table-striped table-hover">
	<tr class="success">
		<td>ID</td>
		<td>Name</td>
		<td>Price</td>
		<td>Seller</td>
	</tr>
<%
		for(Product p : list){
%>	
	<tr class="info">
		<td><%= p.getId() %></td>
		<td><%= p.getName() %></td>
		<td><%= p.getPrice() %></td>
		<td><%= p.getSeller() %></td>
		<td><a href="delete.jsp?id=<%= p.getId() %>"><img src="images/delete1.png"/></a></td>
		<td><a href="updateForm.jsp?id=<%=p.getId()%>&name=<%=p.getName()%>&price=<%=p.getPrice()%>&seller=<%=p.getSeller()%>"><img src="images/edit1.png"/></a></td>
	</tr>
<%
		}
		}
	else
		out.println("No Products");
%>
		
</table>
</body>
</html>