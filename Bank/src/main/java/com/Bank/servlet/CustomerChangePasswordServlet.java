package com.Bank.servlet;

import com.Bank.dao.DatabaseConnection;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/CustomerChangePasswordServlet")
public class CustomerChangePasswordServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        DatabaseConnection dbConn = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            dbConn = new DatabaseConnection();
            conn = dbConn.getConnection();

            String sql = "SELECT * FROM customers WHERE account_no = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNumber);
            stmt.setString(2, oldPassword);
            rs = stmt.executeQuery();

            if (rs.next()) {
                sql = "UPDATE customers SET password = ? WHERE account_no = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, newPassword);
                stmt.setString(2, accountNumber);
                stmt.executeUpdate();

                response.sendRedirect("customer_login.jsp?message=Password changed successfully");
            } else {
                response.sendRedirect("customer_change_password.jsp?error=Invalid account number or current password");
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
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
