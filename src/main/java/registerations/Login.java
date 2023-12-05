package registerations;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            dispatcher = request.getRequestDispatcher("login.jsp");
            request.setAttribute("status", "emptyFields");
        } else {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://localhost:1401;databaseName=WT;encrypt=true;trustServerCertificate=true";
                String user = "SA";
                String pass = "Wolozeee5G";

                try (Connection con = DriverManager.getConnection(url, user, pass)) {
                    String query = "SELECT * FROM banzobot.user_data WHERE username = ? AND password = ?";
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        ps.setString(1, username);
                        ps.setString(2, password);

                        try (ResultSet rs = ps.executeQuery()) {
                            if (rs.next()) {
                                session.setAttribute("username", username);
                                session.setAttribute("role", rs.getString("role"));
                                request.setAttribute("status", "success");
                                dispatcher = request.getRequestDispatcher("index.jsp");
                            } else {
                                dispatcher = request.getRequestDispatcher("login.jsp");
                                request.setAttribute("status", "invalidCredentials");
                            }
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    dispatcher = request.getRequestDispatcher("login.jsp");
                    request.setAttribute("status", "dbError");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                dispatcher = request.getRequestDispatcher("login.jsp");
                request.setAttribute("status", "dbError");
            }
        }

        if (dispatcher != null) {
            dispatcher.forward(request, response);
        }
    }
}
