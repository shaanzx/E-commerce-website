package lk.ijse.ecommerce;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.dto.CategoryDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/category-servlet")
public class CategoryServlet extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("load".equals(action)) {
            loadCategories(request, response);
        } else if ("edit".equals(action)) {
            editCategory(request, response);
        } else if ("delete".equals(action)) {
            deleteCategory(request, response);
        } else {
            loadCategories(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            createCategory(request, response);
        } else if ("update".equals(action)) {
            updateCategory(request, response);
        }
    }

    private void loadCategories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoryDTO> categories = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement("SELECT * FROM category");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CategoryDTO category = new CategoryDTO(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image")
                );
                categories.add(category);
            }

            request.setAttribute("categories", categories);
            request.getRequestDispatcher("admin-categoryManagement.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error loading categories", e);
        }
    }

    private void createCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("categoryName");
        String description = request.getParameter("categoryDescription");
        String imageUrl = request.getParameter("categoryImage"); // Assume this is the path to the image

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement("INSERT INTO category (name, description, image) VALUES (?, ?, ?)")) {
            ps.setString(1, categoryName);
            ps.setString(2, description);
            ps.setString(3, imageUrl);
            ps.executeUpdate();

            response.sendRedirect("category-servlet?action=load");

        } catch (SQLException e) {
            throw new ServletException("Error creating category", e);
        }
    }

    private void editCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryCode = request.getParameter("categoryCode");

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement("SELECT * FROM category WHERE id = ?")) {

            ps.setString(1, categoryCode);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                CategoryDTO category = new CategoryDTO(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image")
                );

                request.setAttribute("category", category);
                request.getRequestDispatcher("admin-categoryManagement.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            throw new ServletException("Error editing category", e);
        }
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryCode = request.getParameter("categoryCode");
        String categoryName = request.getParameter("categoryName");
        String description = request.getParameter("categoryDescription");
        String imageUrl = request.getParameter("categoryImage");

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE category SET name = ?, description = ?, image = ? WHERE id = ?")) {

            ps.setString(1, categoryName);
            ps.setString(2, description);
            ps.setString(3, imageUrl);
            ps.setString(4, categoryCode);
            ps.executeUpdate();

            response.sendRedirect("admin-categoryManagement.jsp?action=load");

        } catch (SQLException e) {
            throw new ServletException("Error updating category", e);
        }
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryCode = request.getParameter("categoryCode");

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement("DELETE FROM category WHERE id = ?")) {

            ps.setString(1, categoryCode);
            ps.executeUpdate();

            response.sendRedirect("admin-categoryManagement.jsp?action=load");

        } catch (SQLException e) {
            throw new ServletException("Error deleting category", e);
        }
    }
}