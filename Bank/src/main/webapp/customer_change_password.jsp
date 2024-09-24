<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
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
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	margin: 50px auto;
}

h1 {
	color: #6f42c1;
}

form {
	display: flex;
	flex-direction: column;
}

input[type="text"], input[type="password"] {
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	padding: 10px;
	background-color: #6f42c1;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #6f42c1;
}

.error {
	color: red;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Change Password</h1>
		<form action="CustomerChangePasswordServlet" method="post">
			<input type="text" name="accountNumber" placeholder="Account Number" value = "<%session.getAttribute("accountNo"); %>"
				required> <input type="password" name="oldPassword"
				placeholder="Current Password" required> <input
				type="password" name="newPassword" placeholder="New Password"
				required>
			<button type="submit">Change Password</button>
		</form>
		<% if (request.getParameter("error") != null) { %>
		<div class="error"><%= request.getParameter("error") %></div>
		<% } %>
	</div>
</body>
</html>
