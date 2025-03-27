package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
@WebServlet("/logoutservlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取当前会话
        HttpSession session = request.getSession(false);
        if (session != null) {
            // 销毁会话
            session.invalidate();
        }
        // 重定向到未登录的首页页面
        response.sendRedirect("Title.jsp");
    }
}
