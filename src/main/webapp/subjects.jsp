<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="servlet.SubjectServlet.Subject" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>狗狗病症</title>
    <link rel="stylesheet" href="Static/css/subject.css">
</head>
<body>
    <div class="container">
        <h1>宠物病症</h1>
        <div class="breadcrumb">
            <a href="Title.jsp">首页</a> &gt;  <a>宠物病症</a>
        </div>
        <div class="disease-list">
            <%
                List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
                if (subjects != null && !subjects.isEmpty()) {
                    for (Subject subject : subjects) {
            %>
            <div class="disease-item">
                <a href="DiseaseInfoServlet?suTitle=<%= subject.getSuTitle() %>" style="text-decoration: none; font-size: 18px;"
                   onmouseover="this.style.fontSize='20px';" onmouseout="this.style.fontSize='18px';">
                    <h2><%= subject.getSuTitle() %></h2>
                </a>
                <p>日期: <%= subject.getTime() %></p>
                <p>类型: <%= subject.getType() %></p>
            </div>
            <%
                    }
                } else {
            %>
            <p>未找到任何狗狗病症信息。</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
