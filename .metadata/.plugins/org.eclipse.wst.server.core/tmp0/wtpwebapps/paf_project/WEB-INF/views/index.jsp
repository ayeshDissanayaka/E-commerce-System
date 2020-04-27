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
<script type="text/javascript" href="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<title>Home Page</title>
</head>
<body>
	<div class="top-nav-bar">
	<form:form action="/paf_project/searchProductHome" method="POST">
		<div class="search-box">
			<a href="/paf_project/"><img src="<c:url value="/resources/images/cart.jpg"/>" class="logo"></a> 
			<input type="text" class="form-control" name="searchVal"> 
			<button type="submit" class="input-group-text">Search</button>
				
		</div>
	
		<div class="menu-bar">
			<ul>
				<li><a href="/paf_project/viewAllCartItems"><i class="fas fa-shopping-cart"
						style="margin-right: 5px;"></i>Shopping Cart</a></li>
				<li><a href="/paf_project/accType"><i class="fas fa-user-plus" style="margin-right:5px;"></i>Sign Up</a></li>
				<li><a href="/paf_project/login"><i class="fas fa-key" style="margin-right:5px;"></i>Login</a></li>
			</ul>
		</div>
	</div>
</form:form>
	<div class="container-fluid" style="float: left;">

		<div class="row">
			<div class="col-sm-3">
				<div class="list-group">
					<span href="" class="list-group-item active"> <b>Categories</b>
						<span class="pull-right" id="slide-submenu"> 
							<i class=""></i>
						</span>
					</span> 
					<c:forEach var="category" items="${listCategory}">
						<a href="/paf_project/clickCategory/?catID=${category.catID}" class="list-group-item"><font color="black"> ${category.catName}</font> </a> 
					</c:forEach>
				</div>
			</div>

			<c:forEach var="product" items="${listProduct}">
			<div class="col-sm-3">
				<div class="card">
				
					<img class="card-img-top" src="<c:url value="${product.prodImage}"/>" width="200px"
						height="160px">
					<div class="card-body">
						<center>
							<h4 class="card-title">${product.name}</h4>
						</center>
						<center>
							<h6 class="card-title">
								Brand - ${product.brand}
								</h4>
						</center>
						<center>
							<h5 class="card-title" style="color: orange;">$${product.unitPrice}</h5>
						</center>
						<center>
							<a href="/paf_project/addToCart?prodID=${product.prID}" class="btn btn-primary"
								style="background-color: green; border: none;">Add to Cart</a>
						</center>
					</div>
					
				</div>
			</div>
			</c:forEach>



















		</div>


	</div>
</body>
</html>