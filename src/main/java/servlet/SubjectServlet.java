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

@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Inner JavaBean class to hold subject information
    public class Subject {
        private String suTitle;
        private String time;
        private String type;

        public String getSuTitle() {
            return suTitle;
        }

        public void setSuTitle(String suTitle) {
            this.suTitle = suTitle;
        }

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> subjects = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop", "root", ""); // Update with your DB credentials
            String sql = "SELECT SuTitle, Time, Type FROM allsubject";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSuTitle(rs.getString("SuTitle"));
                subject.setTime(rs.getString("Time"));
                subject.setType(rs.getString("Type"));
                subjects.add(subject);
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

        request.setAttribute("subjects", subjects);
        request.getRequestDispatcher("subjects.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
