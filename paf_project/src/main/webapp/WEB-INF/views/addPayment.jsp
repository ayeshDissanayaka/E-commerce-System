<%
	if(session.getAttribute("emailAdmin") == null){
		response.sendRedirect("/paf_project/admin");
	}

%>
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
	href="<c:url value="/resources/css/customStylesheet.css"/>" />
<script src="/resources/js/bootstrap.min.js"></script>
<title>Edit Category</title>
</head>
<body  background="<c:url value="/resources/images/back1.png"/>">
	<div style="margin-top: 50px;">
		<main class="login-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div align="center" class="card-header">
							<h4>
								<b>Add Payment Form</b>

							</h4>
						</div>
						<div class="card-body">
							<form:form method="post" action="/paf_project/savePayment"
								modelAttribute="payment">


								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right"><h4>Payment
											Type</h4></label>
									<div class="col-md-6">
										<form:input type="text" path="payType" class="form-control"
											name="payType" required="required" autofocus="autofocus" />
									</div>
								</div>


								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary">Add Payment</button>
									<input type="reset" value="Clear" class="btn btn-primary">


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