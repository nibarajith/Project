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

@WebServlet("/modifyCustomer")
public class ModifyCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String emailId = request.getParameter("emailId");

        Connection conn = null;
        PreparedStatement psUpdate = null;
        try {
            DatabaseConnection db = new DatabaseConnection();
            conn = db.getConnection();

            String updateSql = "UPDATE customers SET full_name=?, address=?, mobile_no=?, email=? WHERE account_no=?";
            psUpdate = conn.prepareStatement(updateSql);
            psUpdate.setString(1, fullName);
            psUpdate.setString(2, address);
            psUpdate.setString(3, mobileNo);
            psUpdate.setString(4, emailId);
            psUpdate.setString(5, accountNo);

            int rowsUpdated = psUpdate.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                // Handle error case
                response.sendRedirect("admin_dashboard.jsp?error=true");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        } finally {
            try {
                if (psUpdate != null) psUpdate.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
