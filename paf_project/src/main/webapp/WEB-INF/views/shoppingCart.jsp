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
	href="<c:url value="/resources/css/custom.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/cart.css"/>">
<script type="text/javascript"
	href="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<title>Home Page</title>
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

				</div>

				<div class="menu-bar">
					<ul>
						<li><a href="/paf_project/viewAllPurchase"><i
								class="fas fa-money-bill" style="margin-right: 5px;"></i>Purchase
								History</a></li>
						<li><a href="/paf_project/viewAllCartItems"><i
								class="fas fa-shopping-cart" style="margin-right: 5px;"></i>Shopping
								Cart</a></li>
						<li><a href="/paf_project/userLogout"><i class="fas fa-key"
								style="margin-right: 5px;"></i>Logout</a></li>
					</ul>
				</div>
			</form:form>
		</div>
	</div>



	<div class="container-fluid">
		<h4 align="center">Shopping Cart</h4>
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Subtotal</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>

			<p style="display: none;">${total = 0}</p>
			<c:forEach var="cartItems" items="${listCartItems}">
				<tbody>
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img src="<c:url value="${cartItems.prodImage}"/>"
										class="img-responsive" style="width: 100px; height: 100px;" />
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${cartItems.prodName}</h4>
									<p>${cartItems.description}</p>
								</div>
							</div>
						</td>
						<td data-th="Price">$${cartItems.price}</td>

						<form:form method="post"
							action="/paf_project/editSaveCartItems?itemID=${cartItems.itemID}"
							modelAttribute="cartItems">
							<td data-th="Quantity"><form:input type="number"
									class="form-control text-center" path="qty"
									value="${cartItems.qty}" /></td>



							<td data-th="Subtotal" class="text-center">$${cartItems.qty
								* cartItems.price}</td>
							<td class="actions" data-th="">
								<button type="submit" class="btn btn-info btn-sm">
									<i class="fa fa-refresh"></i>
								</button>
						</form:form>
						<a href="/paf_project/deleteCartItems?itemID=${cartItems.itemID}"><button
								type="submit" class="btn btn-danger btn-sm">
								<i class="fa fa-trash-o"></i>
							</button></a>
						</td>
					</tr>
				</tbody>
				<p style="display: none;">${total = total + (cartItems.qty * cartItems.price)}</p>
				<p style="display: none;">${cartID = cartItems.cartID}</p>
			</c:forEach>

			<tfoot>

				<tr>
					<td><a href="/paf_project/home" class="btn btn-warning"><i
							class="fa fa-angle-left"></i> Continue Shopping</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong
						style="color: green;"><h4>Total $${total}</h4></strong></td>
				</tr>

				<tr>
					<form:form method="post" action="/paf_project/saveOrder?cartID=${cartID}" modelAttribute="cusOrder">
						<td colspan="6" align="center">
							<form:input hidden="hidden" value="${cartID}" path="cartID" /> 
							<form:input hidden="hidden" value="${total}" path="total" />

							<h5 style="color: gray;">Select Shipping Company</h5> 
							<form:select path="shipID"
								style="width:20%; border:solid 2px #007bff; margin-bottom:10px;">
								<c:forEach var="shipping" items="${listShipping}">
									<option value="${shipping.shipID}" name="catID">${shipping.company}</option>
								</c:forEach>
							</form:select>


							<h5 style="color: gray;">Select Payment Type</h5> 
							<form:select path="payID" style="width:20%; border:solid 2px #007bff; margin-bottom:10px;">
								<c:forEach var="payment" items="${listPayment}">
									<option value="${payment.payID}" name="catID">${payment.payType}</option>
								</c:forEach>
							</form:select>
						</td>
				</tr>


				<tr>
					<td colspan="6"><button type="submit"
							class="btn btn-success btn-block">
							Checkout <i class="fa fa-angle-right"></i>
						</button></td>
				</tr>

				</form:form>











			</tfoot>
		</table>
	</div>



</body>
</html>