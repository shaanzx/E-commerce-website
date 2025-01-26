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
import java.io.PrintWriter;
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
                        rs.getString("description")
                );
                categories.add(category);
            }

            StringBuilder html = new StringBuilder();
            for (CategoryDTO category : categories) {
                html.append("<tr>")
                        .append("<td>").append(category.getId()).append("</td>")
                        .append("<td>").append(category.getName()).append("</td>")
                        .append("<td>").append(category.getDescription()).append("</td>")
                        .append("<td>")
                        .append("<button class='btn btn-link text-primary' onclick='editCategory(\"").append(category.getId()).append("\")'><i class='fas fa-edit'></i></button>")
                        .append("<button class='btn btn-link text-danger' onclick='deleteCategory(\"").append(category.getId()).append("\")'><i class='fas fa-trash'></i></button>")
                        .append("</td>")
                        .append("</tr>");
            }

            response.setContentType("text/html");
            response.getWriter().write(html.toString());

        } catch (SQLException e) {
            throw new ServletException("Error loading categories", e);
        }
    }

    private void createCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("categoryName");
        String description = request.getParameter("categoryDescription");

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement("INSERT INTO category (name, description) VALUES (?, ?)")) {
            ps.setString(1, categoryName);
            ps.setString(2, description);
            ps.executeUpdate();

            response.getWriter().write("Category created successfully");

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
                        rs.getString("description")
                );

                response.setContentType("application/json");
                response.getWriter().write("{\"id\":\"" + category.getId() + "\",\"name\":\"" + category.getName() + "\",\"description\":\"" + category.getDescription() + "\"}");
            }

        } catch (SQLException e) {
            throw new ServletException("Error editing category", e);
        }
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryCode = request.getParameter("categoryCode");
        String categoryName = request.getParameter("categoryName");
        String description = request.getParameter("categoryDescription");

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE category SET name = ?, description = ? WHERE id = ?")) {

            ps.setString(1, categoryName);
            ps.setString(2, description);
            ps.setString(3, categoryCode);
            ps.executeUpdate();

            response.getWriter().write("Category updated successfully");

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

            response.getWriter().write("Category deleted successfully");

        } catch (SQLException e) {
            throw new ServletException("Error deleting category", e);
        }
    }
}