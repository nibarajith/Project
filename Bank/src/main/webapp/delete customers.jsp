<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.Bank.dao.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Customer</title>
<style>
    html, body {
    height: 100%;
    margin: 0;
    overflow: hidden;
}
body {
	
	background-color: #f4f4f4;
	padding: 20px;
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
}

h1 {
	color: #6f42c1;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: left;
}

th {
	background-color: #6f42c1;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.delete-button {
	background-color: #f44336;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}

.delete-button:hover {
	background-color: #d32f2f;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Delete Customer</h1>
		<table>
			<thead>
				<tr>
					<th>Account Number</th>
					<th>Full Name</th>
					<th>Address</th>
					<th>Mobile No</th>
					<th>Email ID</th>
					<th>Account Type</th>
					<th>Initial Balance</th>
					<th>Date of Birth</th>
					<th>ID Proof</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<% 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        DatabaseConnection db = new DatabaseConnection();
                        conn = db.getConnection();
                        String sql = "SELECT * FROM customers";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String accountNo = rs.getString("account_no");
                            String fullName = rs.getString("full_name");
                            String address = rs.getString("address");
                            String mobileNo = rs.getString("mobile_no");
                            String emailId = rs.getString("email");
                            String accountType = rs.getString("account_type");
                            double initialBalance = rs.getDouble("balance");
                            String dob = rs.getString("date_of_birth");
                            String idProof = rs.getString("id_proof");
                %>
				<tr>
					<td><%= accountNo %></td>
					<td><%= fullName %></td>
					<td><%= address %></td>
					<td><%= mobileNo %></td>
					<td><%= emailId %></td>
					<td><%= accountType %></td>
					<td><%= initialBalance %></td>
					<td><%= dob %></td>
					<td><%= idProof %></td>
					<td>
						<form action="deleteCustomer" method="post">
							<input type="hidden" name="accountNo" value="<%= accountNo %>">
							<button type="submit" class="delete-button">Delete</button>
						</form>
					</td>
				</tr>
				<% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
			</tbody>
		</table>
	</div>
</body>
</html>
