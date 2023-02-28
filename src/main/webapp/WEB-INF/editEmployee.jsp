<%@page import="eadcw2.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/index.js"></script>
<title>Edit Employee</title>
<link rel="stylesheet" href="../style.css" />
</head>
<body>
<% 
	ArrayList<Employee> list = (ArrayList<Employee>) request.getAttribute("userList");

		String nic = list.get(0).getNic();
		int id = list.get(0).getId();
		String name = list.get(0).getName();
		String department = list.get(0).getDepartment();
		String designation = list.get(0).getDesignation();

%>
	
	<h1 class="edit-emp-title">Edit Employee</h1>
	<div class="">
		<form action="/ead2cw/employee/employee-update/?id=<%= id %>" method="POST" class="">
			<div class="">
				<div class="">
					<label class="emp_label2" for="nic">NIC</label>
					<input class="" id="nic" name="nic" value="<%= nic %>" type="text"/>
				</div>
				<div class="">
					<label class="emp_label2" for="name">Name</label>
					<input class="" id="name" name="name" value="<%= name %>" type="text"/>
				</div>
				<div class="">
					<label class="emp_label2" for="department">Department</label>
					<input class="" id="department" name="department" value="<%= department %>"  type="text"/>
				</div>
				<div class=" ">
					<label class="emp_label2" for="designation">Designation</label>
					<input class="" id="designation" name="designation" value="<%= designation %>"  type="text"/>
				</div>
			</div>
			<div class="emp_label3">
				<button class="">Update</button>
			</div>
		</form>
		
		
	</div>
	
	<form action="load-employees" method="GET">
		<button type="Submit"> load users</button>
	</form>

</body>
</html>