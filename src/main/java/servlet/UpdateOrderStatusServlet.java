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
     * ����POST���󣬸��¶���״̬��
     * ���մӱ��ύ�Ķ���ID���µĶ���״̬���������ݿ��еĶ���״̬��
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        // �ӱ��л�ȡ����
        int orderid = 0;
        try {
            orderid = Integer.parseInt(request.getParameter("orderid"));
        } catch (NumberFormatException e) {
            // ������ID���ǺϷ����������
            response.getWriter().println("����ID���Ϸ���������һ����Ч�Ķ���ID��");
            return;
        }
        
        String newStatus = request.getParameter("newstatus");

        String driverString = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/petshop?user=root&password=&characterEncoding=utf-8";

        try {
            // ����JDBC����
            Class.forName(driverString);
            // ��������
            try (Connection conn = DriverManager.getConnection(url)) {
                // �������ݿ��еĶ���״̬
                String updateQuery = "UPDATE `orders` SET orderstatus = ? WHERE orderid = ?";
                try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                    stmt.setString(1, newStatus);
                    stmt.setInt(2, orderid);
                    int rowsAffected = stmt.executeUpdate();
                    if (rowsAffected > 0) {
                        System.out.println("����״̬���³ɹ���");
                    } else {
                        System.out.println("����״̬����ʧ�ܡ�");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // ������������������쳣�����߼������¼��־���߷��ش���ҳ��
        }

        // �ض����ԭʼҳ�棨orderTest.jsp���������ʵ���ҳ��
        response.sendRedirect("OrderServlet");
    }
}
