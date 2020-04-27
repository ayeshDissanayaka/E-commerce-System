<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/views/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Management</title>
</head>
<body>
	<form:form action="/paf_project/searchCustomer" method="POST">
		<table>
			<tr>
				<td><input type="text" name="searchVal" /></td>
				<td><input type="submit" name="action" value="Search" /></td>
				<td><a href="/paf_project/viewAll"><input type="button" value="View All" /></a></td>
				<td><a href="/paf_project/addCustomer"><input type="button" value="Add Customer" /></a></td>
			</tr>

		</table>
	</form:form>
	<br>
	<table border="1">

		<th>ID</th>
		<th>First name</th>
		<th>Last name</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Country</th>
		<th>DOB</th>
		<th>City</th>
		<th>Postal</th>
		<th>Address1</th>
		<th>Address2</th>
		<th>Reg Date</th>
		<th>Status</th>
		

		<c:forEach var="customer" items="${listCustomer}" >
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
					<td><a href="/paf_project/editCustomer?cID=${customer.cusID}"><input type="button" value="Edit" /></a></td>
					<td><a href="/paf_project/deleteCustomer?cusID=${customer.cusID}&command=active"><input type="submit" name = "active" value="Activate" /></a></td>
					<td><a href="/paf_project/deleteCustomer?cusID=${customer.cusID}&command=inactive"><input type="submit" name = "del" value="Deactivate" /></a></td>
		
			</tr>
		</c:forEach>
	</table>
</body>
</html>