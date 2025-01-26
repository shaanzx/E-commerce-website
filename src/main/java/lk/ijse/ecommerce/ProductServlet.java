package lk.ijse.ecommerce;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommerce.dto.ProductDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
            req.getRequestDispatcher("admin-ItemManagement.jsp").forward(req, resp);
        } else if ("generateId".equals(action)) {
            generateNextProductId(req, resp);
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

    private void loadProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        try {
            List<ProductDTO> products = new ArrayList<>();
            String query = "SELECT * FROM products";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getString("itemCode"),
                            rs.getString("name"),
                            rs.getDouble("unitPrice"),
                            rs.getInt("qtyOnHand"),
                            rs.getString("categoryId"),
                            rs.getString("productImage")
                    );
                    products.add(product);
                }
            }
            req.setAttribute("products", products);
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
        int categoryId = Integer.parseInt(req.getParameter("category"));
        Part filePart = req.getPart("itemImage");
        String fileName = getSubmittedFileName(filePart);
        String uploadPath = getServletContext().getRealPath("/uploads/");
        filePart.write(uploadPath + fileName);

        System.out.println(id+name+price+quantity+categoryId+fileName);

        try {
            String query = "INSERT INTO products (itemCode, name, unitPrice, qtyOnHand, categoryId, productImage) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, id);
                pstmt.setString(2, name);
                pstmt.setDouble(3, price);
                pstmt.setInt(4, quantity);
                pstmt.setInt(5, categoryId);
                pstmt.setString(6, "uploads/" + fileName);



                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    resp.sendRedirect("product?success=save");
                } else {
                    resp.sendRedirect("product?error=save");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Save product error", e);
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String query = "UPDATE products SET name=?, unitPrice=?, qtyOnHand=?, categoryId=? WHERE itemCode=?";
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, req.getParameter("itemName"));
                pstmt.setDouble(2, Double.parseDouble(req.getParameter("unitPrice")));
                pstmt.setInt(3, Integer.parseInt(req.getParameter("qtyOnHand")));
                pstmt.setString(4, req.getParameter("category"));
                pstmt.setInt(5, Integer.parseInt(req.getParameter("itemCode")));

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    resp.sendRedirect("product?success=update");
                } else {
                    resp.sendRedirect("product?error=update");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Update product error", e);
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String query = "DELETE FROM products WHERE itemCode=?";
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, req.getParameter("itemCode"));

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    resp.sendRedirect("product?success=delete");
                } else {
                    resp.sendRedirect("product?error=delete");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Delete product error", e);
        }
    }

    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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