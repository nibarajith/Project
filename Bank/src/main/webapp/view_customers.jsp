<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.Bank.dao.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Customers</title>
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
	max-width: 1200px;
	margin: 50px auto;
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

.back-button {
	padding: 10px 20px;
	background-color: #6f42c1;
	color: white;
	text-decoration: none;
	border-radius: 4px;
	margin-top: 20px;
	display: inline-block;
}

.back-button:hover {
	background-color: #5a379d;
}
</style>
</head>
<body>
	<div class="container">
		<h1>All Customer Details</h1>
		<table>
			<thead>
				<tr>
					<th>Account No</th>
					<th>Full Name</th>
					<th>Address</th>
					<th>Mobile No</th>
					<th>Email ID</th>
					<th>Account Type</th>
					<th>Date of Birth</th>
					<th>ID Proof</th>
				</tr>
			</thead>
			<tbody>
				<%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        DatabaseConnection db = new DatabaseConnection();
                        conn = db.getConnection();
                        String sql = "SELECT * FROM customers WHERE deleted = FALSE";
                        ps = conn.prepareStatement(sql);
                        rs = db.executeQuery(ps);
                        while (rs.next()) {
                            int accountNo = rs.getInt("account_no");
                            String fullName = rs.getString("full_name");
                            String address = rs.getString("address");
                            String mobileNo = rs.getString("mobile_no");
                            String emailId = rs.getString("email");
                            String accountType = rs.getString("account_type");
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
					<td><%= dob %></td>
					<td><%= idProof %></td>
				</tr>
				<%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
			</tbody>
		</table>
		<a href="admin_dashboard.jsp" class="back-button">Back to Dashboard</a>
	</div>
</body>
</html>
