<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>问题详情</title>
    <link rel="stylesheet" type="text/css" href="Static/css/question.css">
</head>
<body>
    <h1>${question.question}</h1>
    <div class="module">
        <h2>模块1</h2>
        <p>${details.module1}</p>
    </div>
    <div class="module">
        <h2>模块2</h2>
        <p>${details.module2}</p>
    </div>
    <div class="module">
        <h2>模块3</h2>
        <p>${details.module3}</p>
    </div>
    <div class="module">
        <h2>模块4</h2>
        <p>${details.module4}</p>
    </div>
</body>
</html>
