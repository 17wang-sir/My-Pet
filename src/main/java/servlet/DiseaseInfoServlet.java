package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DiseaseInfoServlet")
public class DiseaseInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public class Disease {
        private String suTitle;
        private String time;
        private String type;
        private String details;
        private String reason;
        private String expression;
        private String standard;
        private String treat;

        // Getters and setters for each field
        public String getSuTitle() { return suTitle; }
        public void setSuTitle(String suTitle) { this.suTitle = suTitle; }
        public String getTime() { return time; }
        public void setTime(String time) { this.time = time; }
        public String getType() { return type; }
        public void setType(String type) { this.type = type; }
        public String getDetails() { return details; }
        public void setDetails(String details) { this.details = details; }
        public String getReason() { return reason; }
        public void setReason(String reason) { this.reason = reason; }
        public String getExpression() { return expression; }
        public void setExpression(String expression) { this.expression = expression; }
        public String getStandard() { return standard; }
        public void setStandard(String standard) { this.standard = standard; }
        public String getTreat() { return treat; }
        public void setTreat(String treat) { this.treat = treat; }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String suTitle = request.getParameter("suTitle");
        Disease disease = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop", "root", ""); // Update with your DB credentials
            String sql = "SELECT SuTitle, Time, Type, Details, Reason, Expression, Standard, Treat FROM allsubject WHERE SuTitle = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, suTitle);
            rs = stmt.executeQuery();

            if (rs.next()) {
                disease = new Disease();
                disease.setSuTitle(rs.getString("SuTitle"));
                disease.setTime(rs.getString("Time"));
                disease.setType(rs.getString("Type"));
                disease.setDetails(rs.getString("Details"));
                disease.setReason(rs.getString("Reason"));
                disease.setExpression(rs.getString("Expression"));
                disease.setStandard(rs.getString("Standard"));
                disease.setTreat(rs.getString("Treat"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("disease", disease);
        request.getRequestDispatcher("DiseaseInfo.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
