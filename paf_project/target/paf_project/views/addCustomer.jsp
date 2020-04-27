<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/views/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Edit</title>
</head>
<body>
	<h1>Add Student</h1>
	<form:form method="post" action="/paf_project/saveCustomer" modelAttribute="customer">
		<table>

			<tr>
				<td>First name</td>
				<td><form:input path="fname" /></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><form:input path="lname" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><form:input path="email" /></td>
			</tr>

			<tr>
				<td>Phone</td>
				<td><form:input path="phone" /></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><form:input path="country" /></td>
			</tr>
			<tr>
				<td>Date of birth</td>
				<td><form:input path="dob" /></td>
			</tr>

			<tr>
				<td>City</td>
				<td><form:input path="city" /></td>
			</tr>
			<tr>
				<td>Postal</td>
				<td><form:input path="postal" /></td>
			</tr>
			<tr>
				<td>Addressline 1</td>
				<td><form:input path="address1" /></td>
			</tr>

			<tr>
				<td>Addressline2</td>
				<td><form:input path="address2" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><form:input path="password" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit" />
				<form:input type="reset" path="" value="Clear" />
			</tr>

		</table>
	</form:form>
</body>
</html>