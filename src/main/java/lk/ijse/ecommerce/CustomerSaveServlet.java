package lk.ijse.ecommerce;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/save-customer")
public class CustomerSaveServlet extends HttpServlet {

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("DB Connection Pool configuration error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String image = null;

        // Input validation
        if (
                fullName == null || fullName.isEmpty() ||
                        email == null || email.isEmpty() ||
                        address == null || address.isEmpty() ||
                        telephone == null || telephone.isEmpty() ||
                        password == null || password.isEmpty() ||
                        confirmPassword == null || confirmPassword.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            return;
        }

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        String newUserId = generateNewUserId();

        String insertUserSQL = "INSERT INTO users (userId, username, email, address, telephone, password, role, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(insertUserSQL)) {

            preparedStatement.setString(1, newUserId);
            preparedStatement.setString(2, fullName);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, telephone);
            preparedStatement.setString(6, hashedPassword);
            preparedStatement.setString(7, "customer");
            preparedStatement.setString(8, image);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                request.setAttribute("message", "Registration successful!");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred. Please try again.");
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
        }
    }

    private String generateNewUserId() {
        String newUserId = "cus-0001"; // Default starting ID

        String getLastUserIdSQL = "SELECT userId FROM users ORDER BY userId DESC LIMIT 1";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(getLastUserIdSQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                String lastUserId = resultSet.getString("userId");

                int lastUserIdNumber = Integer.parseInt(lastUserId.substring(4));
                newUserId = "cus-" + String.format("%04d", lastUserIdNumber + 1);
            } else {
                newUserId = "cus-0001";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return newUserId;
    }
}
