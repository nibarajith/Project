<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap">
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
body {
    background-image: url('https://images.pexels.com/photos/129492/pexels-photo-129492.jpeg?auto=compress&cs=tinysrgb&w=600');
	font-family: Serif;
	background-color: #f8f9fa;
	margin: 0;
	display: flex;
	height: 100vh;
    background-repeat: no-repeat;
    background-size: cover;
	
}

.sidebar {
	width: 250px;
	background-color: #343a40;
	color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 20px;
}

.sidebar a {
	color: #fff;
	text-decoration: none;
	padding: 15px;
	width: 100%;
	text-align: center;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

.sidebar a:hover {
	background-color: #495057;
}

.main-content {
	flex: 1;
	padding: 20px;
}

header {
	background-color: #6f42c1;
	color: #fff;
	padding: 20px;
	text-align: center;
	font-size: 24px;
	margin:auto;
}


h2 {
	color: #6f42c1;
	margin-bottom: 20px;
}

form {
	text-align: center;
	margin-bottom: 10px;
}

form input[type="submit"] {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	font-size: 16px;
	transition: background-color 0.3s;
}

form input[type="submit"]:hover {
	background-color: #0056b3;
}

</style>
</head>
<body>
	<div class="sidebar">
		<h2>Dashboard</h2>
		
		<a href="registerCustomer.jsp">Register Customers</a>
		<a href="view_customers.jsp">View Customers</a>
		<a href="delete customers.jsp">Delete Customers</a>
		<a href="modify_customers.jsp">Modify Customers</a>
		<a href="adminlogin.jsp">Logout</a>
	</div>
	<div class="main-content">
		<header>
			 Admin Dashboard
		</header>

		
		
	</div>
</body>
</html>
