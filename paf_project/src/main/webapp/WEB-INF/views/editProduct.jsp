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
<title>Edit Product</title>
</head>
<body>
	<div style="margin-top: 50px;">
		<main class="login-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div align="center" class="card-header">
							<h4>
								<b>Edit Product Form</b>

							</h4>
						</div>
						<div class="card-body">
							<form:form method="post" action="/paf_project/editSaveProduct"
								modelAttribute="product">


								<div class="col-md-6">
									<form:input type="text" path="prID" class="form-control"
										name="prID" required="required" hidden="hidden"
										autofocus="autofocus" />
								</div>
						</div>

						<div class="form-group row">
							<label for="email_address"
								class="col-md-4 col-form-label text-md-right"><h4>Product
									Name</h4></label>
							<div class="col-md-6">
								<form:input type="text" path="name" class="form-control"
									name="name" required="required" autofocus="autofocus" />
							</div>
						</div>

						<div class="form-group row">
							<label for="email_address"
								class="col-md-4 col-form-label text-md-right"><h4>Unit
									Price</h4></label>
							<div class="col-md-6">
								<form:input type="text" path="unitPrice" class="form-control"
									name="unitPrice" required="required" autofocus="autofocus" />
							</div>
						</div>

						<div class="form-group row">
							<label for="email_address"
								class="col-md-4 col-form-label text-md-right"><h4>Brand</h4></label>
							<div class="col-md-6">
								<form:input type="text" path="brand" class="form-control"
									name="brand" required="required" autofocus="autofocus" />
							</div>
						</div>


						<div class="form-group row">
							<label for="email_address"
								class="col-md-4 col-form-label text-md-right"><h4>Description
								</h4></label>
							<div class="col-md-6">
								<form:textarea class="form-control" rows="10" columns="40"
									path="description" name="description" required="required"
									autofocus="autofocus" />
							</div>
						</div>
						
						<div class="form-group row">
							<label for="email_address"
								class="col-md-4 col-form-label text-md-right"><h4>Product Image</h4></label>
							<div class="col-md-6">
								<form:input type="file" path="prodImage" class="form-control"
									name="brand" required="required" autofocus="autofocus" />
							</div>
						</div>

						<div class="form-group row">
							<label for="email_address"
								class="col-md-4 col-form-label text-md-right"><h4>Category
								</h4></label>
							<div class="col-md-6">
								<form:select path="catID" style="color:gray;">
									<c:forEach var="category" items="${listCategory}">
										<option value="${category.catID}" name="catID">${category.catName}</option>
									</c:forEach>
								</form:select>

							</div>
						</div>








						<div class="col-md-6 offset-md-4" style="margin-bottom:50px;">
							<button type="submit" class="btn btn-primary">Update</button>
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