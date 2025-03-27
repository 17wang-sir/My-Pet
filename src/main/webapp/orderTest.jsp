<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="servlet.Order" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单列表</title>
    <link rel="stylesheet" href="Static/css/order.css">
    <link rel="stylesheet" href="Static/css/top.css">
</head>
<body>
    <div class="zero">
        <div class="one">
            <img src="Static/image/title.png" width="450" height="100" />
            <form class="size">
                <input type="text" class="sou" placeholder="输入关键字搜索..."/>
                <input type="submit" class="value" value="搜索"/>
            </form>
        </div>
        <div>
            <ul id="navul">
                <li class="navli">
                <a href="Title.jsp" style="text-decoration: none;color:black;">
                    <h1 class="hson">首页</h1></a>
                </li>
                <li class="navli">
                    <h1 class="hson">宠物商店</h1>
                </li>
                <li class="navli">
                    <h1 class="hson">狗狗百科</h1>
                    <ul class="ulson">
                        <li class="lison">狗狗训练</li>
                        <li class="lison">狗狗医疗</li>
                        <li class="lison">狗狗孕事</li>
                        <li class="lison">饲养护理</li>
                        <li class="lison">狗狗病症</li>
                    </ul>
                </li>
                <li class="navli">
                    <h1 class="hson">猫咪百科</h1>
                    <ul class="ulson">
                        <li class="lison">猫咪训练</li>
                        <li class="lison">猫咪医疗</li>
                        <li class="lison">猫咪孕事</li>
                        <li class="lison">猫咪护理</li>
                        <li class="lison">猫咪病症</li>
                    </ul>
                </li>
                <li class="navli">
                    <h1 class="hson">问答资讯</h1>
                </li>
                <li class="navli">
                    <h1 class="hson">帮助中心</h1>
                </li>
                <li class="navli">
                    <h1 class="hson">用户中心</h1>
                </li>
                <div id="hk"></div>
            </ul>
        </div>
    </div>
    <div class="order-list">
        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders == null) {
                out.println("<p>无法从数据库检索订单。</p>");
            } else if (orders.isEmpty()) {
                out.println("<p>未找到订单。</p>");
            } else {
                for (Order order : orders) {
        %>
        <div class="order-item">
            <div class="order-header">
                <form action="UpdateOrderStatusServlet" method="post">
                    <input type="hidden" name="orderid" value="<%= order.getOrderid() %>">
                    <label for="newStatus">修改订单状态：</label>
                    <select name="newstatus" id="newStatus">
                        <option value="待发货" <%= order.getOrderstatus().equals("待发货") ? "selected" : "" %>>待发货</option>
                        <option value="已发货" <%= order.getOrderstatus().equals("已发货") ? "selected" : "" %>>已发货</option>
                        <option value="已完成" <%= order.getOrderstatus().equals("已完成") ? "selected" : "" %>>已完成</option>
                        <option value="已下单，正在揽收" <%= order.getOrderstatus().equals("已下单，正在揽收") ? "selected" : "" %>>已下单，正在揽收</option>
                    </select>
                    <input type="submit" value="修改状态">
                </form>
            
                <a href="OrderDetailsServlet?orderid=<%= order.getOrderid() %>" style="text-decoration: none;">
                    <span class="orderID" style="border-bottom: none;">
                        <span onmouseover="this.style.fontSize='larger'" onmouseout="this.style.fontSize='inherit'">订单号:</span>
                        <%= order.getOrderid() %>
                    </span>
                </a>
                <span>下单时间: <%= order.getOrdertime() %></span>
                <span style="color:rgb(0, 128, 255);">收件人真实姓名: <%= order.getName() %></span>
            </div>
            <div class="order-details">
                <div class="product-image"></div>
                <div class="product-info">
                    <p>订单状态: <%= order.getOrderstatus() %></p>
                    <p>联系电话: <%= order.getTelephone() %></p>
                    <p>收货地址: <%= order.getAddress() %></p>
                </div>
            </div>
        </div>
        <%  
                }
            }
        %>
    </div>
</body>
</html>
