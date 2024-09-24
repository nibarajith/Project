<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.Bank.dao.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Customer Details</title>
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
body {
	
	background-color: #f4f4f4;


	background-image: url('https://images.pexels.com/photos/904735/pexels-photo-904735.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-repeat: no-repeat;
    
    background-size: cover;
	font-family: Serif;
	margin: 100px;
	text-align: center;
}

.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width:50%;
	margin-left:25%;
}

h1 {
	color: #6f42c1;
}

.form-group {
	margin-bottom: 5px;
	width:100%;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="email"], input[type="tel"] {
	width: 50%;
	padding: 8px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #6f42c1;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top:10px;
}

input[type="submit"]:hover {
	background-color: #45a049;
	
}
</style>
</head>
<body>
	<div class="container">
		<h1>Modify Customer Details</h1>
		<form action="modifyCustomer" method="post">
			<div class="form-group">
				<label for="accountNo">Account Number:</label> <input type="text"
					id="accountNo" name="accountNo" required>
			</div>
			<div class="form-group">
				<label for="fullName">Full Name:</label> <input type="text"
					id="fullName" name="fullName" required>
			</div>
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					id="address" name="address" required>
			</div>
			<div class="form-group">
				<label for="mobileNo">Mobile Number:</label> <input type="tel"
					id="mobileNo" name="mobileNo" required>
			</div>
			<div class="form-group">
				<label for="emailId">Email ID:</label> <input type="email"
					id="emailId" name="emailId" required>
			</div>
			<input type="submit" value="Update Details">
		</form>
	</div>
</body>
</html>
