<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/views/includes.jsp"%>

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
<title>Login</title>
</head>
<body>


	<div style="margin-top: 50px;">
		<main class="login-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div align="center" class="card-header">
							<h4><b>Login Form</b></h4>
						</div>
						<div class="card-body">
							<form:form id="loginForm" action="/paf_project/loginProceed"
								method="post" modelAttribute="login">
								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right"><h4>E-Mail
											Address</h4></label>
									<div class="col-md-6">
										<input type="text" id="email_address" class="form-control"
											name="username" path="username" required autofocus>
									</div>
								</div>

								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right"><h4>Password</h4></label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control"
											path="password" name="password" required>
									</div>
								</div>

								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right"><h4>Login
											Type</h4></label>
									<div class="col-md-6">
										<label class="radio-inline" style="margin:10px;"> <input type="radio"
											name="optradio" value="cus" checked>&nbsp <font color = "gray">Customer</font>
										</label> <label class="radio-inline"> <input type="radio"
											name="optradio" value = "sell">&nbsp <font color="gray">Seller</font>
										</label>
									</div>
								</div>


								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary">Login</button>
									<a href="/paf_project/accType"><input type="button"
										value="Register" class="btn btn-primary">

										</button></a>
								</div>
						</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>


		</main>
	</div>



</body>
</html>