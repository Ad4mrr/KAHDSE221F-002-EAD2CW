<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="resources/index.js"></script>
<title>Manage Employees</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>

	<h1 class="manage-emp-title">Manage Employees</h1>
	<div class="mx-10 my-5">
		<form action="register-e-employee" method="POST" class="">
			<div class="">
				<div class="">
					<label class="emp_label" for="nic">NIC</label>
					<input class="" id="nic" name="nic"  type="text"/>
				</div>
				<div class="">
					<label class="emp_label" for="name">Name</label>
					<input class="" id="name" name="name"  type="text"/>
				</div>
				<div class=" ">
					<label class="emp_label" for="department">Department</label>
					<input class="" id="department" name="department"  type="text"/>
				</div>
				<div class=" ">
					<label class="emp_label" for="designation">Designation</label>
					<input class="" id="designation" name="designation"  type="text"/>
				</div>
			</div>
			<div class="w-[100%] flex justify-end ">
				<button class="emp_add">Add new employee</button>
			</div>
		</form>
		
		
	</div>
	
	<form action="load-employees?" method="GET">
		<button type="Submit"> load users</button>
	</form>

</body>
</html>