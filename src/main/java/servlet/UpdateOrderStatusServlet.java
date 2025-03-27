package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * 处理POST请求，更新订单状态。
     * 接收从表单提交的订单ID和新的订单状态，更新数据库中的订单状态。
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        // 从表单中获取参数
        int orderid = 0;
        try {
            orderid = Integer.parseInt(request.getParameter("orderid"));
        } catch (NumberFormatException e) {
            // 处理订单ID不是合法整数的情况
            response.getWriter().println("订单ID不合法，请输入一个有效的订单ID。");
            return;
        }
        
        String newStatus = request.getParameter("newstatus");

        String driverString = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/petshop?user=root&password=&characterEncoding=utf-8";

        try {
            // 加载JDBC驱动
            Class.forName(driverString);
            // 建立连接
            try (Connection conn = DriverManager.getConnection(url)) {
                // 更新数据库中的订单状态
                String updateQuery = "UPDATE `orders` SET orderstatus = ? WHERE orderid = ?";
                try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                    stmt.setString(1, newStatus);
                    stmt.setInt(2, orderid);
                    int rowsAffected = stmt.executeUpdate();
                    if (rowsAffected > 0) {
                        System.out.println("订单状态更新成功。");
                    } else {
                        System.out.println("订单状态更新失败。");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // 可以在这里添加其他异常处理逻辑，如记录日志或者返回错误页面
        }

        // 重定向回原始页面（orderTest.jsp）或其他适当的页面
        response.sendRedirect("OrderServlet");
    }
}
