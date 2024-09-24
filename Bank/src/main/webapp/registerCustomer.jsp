<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.Bank.dao.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Customer</title>
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

.approve-button {
	background-color: green;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 10px;
	cursor: pointer;
}

.approve-button:hover {
	background-color: #45a049;
}

.reject-button {
	background-color: #ff0000;;
	color: white;
	padding: 10px 26px;
	text-decoration: none;
	border-radius: 10px;
	cursor: pointer;
}

.reject-button:hover {
	background-color: #6f42c1;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Admin Dashboard</h1>
		<h2>Pending Customer Registrations</h2>
		<table>
			<thead>
				<tr>
					<th>Full Name</th>
					<th>Address</th>
					<th>Mobile No</th>
					<th>Email ID</th>
					<th>Account Type</th>
					<th>Initial Balance</th>
					<th>Date of Birth</th>
					<th>ID Proof</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    DatabaseConnection dbConn = null;
                    try {
                        dbConn = new DatabaseConnection();
                        Connection conn = dbConn.getConnection();

                        String sql = "SELECT * FROM pending_customers";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                        	int id = rs.getInt("id");
                            String fullName = rs.getString("full_name");
                            String address = rs.getString("address");
                            String mobileNo = rs.getString("mobile_no");
                            String emailId = rs.getString("email");
                            String accountType = rs.getString("account_type");
                            double initialBalance = rs.getDouble("initial_balance");
                            String dob = rs.getString("date_of_birth");
                            String idProof = rs.getString("id_proof");
                %>
				<tr>
					<td><%= fullName %></td>
					<td><%= address %></td>
					<td><%= mobileNo %></td>
					<td><%= emailId %></td>
					<td><%= accountType %></td>
					<td><%= initialBalance %></td>
					<td><%= dob %></td>
					<td><%= idProof %></td>
					<td>
						<form action="approveCustomer" method="post">
							<input type="hidden" name="customerId" value="<%= id %>">
							<button type="submit" class="approve-button">Approve</button>
						</form>

						<form action="rejectCustomer" method="post">
							<input type="hidden" name="customerId" value="<%= id %>">
							<button type="submit" class="reject-button">Reject</button>
						</form>

					</td>
				</tr>
				<%
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (dbConn != null) dbConn.closeConnection();
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
