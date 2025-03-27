<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车摘要</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="summary-container">
        <h1>购物车摘要</h1>
        <p>性别: <%= request.getAttribute("gender") %></p>
        <p>颜色: <%= request.getAttribute("color") %></p>
        <p>年龄: <%= request.getAttribute("age") %></p>
        <p>数量: <%= request.getAttribute("quantity") %></p>
        <p>总价: ￥<%= request.getAttribute("totalPrice") %></p>
        <button onclick="window.location.href='index.jsp'">返回首页</button>
    </div>
</body>
</html>