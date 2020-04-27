<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/views/includes.jsp"%>
<%
	if(session.getAttribute("emailAdmin") == null){
		response.sendRedirect("/paf_project/admin");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/dash.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/customStylesheet.css"/>" />
<title>Product Management</title>
</head>
<body>
	<div align="center"
		style="padding: 20px; margin: 50px; width: auto; border: solid 2px;">

		<center>
			<div>
				<h1 style="font-size: 35px;">
					<a href="/paf_project/adminDashboard"><b style="color: black">Manage
							Inventory</b></a>
				</h1>
			</div>
			<form:form action="/paf_project/searchProduct" method="POST">
				<table>
					<tr>
						<td><input type="text" name="searchVal"
							style="border: solid 1px;" /></td>
						<td><input type="submit" name="action"
							class="btn btn-primary" value="Search" /></td>
						<td><a href="/paf_project/viewAllProduct"><input
								type="button" class="btn btn-primary" value="View All" /></a></td>
						
					</tr>

				</table>
			</form:form>
			<br>
			<table border="1" width="100%">

				<th style="color: #fff; background-color: #007bff;">Product ID</th>
				<th style="color: #fff; background-color: #007bff;">Name</th>
				<th style="color: #fff; background-color: #007bff;">Unit Price</th>
				<th style="color: #fff; background-color: #007bff;">Brand</th>
				<th style="color: #fff; background-color: #007bff;">Description</th>
				<th style="color: #fff; background-color: #007bff;">Category ID</th>
				<th style="color: #fff; background-color: #007bff;">Added Date</th>
				<th style="color: #fff; background-color: #007bff;">Status</th>
				<th style="color: #fff; background-color: #007bff;">Admin</th>



				<c:forEach var="product" items="${listProduct}">
					<tr>

						<td>${product.prID}</td>
						<td>${product.name}</td>
						<td>${product.unitPrice}</td>
						<td>${product.brand}</td>
						<td>${product.description}</td>
						<td>${product.catID}</td>
						<td>${product.addedDate}</td>
						<td>${product.status}</td>
						<td>${product.admin}</td>

						
						<td align="center"><a
							href="/paf_project/deleteProduct?prodID=${product.prID}&command=active&user=admin"><input
								type="submit" class="btn btn-primary" name="active" style="background-color:green; border:none;" value="Activate" /></a></td>
						<td align="center"><a
							href="/paf_project/deleteProduct?prodID=${product.prID}&command=inactive&user=admin"><input
								type="submit" class="btn btn-primary" name="del" style="background-color:red; border:none;" value="Deactivate" /></a></td>

					</tr>
				</c:forEach>
			</table>
		</center>
	</div>
</body>
</html>
