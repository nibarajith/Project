<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*, com.Bank.dao.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Registration</title>
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
body {
	font-family: Serif;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
    background-image: url('https://images.pexels.com/photos/904735/pexels-photo-904735.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-repeat: no-repeat;
    background-size: cover;
}

.container {
	background-color: rgba(255, 255, 255, 0.8);
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000;
	width: 500px; /* Increased width to accommodate two-column layout */
	padding: 20px;
}

h2 {
	background-color:  #6f42c1;
    ; 
	color: black;
	margin: -20px -20px 20px -20px;
	padding: 20px;
	border-radius: 10px 10px 0 0;
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
    background-color: rgba(255, 255, 255, 0.8);
}

.form-group {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
    background-color: rgba(255, 255, 255, 0.8);
    box-shadow: 0px 0px 10px 0px #000;
}

label {
	margin-right: 10px;
	font-weight: bold;
	width: 30%; 
	text-align: right;
}

input[type=text], input[type=password], input[type=email], input[type=number],
input[type=date], select {
	width: 65%; 
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

button {
	background-color: #6f42c1;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	font-size: 16px;
	border-radius: 5px;
	margin-top: 10px;
}

button:hover {
	background-color: #5a3291;
}

.change-password-link, .login-link {
	display: block;
	margin: 20px;
	text-decoration: none;
	color: rgb(253, 250, 250);
	font-size: 15px;
	text-align: center;
}

.change-password-link:hover, .login-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	
    <div class="container">
        <h2>Customer Registration</h2>
    
			<form action="customerRegistration" method="post">
            <div class="form-group">
                <label for="fullName"><b>Full Name</b></label> 
                <input type="text"placeholder="Enter Full Name" name="full_name" required> 
                </div>
                <div class="form-group">   
                    <label for="address"><b>Address</b></label>
                     <input type="text" placeholder="Enter Address" name="address" required> </div>
                    
                <div class="form-group">
                    <label for="mobileNo"><b>Mobile No</b></label> 
                    <input type="text"placeholder="Enter Mobile No" name="mobile_no" required> </div>
                    <div class="form-group">
                    <label for="email"><b>Email Id</b></label> <input type="email"
                    placeholder="Enter Email Id" name="email_id" required></div> 
                    <div class="form-group">
                   <label for="accountType"><b>Account Type</b></label> <select
				name="account_type" required>
				<option value="Saving">Saving Account</option>
				<option value="Current">Current Account</option>
			</select></div>
                <div class="form-group">
                <label for="initialBalance"><b>InitialBalance (minimum 1000)</b></label> 
                <input type="number" placeholder="Enter Initial Balance"name="initial_balance" min="1000" required> </div>
                <div class="form-group">
                    <label for="dob"><b>Date of Birth</b></label> <input type="date" name="dob" required> </div>
                    <div class="form-group">
                    <label for="idProof"><b>ID Proof</b></label> 
                    <input type="text" placeholder="Enter ID Proof" name="id_proof" required>
                </div>
                
    
                <button type="submit">Register</button>
                </form>
            </div>
 
        <a class="login-link" href="customer_login.jsp">Back to Login</a>
    
    </body>
    


</html>
