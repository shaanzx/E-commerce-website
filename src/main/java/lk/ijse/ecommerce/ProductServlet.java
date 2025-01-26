package lk.ijse.ecommerce;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

@WebServlet(name = "ProductServlet", value = "/product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class ProductServlet extends HttpServlet {
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
        } else if ("generateId".equals(action)) {
            generateNextProductId(req, resp);
        } else if ("loadCategories".equals(action)) {
            loadCategories(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "save":
                saveProduct(req, resp);
                break;
            case "update":
                updateProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
        }
    }

    private void loadCategories(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String query = "SELECT id, name FROM category";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                StringBuilder options = new StringBuilder();
                while (rs.next()) {
                    options.append("<option value='").append(rs.getString("id")).append("'>")
                            .append(rs.getString("name")).append("</option>");
                }

                resp.setContentType("text/html");
                resp.getWriter().write(options.toString());
            }
        } catch (SQLException e) {
            throw new ServletException("Error loading categories", e);
        }
    }

    private void loadProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String query = "SELECT p.itemCode, p.name, p.unitPrice, p.qtyOnHand, c.name AS categoryName, p.productImage " +
                    "FROM products p " +
                    "JOIN category c ON p.categoryId = c.id";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                StringBuilder html = new StringBuilder();
                while (rs.next()) {
                    byte[] imageBytes = rs.getBytes("productImage");
                    String base64Image = imageBytes != null ? Base64.getEncoder().encodeToString(imageBytes) : "";

                    html.append("<tr>")
                            .append("<td>").append(rs.getString("itemCode")).append("</td>")
                            .append("<td>").append(rs.getString("name")).append("</td>")
                            .append("<td>").append(rs.getDouble("unitPrice")).append("</td>")
                            .append("<td>").append(rs.getInt("qtyOnHand")).append("</td>")
                            .append("<td>").append(rs.getString("categoryName")).append("</td>")
                            .append("<td><img src='data:image/jpeg;base64,").append(base64Image).append("' style='width:50px;height:50px;'></td>")
                            .append("<td>")
                            .append("<button onclick='editProduct(\"").append(rs.getString("itemCode")).append("\", \"").append(rs.getString("name")).append("\", ").append(rs.getDouble("unitPrice")).append(", ").append(rs.getInt("qtyOnHand")).append(", \"").append(rs.getString("categoryName")).append("\")' class='btn btn-sm btn-warning'>Edit</button>")
                            .append("<button onclick='deleteProduct(\"").append(rs.getString("itemCode")).append("\")' class='btn btn-sm btn-danger'>Delete</button>")
                            .append("</td>")
                            .append("</tr>");
                }

                resp.setContentType("text/html");
                resp.getWriter().write(html.toString());
            }
        } catch (SQLException e) {
            throw new ServletException("Error loading products", e);
        }
    }

    private void generateNextProductId(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String query = "SELECT MAX(itemCode) as lastCode FROM products";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                String nextId = "SH-0001";
                if (rs.next() && rs.getString("lastCode") != null) {
                    String lastCode = rs.getString("lastCode");
                    int number = Integer.parseInt(lastCode.split("-")[1]) + 1;
                    nextId = String.format("SH-%04d", number);
                }

                resp.setContentType("text/plain");
                resp.getWriter().write(nextId);
            }
        } catch (SQLException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "ID generation error");
        }
    }

    private void saveProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("itemCode");
        String name = req.getParameter("itemName");
        double price = Double.parseDouble(req.getParameter("unitPrice"));
        int quantity = Integer.parseInt(req.getParameter("qtyOnHand"));
        String categoryId = req.getParameter("category");
        Part filePart = req.getPart("itemImage");
        InputStream fileContent = filePart != null ? filePart.getInputStream() : null;

        try {
            String query = "INSERT INTO products (itemCode, name, unitPrice, qtyOnHand, categoryId, productImage) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, id);
                pstmt.setString(2, name);
                pstmt.setDouble(3, price);
                pstmt.setInt(4, quantity);
                pstmt.setString(5, categoryId);

                // Set the image as a BLOB
                if (fileContent != null) {
                    pstmt.setBinaryStream(6, fileContent, filePart.getSize());
                } else {
                    pstmt.setNull(6, Types.BLOB); // Handle NULL images
                }

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    resp.getWriter().write("Product saved successfully");
                } else {
                    resp.getWriter().write("Error saving product");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Save product error", e);
        } finally {
            if (fileContent != null) fileContent.close();
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("itemCode");
        String name = req.getParameter("itemName");
        double price = Double.parseDouble(req.getParameter("unitPrice"));
        int quantity = Integer.parseInt(req.getParameter("qtyOnHand"));
        String categoryId = req.getParameter("category");
        Part filePart = req.getPart("itemImage");
        InputStream fileContent = filePart != null ? filePart.getInputStream() : null;

        try {
            String query = "UPDATE products SET name=?, unitPrice=?, qtyOnHand=?, categoryId=?, productImage=? WHERE itemCode=?";
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, name);
                pstmt.setDouble(2, price);
                pstmt.setInt(3, quantity);
                pstmt.setString(4, categoryId);

                // Set the image as a BLOB
                if (fileContent != null) {
                    pstmt.setBinaryStream(5, fileContent, filePart.getSize());
                } else {
                    pstmt.setNull(5, Types.BLOB); // Handle NULL images
                }

                pstmt.setString(6, id);

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    resp.getWriter().write("Product updated successfully");
                } else {
                    resp.getWriter().write("Error updating product");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Update product error", e);
        } finally {
            if (fileContent != null) fileContent.close();
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("itemCode");

        try {
            String query = "DELETE FROM products WHERE itemCode=?";
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, id);

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    resp.getWriter().write("Product deleted successfully");
                } else {
                    resp.getWriter().write("Error deleting product");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Delete product error", e);
        }
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