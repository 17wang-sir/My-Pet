package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/QuestionDetailServlet")
public class QuestionDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String questionId = request.getParameter("id");
        Map<String, String> question = new HashMap<>();
        Map<String, String> details = new HashMap<>();
        try {
            // Database connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop", "root", "");
            // Fetch question
            PreparedStatement questionStmt = connection.prepareStatement("SELECT * FROM questions WHERE id = ?");
            questionStmt.setString(1, questionId);
            ResultSet questionRs = questionStmt.executeQuery();
            if (questionRs.next()) {
                question.put("id", questionRs.getString("id"));
                question.put("question", questionRs.getString("question"));
                question.put("time", questionRs.getString("time"));
            }
            // Fetch details
            PreparedStatement detailsStmt = connection.prepareStatement("SELECT * FROM question_details WHERE question_id = ?");
            detailsStmt.setString(1, questionId);
            ResultSet detailsRs = detailsStmt.executeQuery();
            if (detailsRs.next()) {
                details.put("module1", detailsRs.getString("module1"));
                details.put("module2", detailsRs.getString("module2"));
                details.put("module3", detailsRs.getString("module3"));
                details.put("module4", detailsRs.getString("module4"));
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("question", question);
        request.setAttribute("details", details);
        request.getRequestDispatcher("questionsDetail.jsp").forward(request, response);
    }
}

