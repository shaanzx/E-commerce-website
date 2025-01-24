package lk.ijse.ecommerce;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "LoginServlet", value = "/loginCustomerAdminServlet")
public class LoginCustomerAdminServlet extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            // Setting up connection pool
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("Database connection issue", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        String errorMessage = null;

        try (Connection conn = dataSource.getConnection()) {
            // Query to check email and password in DB
            String query = "SELECT password, role FROM users WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, email);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String storedPassword = rs.getString("password");
                        String role = rs.getString("role");

                        // Check if the entered password matches the stored hashed password
                        if (BCrypt.checkpw(password, storedPassword)) {
                            session.setAttribute("userEmail", email);
                            session.setAttribute("role", role);

                            // Redirect based on role (admin/customer)
                            if ("Admin".equals(role)) {
                                resp.sendRedirect("pages/admin-Dashboard.jsp");
                            } else {
                                resp.sendRedirect("pages/homePage.jsp");
                            }
                        } else {
                            errorMessage = "Invalid email or password!";
                        }
                    } else {
                        errorMessage = "User not found!";
                    }
                }
            }

        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
        }

        // If there is an error, show it on the login page
        if (errorMessage != null) {
            req.setAttribute("error", errorMessage);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
