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
	<form:form id="myForm" method="post" action="/paf_project/editSaveCustomer" modelAttribute="customer">
		<table>

			<tr>
				<td>Customer ID</td>
				<td><form:input type="text" name="cID" path="cusID" /></td>
			</tr>
			<tr>
				<td>First name</td>
				<td><form:input type="text"  path="fname" /></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><form:input type="text"  path="lname" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><form:input type="text"  path="email" /></td>
			</tr>

			<tr>
				<td>Phone</td>
				<td><form:input type="text"  path="phone" /></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><form:input type="text"  path="country" /></td>
			</tr>
			<tr>
				<td>Date of birth</td>
				<td><form:input type="date"  path="dob" /></td>
			</tr>

			<tr>
				<td>City</td>
				<td><form:input type="text"  path="city" /></td>
			</tr>
			<tr>
				<td>Postal</td>
				<td><form:input type="text"  path="postal" /></td>
			</tr>
			<tr>
				<td>Addressline 1</td>
				<td><form:input type="text"  path="address1" /></td>
			</tr>

			<tr>
				<td>Addressline2</td>
				<td><form:input  type="text" path="address2" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><form:input type="text"  path="password" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit" />
				<input type="reset" value="Reset"/>
			</tr>

		</table>
	</form:form>
</body>
</html>