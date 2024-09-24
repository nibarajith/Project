<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw</title>
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

form {
	margin-top: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
}

input[type="number"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #6f42c1;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #5a379d;
}

.message {
	margin-top: 20px;
	color: #d9534f;
}

a {
	color: #6f42c1;
	text-decoration: none;
	display: inline-block;
	margin-top: 20px;
}

a:hover {
	color: #5a379d;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Withdraw</h1>
		<form action="WithdrawServlet" method="post">
			<label for="amount">Withdraw Amount</label>
			<input type="number" id="amount" name="amount" required>
			<button type="submit">Withdraw</button>
		</form>
		<div class="message">
			<%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
		</div>
		<a href="customer_dashboard.jsp">Back to Dashboard</a>
	</div>
</body>
</html>
