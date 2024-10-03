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

@WebServlet("/ViewBalanceServlet")
public class ViewBalanceServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("accountNo");

        double balance = 0.0;
        DatabaseConnection dbConnection = null;

        try {
            dbConnection = new DatabaseConnection();
            Connection conn = dbConnection.getConnection();
            String sql = "SELECT balance FROM customers WHERE account_no = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNo);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                balance = rs.getDouble("balance");
            }

            request.setAttribute("balance", balance);
            request.getRequestDispatcher("view_balance.jsp").forward(request, response);

            rs.close();
            stmt.close();
            dbConnection.closeConnection();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

