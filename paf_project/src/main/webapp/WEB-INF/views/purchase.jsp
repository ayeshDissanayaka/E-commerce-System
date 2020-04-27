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
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/cart.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/custom.css"/>">
<script type="text/javascript"
	href="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<title>View Purchases</title>
</head>
<body>
	<div>
		<div class="top-nav-bar">
			<form:form action="/paf_project/searchProductHome" method="POST">
				<div class="search-box">
					<a href="/paf_project/"><img
						src="<c:url value="/resources/images/cart.jpg"/>" class="logo"></a>
					<input type="text" class="form-control" name="searchVal">
					<button type="submit" class="input-group-text">Search</button>
					<a href="/paf_project/editCustomer"><input type="button" value="My Profile" style="width:200px; height:40px; margin:8px; border-radius: 5px; background-color: #007bff; border:none; color:white"/></a>
				</div>

				<div class="menu-bar">
					<ul>
						<li><a href="/paf_project/viewAllPurchase"><i
								class="fas fa-money-bill" style="margin-right: 5px;"></i>Purchase
								History</a></li>
						<li><a href="/paf_project/viewAllCartItems"><i
								class="fas fa-shopping-cart" style="margin-right: 5px;"></i>Shopping
								Cart</a></li>
						<li><a href="/paf_project/userLogout"><i
								class="fas fa-key" style="margin-right: 5px;"></i>Logout</a></li>
					</ul>
				</div>
			</form:form>
		</div>
	</div>



	<div class="container-fluid">
		<br>
		<h4 align="center">
			<b>Purchase History (Sorted by Date)</b>
		</h4>
		<br>
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th class="text-center" style="width:">Product</th>
					<th class="text-center" style="width:">Order ID</th>
					<th class="text-center" style="width:">Product ID</th>
					<th class="text-center" style="width:">Price</th>
					<th class="text-center" style="width:">Qty</th>
					<th class="text-center" style="width:">Sub Total</th>
					<th class="text-center" style="width:">Payment Type</th>
					<th class="text-center" style="width:">Shipping Company</th>
					<th style="width:" class="text-center">Date</th>
				</tr>
			</thead>

			<c:forEach var="purchase" items="${listPurchase}">
				<tbody>
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img src="<c:url value="${purchase.prodImage}"/>"
										class="img-responsive" style="width: 100px; height: 100px;" />
								</div>
								<div class="col-sm-10">
									<h4 style="margin-left: 100px; margin-top: 35px;">${purchase.name}</h4>
								</div>
							</div>
						</td>
						<td data-th="Order ID" class="text-center">${purchase.orderID}</td>
						<td data-th="Product ID" class="text-center">${purchase.productID}</td>
						<td data-th="Price" class="text-center">${purchase.price}</td>
						<td data-th="Qty" class="text-center">${purchase.qty}</td>
						<td data-th="Qty" class="text-center">${purchase.qty * purchase.price}</td>
						<td data-th="Payment Type" class="text-center">${purchase.payName}</td>
						<td data-th="Shipping Company" class="text-center">${purchase.company}</td>
						<td data-th="Date" class="text-center">${purchase.checkedDate}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>



</body>
</html>