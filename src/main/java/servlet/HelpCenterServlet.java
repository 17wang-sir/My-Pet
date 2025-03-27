package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/HelpCenterServlet")
public class HelpCenterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> questions = new ArrayList<>();
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver (not necessary if using a different method to load driver)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Database connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop", "root", "");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM questions");
            while (resultSet.next()) {
                Map<String, String> question = new HashMap<>();
                question.put("id", resultSet.getString("id"));
                question.put("question", resultSet.getString("question"));
                question.put("time", resultSet.getString("time"));
                questions.add(question);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        // Set questions list as an attribute to be forwarded to the JSP
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("helpCenter.jsp").forward(request, response);
    }
}
