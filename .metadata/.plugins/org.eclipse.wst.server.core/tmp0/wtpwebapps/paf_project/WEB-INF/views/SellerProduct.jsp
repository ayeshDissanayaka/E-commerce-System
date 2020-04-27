<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/views/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.css"/>">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/custom.css"/>">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	href="<c:url value="/resources/js/bootstrap.min.js"/>"></script>



<title>Seller Product Management</title>
</head>
<body>
	<div class="top-nav-bar">
		<div class="search-box">
			<a href="/paf_project/sellerDashboard"><img
				src="<c:url value="/resources/images/cart.jpg"/>" class="logo"></a>
			<a href="/paf_project/editSeller"><input type="button"
				value="My Profile"
				style="width: 200px; height: 40px; margin: 8px; border-radius: 5px; background-color: #007bff; border: none; color: white" /></a>
		</div>

		<div class="menu-bar">
			<ul>
				<li><a href="/paf_project/viewAllOrderSeller"><i
						class="fas fa-luggage-cart" style="margin-right: 5px;"></i>Manage
						Orders</a></li>
				<li><a href="/paf_project/viewAllProductSeller"><i
						class="fas fa-tasks" style="margin-right: 5px;"></i>Manage
						Products </a></li>
				<li><a href="/paf_project/sellerLogout"><i class="fas fa-key"
						style="margin-right: 5px;"></i>Logout</a></li>
			</ul>
		</div>
	</div>


	<div align="center"
		style="padding: 20px; margin: 50px; width: auto; border: solid 2px;">

		<center>
			<div>
				<h1 style="font-size: 35px;">
					<b style="color: black">Manage
							Seller Product</b>
				</h1>
			</div>
			<form:form action="/paf_project/searchProductSeller" method="POST">
				<table>
					<tr>
						<td><input type="text" name="searchVal"
							style="border: solid 1px;" /></td>
						<td><input type="submit" name="action"
							class="btn btn-primary" value="Search" style="margin-left: 5px;" /></td>
						<td><a href="/paf_project/viewAllProductSeller"><input
								type="button" class="btn btn-primary" value="View All"
								style="margin-left: 5px;" /></a></td>
						<td><a href="/paf_project/addProduct"><input
								type="button" class="btn btn-primary" value="Add Product"
								style="margin-left: 5px;" /></a></td>

					</tr>

				</table>
			</form:form>
			<br>
			<table border="1" width="100%">
				<th style="color: #fff; background-color: #007bff;">Prod Image</th>
				<th style="color: #fff; background-color: #007bff;">Product ID</th>
				<th style="color: #fff; background-color: #007bff;">Name</th>
				<th style="color: #fff; background-color: #007bff;">Unit Price</th>
				<th style="color: #fff; background-color: #007bff;">Brand</th>
				<th style="color: #fff; background-color: #007bff;">Description</th>
				<th style="color: #fff; background-color: #007bff;">Category ID</th>
				<th style="color: #fff; background-color: #007bff;">Added Date</th>
				<th style="color: #fff; background-color: #007bff;">Status</th>
				<th style="color: #fff; background-color: #007bff;">Admin</th>



				<c:forEach var="productSeller" items="${listProductSeller}">
					<tr>

						<td align="center"><img
							src="<c:url value="${productSeller.prodImage}"/>" width="80px"
							height="80px" /></td>
						<td align="center">${productSeller.prID}</td>
						<td align="center">${productSeller.name}</td>
						<td align="center">${productSeller.unitPrice}</td>
						<td align="center">${productSeller.brand}</td>
						<td align="center">${productSeller.description}</td>
						<td align="center">${productSeller.catID}</td>
						<td align="center">${productSeller.addedDate}</td>
						<td align="center">${productSeller.status}</td>
						<td align="center">${productSeller.admin}</td>

						<td align="center"><a
							href="/paf_project/editProduct?pID=${productSeller.prID}"><input
								type="button" class="btn btn-primary" value="Edit" /></a></td>

						<td align="center"><a
							href="/paf_project/deleteProduct?prodID=${productSeller.prID}&command=active&user=seller"><input
								type="submit" class="btn btn-primary" name="active"
								style="background-color: green; border: none;" value="Activate" /></a></td>
						<td align="center"><a
							href="/paf_project/deleteProduct?prodID=${productSeller.prID}&command=inactive&user=seller"><input
								type="submit" class="btn btn-primary" name="del"
								style="background-color: red; border: none;" value="Deactivate" /></a></td>

					</tr>
				</c:forEach>
			</table>
		</center>
	</div>

</body>
</html>