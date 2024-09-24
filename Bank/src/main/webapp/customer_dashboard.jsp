<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
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
}

.dashboard-links {
    margin: 20px 0;
}

.dashboard-link {
    display: block;
    margin: 10px 0;
    padding: 10px 20px;
    background-color: #6f42c1;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.dashboard-link:hover {
    background-color: #495057;
}

</style>
</head>
<body>
    <div class="sidebar">
        <h2>Dashboard</h2>
        
        <a href="ViewBalanceServlet">View Balance</a>
        <a href="ViewTransactionsServlet">View Transactions</a>
        <a href="WithdrawServlet">Withdraw</a>
        <a href="DepositServlet">Deposit</a>
        <a href="confirm_delete_account.jsp">Delete Account</a>
        <a href="customer_login.jsp">Logout</a>
    </div>
    <div class="main-content">
        
        <header>
            <h1>Welcome  <% String accountNo = (String) session.getAttribute("accountNo"); %>
        <%out.println(accountNo); %></h1>
        </header>
            
        </div>
  
    </div>
</body>
</html>

