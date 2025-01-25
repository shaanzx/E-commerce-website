package lk.ijse.ecommerce;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.dto.CustomerDTO;

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

@WebServlet(name = "CustomerViewServlet", value = "/customer-view-servlet")
public class CustomerViewServlet extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/pool");
            System.out.println("DataSource initialized successfully!");
        } catch (NamingException e) {
            throw new ServletException("DB Connection Pool configuration error", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet method called!"); // Debugging statement

        List<CustomerDTO> customerDTOList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            System.out.println("Database connection established!");

            String query = "SELECT userId, username,address, email,telephone,image FROM users"; // Ensure the table name is correct
            try (PreparedStatement ps = connection.prepareStatement(query);
                 ResultSet resultSet = ps.executeQuery()) {

                System.out.println("Executing query: " + query);

                while (resultSet.next()) {
                    CustomerDTO customerDTO = new CustomerDTO(
                            resultSet.getString(1),
                            resultSet.getString(2),
                            resultSet.getString(3),
                            resultSet.getString(4),
                            resultSet.getString(5),
                            resultSet.getString(6)
                    );
                    customerDTOList.add(customerDTO);
                }

                System.out.println("Fetched customers: " + customerDTOList.size());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Error: " + e.getMessage());
            resp.sendRedirect("admin-customerView.jsp?error=Customer view error");
            return;
        }

        if (customerDTOList.isEmpty()) {
            System.out.println("No customers found in the database.");
        } else {
            System.out.println("Customers found: " + customerDTOList.size());
        }

        req.setAttribute("customerList", customerDTOList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin-customerView.jsp");
        requestDispatcher.forward(req, resp);
    }
}
