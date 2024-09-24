<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.Bank.dao.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Account Deletion</title>
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

table {
	margin: 20px auto;
	width: 80%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
	padding: 10px;
}

th {
	background-color: #6f42c1;
	color: white;
}

.confirm-button, .cancel-button {
	background-color: #6f42c1;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
	margin: 10px;
	display: inline-block;
}

.confirm-button:hover, .cancel-button:hover {
	background-color: #5a379d;
}

.cancel-button {
	background-color: #f44336;
}

.cancel-button:hover {
	background-color: #e53935;
}

p {
	color: #d9534f;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Confirm Account Deletion</h1>
		<%
            HttpSession session2 = request.getSession();
            String accountNo = (session2 != null) ? (String) session2.getAttribute("accountNo") : null;

            if (accountNo == null) {
                response.sendRedirect("customer_login.jsp");
                return;
            }

            DatabaseConnection dbConnection = null;
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            boolean deletionConfirmed = "POST".equalsIgnoreCase(request.getMethod());

            if (deletionConfirmed) {
                try {
                    dbConnection = new DatabaseConnection();
                    conn = dbConnection.getConnection();

                    // Check balance
                    String checkBalanceSQL = "SELECT balance FROM customers WHERE account_no = ? AND deleted = FALSE";
                    stmt = conn.prepareStatement(checkBalanceSQL);
                    stmt.setString(1, accountNo);
                    rs = stmt.executeQuery();
                    
                    if (rs.next()) {
                        double balance = rs.getDouble("balance");
                        if (balance != 0) {
                            %>
		<p>Account cannot be deleted as the balance is not zero.</p>
		<a href="customer_dashboard.jsp" class="cancel-button">Back to Dashboard</a>
		<%
                        } else {
                            // Mark account as deleted
                            String deleteSQL = "UPDATE customers SET deleted = TRUE WHERE account_no = ?";
                            stmt = conn.prepareStatement(deleteSQL);
                            stmt.setString(1, accountNo);
                            stmt.executeUpdate();
                            session.invalidate();
                            %>
		<p>Account successfully deleted.</p>
		<a href="customer_login.jsp" class="confirm-button">Back to Login</a>
		<%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("customer_dashboard.jsp");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                        if (dbConnection != null) dbConnection.closeConnection();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                try {
                    dbConnection = new DatabaseConnection();
                    conn = dbConnection.getConnection();

                    String sql = "SELECT * FROM customers WHERE account_no = ? AND deleted = FALSE";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, accountNo);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        %>
		<table>
			<tr>
				<th>Account No</th>
				<td><%= rs.getString("account_no") %></td>
			</tr>
			<tr>
				<th>Full Name</th>
				<td><%= rs.getString("full_name") %></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%= rs.getString("email") %></td>
			</tr>
			<tr>
				<th>Mobile No</th>
				<td><%= rs.getString("mobile_no") %></td>
			</tr>
			<tr>
				<th>Balance</th>
				<td><%= rs.getDouble("balance") %></td>
			</tr>
		</table>
		<p>Are you sure you want to delete this account?</p>
		<form action="confirm_delete_account.jsp" method="post">
			<button type="submit" class="confirm-button">Confirm</button>
			<a href="customer_dashboard.jsp" class="cancel-button">Cancel</a>
		</form>
		<%
                    } else {
                        response.sendRedirect("customer_dashboard.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("customer_dashboard.jsp");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                        if (dbConnection != null) dbConnection.closeConnection();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
	</div>
</body>
</html>
