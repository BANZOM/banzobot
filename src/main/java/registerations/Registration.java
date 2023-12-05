package registerations;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class Registration extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("contact");
            String role = request.getParameter("role");
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(
                    "registration.jsp");

            if (username == null || name == null || email == null || password == null || phone == null || role == null) {
                request.setAttribute("status", "emptyFields");
            } 
            else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                request.setAttribute("status", "invalidEmail");
            } 
            else if (!phone.matches("^[0-9]{10}$")) {
                request.setAttribute("status", "invalidPhone");
            }
            else if (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")) {
                request.setAttribute("status", "invalidPassword");
            }
            else {
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    String url = "jdbc:sqlserver://localhost:1401;databaseName=WT;encrypt=true;trustServerCertificate=true";
                    String user = "SA";
                    String pass = "Wolozeee5G";

                    Connection con = DriverManager.getConnection(url, user, pass);
                    String query = "INSERT INTO banzobot.user_data (username, fullname, email, password, phone, role) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, username);
                    ps.setString(2, name);
                    ps.setString(3, email);
                    ps.setString(4, password);
                    ps.setString(5, phone);
                    ps.setString(6, role);

                    int rowsInserted = ps.executeUpdate();

                    if (rowsInserted > 0) {
                        // Registration successful
                        request.setAttribute("status", "success");
                    } else {
                        // Registration failed
                        request.setAttribute("status", "error");
                    }
                    ps.close();
                    con.close();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    // Handle registration failure
                    request.setAttribute("status", "exception");
                }
            }
        dispatcher.forward(request, response);
    }
}
