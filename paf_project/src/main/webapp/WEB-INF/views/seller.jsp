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



<title>Seller Management</title>
</head>
<body>







	<div align="center"
		style="padding: 20px; margin: 50px; width:120%; border: solid 2px;">

		<center>
			<div>
				<h1 style="font-size: 35px;">
					<a href="/paf_project/adminDashboard"><b style="color: black">Manage
							Sellers</b></a>
				</h1>
			</div>


			<form:form action="/paf_project/searchSeller" method="POST">
				<table align="center">
					<tr>
						<td><input type="text" name="searchVal"
							style="border: solid 1px" /></td>
						<td><input type="submit" class="btn btn-primary"
							name="action" value="Search" /></td>
						<td><a href="/paf_project/viewAllSeller"><input
								type="button" value="View All" class="btn btn-primary" /></a></td>
					</tr>

				</table>
			</form:form>
			<br>
			<table border="1" cellpadding="3px">

				<th style="color: #fff; background-color: #007bff;">Supp ID</th>
				<th style="color: #fff; background-color: #007bff;">First name</th>
				<th style="color: #fff; background-color: #007bff;">Last name</th>
				<th style="color: #fff; background-color: #007bff;">Email</th>
				<th style="color: #fff; background-color: #007bff;">Phone</th>
				<th style="color: #fff; background-color: #007bff;">Country</th>
				<th style="color: #fff; background-color: #007bff;">DOB</th>
				<th style="color: #fff; background-color: #007bff;">City</th>
				<th style="color: #fff; background-color: #007bff;">State</th>
				<th style="color: #fff; background-color: #007bff;">Address1</th>
				<th style="color: #fff; background-color: #007bff;">Address2</th>
				<th style="color: #fff; background-color: #007bff;">Reg Date</th>
				<th style="color: #fff; background-color: #007bff;">Status</th>


				<c:forEach var="seller" items="${listSeller}">
					<tr>

						<td>${seller.suppID}</td>
						<td>${seller.fname}</td>
						<td>${seller.lname}</td>
						<td>${seller.email}</td>
						<td>${seller.phone}</td>
						<td>${seller.country}</td>
						<td>${seller.dob}</td>
						<td>${seller.city}</td>
						<td>${seller.state}</td>
						<td>${seller.address1}</td>
						<td>${seller.address2}</td>
						<td>${seller.regDate}</td>
						<td>${seller.status}</td>

						<td><a
							href="/paf_project/deleteSeller?suppID=${seller.suppID}&command=active"><input
								type="submit" class="btn btn-primary"
								style="background-color: green; border: 0px;" name="active"
								value="Activate" /></a></td>
						<td><a
							href="/paf_project/deleteSeller?suppID=${seller.suppID}&command=inactive"><input
								type="submit" style="background-color: red; border: 0px;"
								name="del" class="btn btn-primary" value="Deactivate" /></a></td>

					</tr>
				</c:forEach>
			</table>

		</center>


	</div>







</body>
</html>
