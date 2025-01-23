package lk.ijse.ecommerce.servlet.customerServlet;

import jakarta.annotation.Resource;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "customerSaveServlet", value = "/customer-Save-Servlet")
public class CustomerSaveServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")

    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        JsonReader jsonReader = Json.createReader(req.getReader());
        JsonObject jsonObject = jsonReader.readObject();

        String id = jsonObject.getString("1");
        String name = jsonObject.getString("registerName");
        String address = jsonObject.getString("address");
        String email = jsonObject.getString("registerEmail");
        String telephone =  jsonObject.getString("telephone");
        String password =  jsonObject.getString("registerPassword");
        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO user VALUES (?,?,?,?,?,?)");
            pstm.setString(1,id);
            pstm.setString(2,name);
            pstm.setString(3,address);
            pstm.setString(4,email);
            pstm.setString(5,telephone);
            pstm.setString(6,password);

            int i = pstm.executeUpdate();
            pstm.close();
            connection.close();

            if (i > 0) {
                resp.setStatus(HttpServletResponse.SC_CREATED);
                resp.sendRedirect("");
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}