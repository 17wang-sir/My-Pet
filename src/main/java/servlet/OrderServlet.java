package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ArrayList<Order> orders = new ArrayList<>();
        String driverString = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/petshop?user=root&password=&characterEncoding=utf-8";     
        Connection conn = null;
        
        try {
            // 加载JDBC驱动
            Class.forName(driverString);
            // 建立连接
            conn = DriverManager.getConnection(url);
            
            // 从session中获取用户名
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            
            String query;
            if (username == null || isAdmin(username, conn)) {
                // 没有用户登录或登录的是管理员，查询全部订单
                query = "SELECT * FROM `orders`";
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderid(rs.getInt("orderid"));
                    order.setName(rs.getString("name"));
                    order.setOrdertime(rs.getDate("ordertime"));
                    order.setOrderstatus(rs.getString("orderstatus"));
                    order.setAddress(rs.getString("address"));
                    order.setTelephone(rs.getString("telephone"));
                    orders.add(order);
                }
                rs.close();
                stmt.close();
            } else {
                // 用户已登录，查询该用户的订单
                query = "SELECT * FROM `orders` WHERE username = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderid(rs.getInt("orderid"));
                    order.setName(rs.getString("name"));
                    order.setOrdertime(rs.getTimestamp("ordertime"));
                    order.setOrderstatus(rs.getString("orderstatus"));
                    order.setAddress(rs.getString("address"));
                    order.setTelephone(rs.getString("telephone"));
                    orders.add(order);
                }
                rs.close();
                stmt.close();
            }
            conn.close();

            // 输出调试信息
            System.out.println("Total orders fetched: " + orders.size());

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 将订单列表设置为请求属性，并转发到 JSP 页面
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orderTest.jsp").forward(request, response); // 使用正确的 JSP 文件名
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private boolean isAdmin(String username, Connection conn) throws Exception {
        String query = "SELECT * FROM attendant WHERE attendantname = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        boolean isAdmin = rs.next();
        rs.close();
        stmt.close();
        return isAdmin;
    }
}


