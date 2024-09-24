<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
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

h2 {
	color: #f4f3f6;
    text-shadow: #6f42c1;
    
}

form {
	max-width: 300px;
	margin: auto;
	background-color: rgba(255, 255, 255, 0.8);
	
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 10px;
	margin: 5px 0 20px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #6f42c1;
	color: white;
	padding: 10px 20px;
	margin: 10px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	background-color: #6f42c1;
}

.login-link {
	display: block;
	margin-top: 20px;
	text-decoration: none;
	color: #6f42c1;
    text-shadow: rgb(9, 9, 9);
}

.login-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<h2>Admin Login</h2>

	<form action="adminLogin" method="post">
		<div class="container">
			<label for="username"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="username" required> <label
				for="password"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="password" required>

			<button type="submit">Login</button>
		</div>
	
	<a class="login-link" href="index.jsp">Back to Login</a>
	</form>

</body>
</html>
