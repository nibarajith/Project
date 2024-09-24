<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Deleted</title>
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
body {
	font-family: Serif;
	background-color: #f4f4f4;
	margin: 100px;
	padding: 20px;
    background-image: url('https://images.pexels.com/photos/3483098/pexels-photo-3483098.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
	
}

.container {
	
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	margin: auto;
  width: 50%;
  
  padding: 10px;
}

h1 {
	color: #6f42c1;
}

.message {
	font-size: 18px;
	margin: 20px 0;
}

.login-link {
	text-decoration: none;
	color:#6f42c1;
	font-size: 16px;
	
}

.login-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="container">
		<h1>Account Deleted</h1>
		<p class="message">Your account has been deleted successfully .</p>
		<a class="login-link" href="customer_login.jsp">Return to Login</a>
	</div>
</body>
</html>
