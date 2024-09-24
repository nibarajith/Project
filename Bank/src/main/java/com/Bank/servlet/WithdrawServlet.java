package com.Bank.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bank.dao.DatabaseConnection;

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("withdraw.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("accountNo");
        double amount = Double.parseDouble(request.getParameter("amount"));
        
        DatabaseConnection dbConnection = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            dbConnection = new DatabaseConnection();
            conn = dbConnection.getConnection();

            // Fetch current balance
            String sql = "SELECT balance FROM customers WHERE account_no = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNo);
            rs = stmt.executeQuery();
            
            double currentBalance = 0.0;
            if (rs.next()) {
                currentBalance = rs.getDouble("balance");
            }

            if (currentBalance >= amount) {
                // Update balance
                sql = "UPDATE customers SET balance = balance - ? WHERE account_no = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setDouble(1, amount);
                stmt.setString(2, accountNo);
                stmt.executeUpdate();

                // Insert transaction record
                sql = "INSERT INTO transactions (account_no, type, amount, date) VALUES (?, ?, ?, NOW())";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, accountNo);
                stmt.setString(2, "withdraw");
                stmt.setDouble(3, amount);
                stmt.executeUpdate();
                
                // Set new balance attribute and forward to success page
                request.setAttribute("newBalance", currentBalance - amount);
                request.getRequestDispatcher("withdraw_success.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Insufficient balance. Withdrawal failed.");
                request.getRequestDispatcher("withdraw.jsp").forward(request, response);
            }

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
