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
            // ����JDBC����
            Class.forName(driverString);
            // ��������
            conn = DriverManager.getConnection(url);
            
            // ��session�л�ȡ�û���
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            
            String query;
            if (username == null || isAdmin(username, conn)) {
                // û���û���¼���¼���ǹ���Ա����ѯȫ������
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
                // �û��ѵ�¼����ѯ���û��Ķ���
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

            // ���������Ϣ
            System.out.println("Total orders fetched: " + orders.size());

        } catch (Exception e) {
            e.printStackTrace();
        }

        // �������б�����Ϊ�������ԣ���ת���� JSP ҳ��
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orderTest.jsp").forward(request, response); // ʹ����ȷ�� JSP �ļ���
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


