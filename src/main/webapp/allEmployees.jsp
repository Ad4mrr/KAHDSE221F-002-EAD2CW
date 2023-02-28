<%@page import="eadcw2.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/index.js"></script>
<title>Manage Employees</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>



	<div class=" mx-10 border rounded-sm">
		<table class="">
		  <thead class="">
		    <tr>
		      <th scope="col" class="">NIC</th>
		      <th scope="col" class="">Name</th>
		      <th scope="col" class="">Department</th>
		      <th scope="col" class="">Designation</th>
		      <th scope="col" class="">Joined</th>
		      <th scope="col" class="">Take Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  
<% 
	ArrayList<Employee> list = (ArrayList<Employee>) request.getAttribute("userList");
	for(int i=0; i <list.size() ; i++){	
		
		int id = list.get(i).getId();
		String nic = list.get(i).getNic();
		String name = list.get(i).getName();
		String department = list.get(i).getDepartment();
		String designation = list.get(i).getDesignation();
		String joinedDate = list.get(i).getJoinedDate();
%>


		    <tr>
		      <th class=""><%= nic %></th>
		      <td class=""><%= name %></td>
		      <td class=""><%= department %></td>
		      <td class=""><%= designation %></td>
		      <td class=""><%= joinedDate %></td>
		      <td class=" ">
		 
		      <form action="employee/employee-page-update" method="GET">
		      <input type="hidden" name="id" value="<%= id %>">
		      	<button class="">Edit</button>
		      
		      </form>
		      	<button onClick="handleDelete('<%= id %>')" class="" >Delete</button>

		      </td>
		    </tr>
<%	
	}
%>

		  </tbody>
	</table>
	</div>
	<a href="/ead2cw">
	
	
	</a>
	
	<script >
	async function handleDelete(id){
		const result = await fetch("http://localhost:8080/ead2cw/employee/employee-delete/?id="+id , {method: 'delete'} )
		console.log(result)
		window.location.reload();
	}
	
	
	
	</script>
</body>
</html>