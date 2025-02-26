package lk.ijse.ecommerce;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/save-customer")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
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

        // Handle image upload
        Part imagePart = request.getPart("image");
        InputStream imageInputStream = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            imageInputStream = imagePart.getInputStream();
        }

        // Input validation
        if (fullName == null || fullName.isEmpty() ||
                email == null || email.isEmpty() ||
                address == null || address.isEmpty() ||
                telephone == null || telephone.isEmpty() ||
                password == null || password.isEmpty() ||
                confirmPassword == null || confirmPassword.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
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

            if (imageInputStream != null) {
                preparedStatement.setBlob(8, imageInputStream);
            } else {
                preparedStatement.setNull(8, java.sql.Types.BLOB);
            }

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                request.setAttribute("message", "Registration successful!");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred. Please try again.");
        }

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    private String generateNewUserId() {
        String newUserId = "CUS-0001"; // Default starting ID

        String getLastUserIdSQL = "SELECT userId FROM users ORDER BY userId DESC LIMIT 1";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(getLastUserIdSQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                String lastUserId = resultSet.getString("userId");

                int lastUserIdNumber = Integer.parseInt(lastUserId.substring(4));
                newUserId = "CUS-" + String.format("%04d", lastUserIdNumber + 1);
            } else {
                newUserId = "CUS-0001";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return newUserId;
    }
}