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
	href="<c:url value="/resources/css/dash.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/customStylesheet.css"/>" />
<title>Student Management</title>
</head>
<body>
	<div align="center" style="padding: 20px; margin: 50px; width: auto; border: solid 2px;">

		<center>
			<div>
				<h1 style="font-size: 35px;">
					<a href="/paf_project/adminDashboard"><b style="color: black">Manage
							Category</b></a>
				</h1>
			</div>
		</center>
		<form:form action="/paf_project/searchCategory" method="POST">
			<table>
				<tr>
					<td><input type="text" name="searchVal" style="border:solid 1px;" /></td>
					<td><input type="submit" name="action" class="btn btn-primary" value="Search" /></td>
					<td><a href="/paf_project/viewAllCategory"><input
							type="button" value="View All" class="btn btn-primary" /></a></td>
					<td><a href="/paf_project/addCategory"><input
							type="button" value="Add Category" class="btn btn-primary" /></a></td>
				</tr>

			</table>
		</form:form>
		<br>
		<table border="1" width="100%" class="tabx">

			<th style="color: #fff; background-color: #007bff;">Category ID</th>
			<th style="color: #fff; background-color: #007bff;">Description</th>
			<th style="color: #fff; background-color: #007bff;">Category Name</th>
			<th style="color: #fff; background-color: #007bff;">Status</th>
			<th style="color: #fff; background-color: #007bff;">Added Date</th>



			<c:forEach var="category" items="${listCategory}">
				<tr>

					<td>${category.catID}</td>
					<td>${category.description}</td>
					<td>${category.catName}</td>
					<td>${category.status}</td>
					<td>${category.addedDate}</td>

					<td align="center"><a href="/paf_project/editCategory?cID=${category.catID}"><input
							type="button" class="btn btn-primary" value="Edit" /></a></td>
					<td align="center"><a
						href="/paf_project/deleteCategory?catID=${category.catID}&command=active"><input
							type="submit" style="background-color: green; border: 0px;" class="btn btn-primary" name="active" value="Activate" /></a></td>
					<td align="center"><a
						href="/paf_project/deleteCategory?catID=${category.catID}&command=inactive"><input
							type="submit" style="background-color: red; border: 0px;" class="btn btn-primary" name="del" value="Deactivate" /></a></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
