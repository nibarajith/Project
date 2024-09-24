<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Login</title>
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
    body {
        margin: 100px;
        text-align: center;
        background-image: url('https://images.pexels.com/photos/904735/pexels-photo-904735.jpeg?auto=compress&cs=tinysrgb&w=600');
        background-repeat: no-repeat;
        background-size: cover;
        font-family: Serif;
    }
    
    h2 {
        color: #6f42c1;
    }
    
    form {
        max-width: 400px;
        margin: auto;
        background-color: rgba(255, 255, 255, 0.8); /* Slightly transparent background */
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); /* Softer shadow */
    }
    
    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px;
        margin: 10px 0 20px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    
    button {
        background-color: #6f42c1;
        color: white;
        padding: 12px 20px;
        margin: 20px 0;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
        font-size: 16px; 
        transition: background-color 0.3s; 
    }
    
    button:hover {
        background-color: #5a3291;
    }
    
    .register-link {
        margin-top: 30px;
        color:#faf9fc;

    }
    
    
    .login-link {
        display: block;
        margin-top: 30px;
        text-decoration: none;
        color: #ffffff;
        font-size: 14px; 
    }
    
    .login-link:hover {
        text-decoration: underline;
    }
    
    .change-password-link {
        display: block;
        margin-top: 20px;
        text-align: center;
        color: #f4f1f8;
        text-decoration: none;
        font-size: 14px; 
    }
    
    .change-password-link:hover {
        text-decoration: underline;
    }
    
    .error-message {
        color: red;
        margin-bottom: 15px;
    }
</style>
</head>
<body>
    
    <h2>Customer Login</h2>

    <div class="container">
        <form action="customerLogin" method="post">
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
            <div class="error-message"><%= errorMessage %></div>
            <%
                }
            %>
            <label for="accountNo"><b>Account Number</b></label>
            <input type="text" placeholder="Enter Account Number" name="accountNo" required> 
            
            <label for="password"><b>Password</b></label> 
            <input type="password" placeholder="Enter Password" name="password" required>

            <button type="submit">Login</button>
        </form>
        <a href="customer_change_password.jsp" class="change-password-link">Change Password</a>
    </div>

    <div class="register-link">
        <p>Dont have an account <a href="customer_registration.jsp">Register </a></p>
    </div>
    <a class="login-link" href="index.jsp">Back to Login</a>

</body>
</html>
