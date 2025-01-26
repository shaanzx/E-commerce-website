package lk.ijse.ecommerce;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.dto.ProductDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomepageServlet", value = "/homepage-servlet")
public class HomepageServlet extends HttpServlet {
    private Connection connection;

    @Override
    public void init() throws ServletException {
        try {
            Context context = new InitialContext();
            connection = ((DataSource) context.lookup("java:comp/env/jdbc/pool")).getConnection();
        } catch (Exception e) {
            throw new ServletException("Database connection error", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            loadProducts(req, resp);
        } else if ("loadByCategory".equals(action)) {
            String categoryId = req.getParameter("categoryId");
            loadProductsByCategory(req, resp, categoryId);
        }
    }

    private void loadProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String query = "SELECT * FROM products";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                List<ProductDTO> products = new ArrayList<>();
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getString("itemCode"),
                            rs.getString("name"),
                            rs.getDouble("unitPrice"),
                            rs.getInt("qtyOnHand"),
                            rs.getString("categoryId"),
                            rs.getBytes("productImage")
                    );
                    products.add(product);
                }

                req.setAttribute("products", products);
                req.getRequestDispatcher("home.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException("Error loading products", e);
        }
    }

    private void loadProductsByCategory(HttpServletRequest req, HttpServletResponse resp, String categoryId) throws ServletException, IOException {
        try {
            String query = "SELECT * FROM products WHERE categoryId = ?";
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, categoryId);
                ResultSet rs = pstmt.executeQuery();

                List<ProductDTO> products = new ArrayList<>();
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getString("itemCode"),
                            rs.getString("name"),
                            rs.getDouble("unitPrice"),
                            rs.getInt("qtyOnHand"),
                            rs.getString("categoryId"),
                            rs.getBytes("productImage")
                    );
                    products.add(product);
                }

                resp.setContentType("application/json");
                resp.getWriter().write(new Gson().toJson(products));
            }
        } catch (SQLException e) {
            throw new ServletException("Error loading products by category", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("addToCart".equals(action)) {
            addToCart(req, resp);
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemCode = req.getParameter("itemCode");
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        // Add logic to add the product to the cart (e.g., session or database)
        // For now, just return a success message
        resp.getWriter().write("Product added to cart successfully");
    }

    @Override
    public void destroy() {
        try {
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}