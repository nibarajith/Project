<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Balance</title>
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
body {
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
	background-color: rgba(255, 255, 255, 0.8);
	margin:100px;
}

h1 {
	color: #6f42c1;
}

.balance {
	margin-top: 20px;
	font-size: 24px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Your Balance</h1>
		<div class="balance">
			<%= "Balance: ₹" + request.getAttribute("balance") %>
		</div>
		<a href="customer_dashboard.jsp">Back to Dashboard</a>
	</div>
</body>
</html>