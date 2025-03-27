<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.OrderDetailsBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="Static/css/orderDetail.css"/>
</head>
<body>
    <div class="container">
        <% 
            Map<String, Object> orderDetails = (Map<String, Object>) request.getAttribute("orderDetails");
            if (orderDetails != null) {
        %>
            <div class="order-details">
                <div class="order-header">
                    <h2>订单详情</h2>
                    <div class="order-status">订单状态: <%= orderDetails.get("orderstatus") %></div>
                    <div style="background-color: #5cb85c;color: white;padding: 10px;font-size:20px;
                    border-radius: 4px;">订单总价: ¥<%= calculateTotalPrice(orderDetails) %></div>
                </div>
                <table>
                    <tr>
                         <th class="product-photo-column" style="text-align: center;">商品照片</th>
                         <th style="text-align: center;">详细信息</th>
                         <th class="price-column" style="text-align: center;">单价</th>
                         <th class="quantity-column" style="text-align: center;">数量</th>
                         <th class="total-price-column" style="text-align: center;">总价</th>
                    </tr>
                    <% 
                        List<Map<String, String>> orderItemsList = (List<Map<String, String>>) orderDetails.get("orderItemsList");
                        for (Map<String, String> item : orderItemsList) { 
                    %>
                        <tr>
                            <td class="product-photo"><img src="<%= item.get("productphoto") %>" alt="Product Photo"></td>
                            <td style="padding-left: 60px; font-size:20px;">
                                <div>名称: <%= item.get("productname") %></div>
                                <div>性别: <%= item.get("sex") %></div>
                                <div>年龄: <%= item.get("age") %>岁</div>
                            </td>
                            <td style="text-align: center; font-size:20px; color:red;">¥<%= item.get("price") %></td>
                            <td style="text-align: center; font-size:20px;"><%= item.get("quantity") %></td>
                            <td style="text-align: center; font-size:20px; color:red;">¥<%= item.get("allprice") %></td>
                        </tr>
                    <% } %>
                </table>
            </div>

            <div class="shipping-info">
                <h2 style="color: #ff6c00; font-size:30px;">物流信息</h2>
                <p style="font-size:20px; font-weight: bold;">配送方式: 京东快递</p>
                <p class="name">真实姓名: <%= orderDetails.get("name") %></p>
                <p class="address">收货地址: <%= orderDetails.get("address") %></p>
                <p class="telephone">联系电话: <%= orderDetails.get("telephone") %></p>
            </div>
        <% } else { %>
            <p>没有找到相关订单。</p>
        <% } %>
    </div>
    
    <%!
    /**
     * 计算订单的总价
     * @param orderDetails 订单详细信息的Map对象
     * @return 格式化后的总价字符串，保留两位小数
     */
    private String calculateTotalPrice(Map<String, Object> orderDetails) {
        // 获取订单项列表
        List<Map<String, String>> orderItemsList = (List<Map<String, String>>) orderDetails.get("orderItemsList");
        // 初始化总价
        double totalPrice = 0.0;

        // 遍历订单项列表，计算总价
        for (Map<String, String> item : orderItemsList) {
            String allPrice = item.get("allprice");
            try {
                // 将每个订单项的总价解析为double，并累加到总价上
                totalPrice += Double.parseDouble(allPrice);
            } catch (NumberFormatException e) {
                // 处理解析错误，如果需要的话
                e.printStackTrace();
            }
        }
        // 返回格式化后的总价字符串，保留两位小数
        return String.format("%.2f", totalPrice);
    }
    %>
</body>
</html>
