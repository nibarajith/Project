package com.Bank.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Bank.dao.DatabaseConnection;

@WebServlet("/deleteCustomer")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");

        // Delete customer from customers table
        Connection conn = null;
        PreparedStatement psDelete = null;
        try {
            DatabaseConnection db = new DatabaseConnection();
            conn = db.getConnection();

            String deleteSql = "DELETE FROM customers WHERE account_no=?";
            psDelete = conn.prepareStatement(deleteSql);
            psDelete.setString(1, accountNo);
            psDelete.executeUpdate();

            response.sendRedirect("admin_dashboard.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        } finally {
            try {
                if (psDelete != null) psDelete.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
