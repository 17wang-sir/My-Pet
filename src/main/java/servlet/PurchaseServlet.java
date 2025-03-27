package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gender = request.getParameter("gender");
        String color = request.getParameter("color");
        String age = request.getParameter("age");
        String quantityString = request.getParameter("quantity");
        String action = request.getParameter("action");

        int quantity = Integer.parseInt(quantityString);
        double price = 1380.00; // This should be fetched from the database based on the product
        double totalPrice = price * quantity;

        request.setAttribute("gender", gender);
        request.setAttribute("color", color);
        request.setAttribute("age", age);
        request.setAttribute("quantity", quantity);
        request.setAttribute("totalPrice", totalPrice);

        if ("buy".equals(action)) {
            request.getRequestDispatcher("orderSummary.jsp").forward(request, response);
        } else if ("cart".equals(action)) {
            request.getRequestDispatcher("cartSummary.jsp").forward(request, response);
        }
    }
}