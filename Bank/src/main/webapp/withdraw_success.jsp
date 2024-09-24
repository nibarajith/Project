<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw Success</title>
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
body {
	font-family: Serif;
	background-color: #f4f4f4;
	padding: 20px;
	background-image: url('https://images.pexels.com/photos/904735/pexels-photo-904735.jpeg?auto=compress&cs=tinysrgb&w=600');
	background-repeat: no-repeat;
	background-size: cover;
	margin: 0;
	text-align: center;
}

.container {
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: rgba(255, 255, 255, 0.8);
	max-width: 600px;
	margin: 50px auto;
}

h1 {
	color: #6f42c1;
}

.message {
	margin-top: 20px;
	color: #6f42c1;
	font-size: 18px;
}

a {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: #6f42c1;
	font-size: 18px;
}

a:hover {
	text-decoration: underline;
	color: #5a379d;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Withdrawal Successful</h1>
		<div class="message">
			<p>
				Withdrawal successful. Your new balance is:
				<%= request.getAttribute("newBalance") %>
			</p>
		</div>
		<a href="customer_dashboard.jsp">Back to Dashboard</a>
	</div>
</body>
</html>
