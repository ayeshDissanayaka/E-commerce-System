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

<script src="/resources/js/bootstrap.min.js"></script>
<title>Student Management</title>
</head>
<body>
	<div
		style="padding: 20px; margin: 50px; width:150%; border: solid 2px;">

		<center>
			<div>
				<h1 style="font-size: 35px;">
					<a href="/paf_project/adminDashboard"><b style="color: black">Manage
							Customers</b></a>
				</h1>
			</div>
		</center>
		<form:form action="/paf_project/searchCustomer" method="POST">
			<table align="center">
				<tr>
					<td><input type="text" name="searchVal" style="border:solid 1px;;" /></td>
					<td><input type="submit" name="action" class="btn btn-primary"
						value="Search" /></td>
					<td><a href="/paf_project/viewAllCustomer"><input
							type="button" class="btn btn-primary" value="View All" /></a></td>
					
				</tr>

			</table>
		</form:form>
		<br>
		<table border="1" cellpadding="5px">

			<th style="color: #fff; background-color: #007bff;">ID</th>
			<th style="color: #fff; background-color: #007bff;">First name</th>
			<th style="color: #fff; background-color: #007bff;">Last name</th>
			<th style="color: #fff; background-color: #007bff;">Email</th>
			<th style="color: #fff; background-color: #007bff;">Phone</th>
			<th style="color: #fff; background-color: #007bff;">Country</th>
			<th style="color: #fff; background-color: #007bff;">DOB</th>
			<th style="color: #fff; background-color: #007bff;">City</th>
			<th style="color: #fff; background-color: #007bff;">Postal</th>
			<th style="color: #fff; background-color: #007bff;">Address1</th>
			<th style="color: #fff; background-color: #007bff;">Address2</th>
			<th style="color: #fff; background-color: #007bff;">Reg Date</th>
			<th style="color: #fff; background-color: #007bff;">Status</th>


			<c:forEach var="customer" items="${listCustomer}">
				<tr>

					<td>${customer.cusID}</td>
					<td>${customer.fname}</td>
					<td>${customer.lname}</td>
					<td>${customer.email}</td>
					<td>${customer.phone}</td>
					<td>${customer.country}</td>
					<td>${customer.dob}</td>
					<td>${customer.city}</td>
					<td>${customer.postal}</td>
					<td>${customer.address1}</td>
					<td>${customer.address2}</td>
					<td>${customer.regDate}</td>
					<td>${customer.status}</td>

					<td><a
						href="/paf_project/deleteCustomer?cusID=${customer.cusID}&command=active"><input
							type="submit" name="active" style="background-color: green; border: 0px;" class="btn btn-primary"
							value="Activate" /></a></td>
					<td><a
						href="/paf_project/deleteCustomer?cusID=${customer.cusID}&command=inactive"><input
							type="submit" name="del" style="background-color: red; border: 0px;" class="btn btn-primary"
							value="Deactivate" /></a></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
