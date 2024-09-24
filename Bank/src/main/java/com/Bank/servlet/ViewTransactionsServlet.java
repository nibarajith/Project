package com.Bank.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bank.dao.DatabaseConnection;
import com.Bank.models.Transaction;

@WebServlet("/ViewTransactionsServlet")
public class ViewTransactionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("accountNo");
        String order = request.getParameter("order");
        
        if (order == null || (!order.equals("asc") && !order.equals("desc"))) {
            order = "asc";
        }

        List<Transaction> transactions = new ArrayList<>();
        DatabaseConnection dbConnection = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            dbConnection = new DatabaseConnection();
            conn = dbConnection.getConnection();

            String sql = "SELECT * FROM transactions WHERE account_no = ? ORDER BY date " + order.toUpperCase();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNo);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transaction_id"));
                transaction.setAccountNo(rs.getString("account_no"));
                transaction.setType(rs.getString("type"));
                transaction.setAmount(rs.getDouble("amount"));
                transaction.setDate(rs.getTimestamp("date"));
                transactions.add(transaction);
            }

            request.setAttribute("transactions", transactions);
            request.setAttribute("order", order);
            request.getRequestDispatcher("view_transactions.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
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
}
