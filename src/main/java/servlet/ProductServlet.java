package servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT name, image, price FROM products WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, productId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String productName = resultSet.getString("name");
                        String productImage = resultSet.getString("image");
                        double productPrice = resultSet.getDouble("price");

                        request.setAttribute("productName", productName);
                        request.setAttribute("productImage", productImage);
                        request.setAttribute("productPrice", productPrice);

                        request.getRequestDispatcher("product.jsp").forward(request, response);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                    }
                }
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}