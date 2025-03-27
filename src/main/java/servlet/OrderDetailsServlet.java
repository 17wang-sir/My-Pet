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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/OrderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/petshop";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    private void close(AutoCloseable resource) {
        if (resource != null) {
            try {
                resource.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement psOrders = null;
        ResultSet rsOrders = null;
        String orderid = request.getParameter("orderid");
        int id = Integer.parseInt(orderid);

        try {
            conn = getConnection();

            String sqlOrders = "SELECT o.orderid, o.orderstatus, o.name, o.address, o.telephone, "
                             + "oi.productphoto, oi.productname, oi.sex, oi.age, oi.price, oi.quantity, oi.allprice "
                             + "FROM orders o "
                             + "JOIN orderitems oi ON o.orderid = oi.orderid WHERE o.orderid = ?";
            psOrders = conn.prepareStatement(sqlOrders);
            psOrders.setInt(1, id);
            rsOrders = psOrders.executeQuery();

            Map<String, Object> orderDetails = null;
            List<Map<String, String>> orderItemsList = new ArrayList<>();

            while (rsOrders.next()) {
                if (orderDetails == null) {
                    orderDetails = new HashMap<>();
                    orderDetails.put("orderid", rsOrders.getString("orderid"));
                    orderDetails.put("orderstatus", rsOrders.getString("orderstatus"));
                    orderDetails.put("name", rsOrders.getString("name"));
                    orderDetails.put("address", rsOrders.getString("address"));
                    orderDetails.put("telephone", rsOrders.getString("telephone"));
                    orderDetails.put("orderItemsList", orderItemsList);
                }

                Map<String, String> item = new HashMap<>();
                item.put("productphoto", rsOrders.getString("productphoto"));
                item.put("productname", rsOrders.getString("productname"));
                item.put("sex", rsOrders.getString("sex"));
                item.put("age", rsOrders.getString("age"));
                item.put("price", rsOrders.getString("price"));
                item.put("quantity", rsOrders.getString("quantity"));
                item.put("allprice", rsOrders.getString("allprice"));
                orderItemsList.add(item);
            }

            request.setAttribute("orderDetails", orderDetails);
            request.getRequestDispatcher("orderDetail.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Database access error", e);
        } finally {
            close(rsOrders);
            close(psOrders);
            close(conn);
        }
    }
}