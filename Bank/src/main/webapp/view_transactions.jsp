<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.Bank.models.Transaction"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Transactions</title>
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

.order-links {
	margin-top: 10px;
}

.order-links a {
	text-decoration: none;
	margin-right: 10px;
	color: #6f42c1;
}

.order-links a:hover {
	color: #5a379d;
}
</style>
</head>
<body>
	<div class="container">
		<h1>View Transactions</h1>
		<div class="order-links">
			<a href="ViewTransactionsServlet?order=asc">Sort by Date (Ascending)</a>
			<a href="ViewTransactionsServlet?order=desc">Sort by Date (Descending)</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>Account No</th>
					<th>Type</th>
					<th>Amount</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<%
                    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                    if (transactions != null) {
                        for (Transaction transaction : transactions) {
                %>
				<tr>
					<td><%= transaction.getTransactionId() %></td>
					<td><%= transaction.getAccountNo() %></td>
					<td><%= transaction.getType() %></td>
					<td><%= transaction.getAmount() %></td>
					<td><%= transaction.getDate() %></td>
				</tr>
				<%
                        }
                    } else {
                %>
				<tr>
					<td colspan="5">No transactions found</td>
				</tr>
				<%
                    }
                %>
			</tbody>
		</table>
	</div>
</body>
</html>
