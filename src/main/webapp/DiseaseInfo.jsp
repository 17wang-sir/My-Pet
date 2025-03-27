<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="servlet.DiseaseInfoServlet.Disease" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>病症详情</title>
    <link rel="stylesheet" type="text/css" href="Static/css/DiseaseInfo.css">
</head>
<body>
    <div class="container">
        <div class="breadcrumb">
            <a href="Title.jsp" style="text-decoration: none;color:red;">首页</a> &gt;  
            <a href="SubjectServlet" style="text-decoration: none;color:red;">宠物病症</a> &gt; 
            病症详情
        </div>
        <% 
            Disease disease = (Disease) request.getAttribute("disease");
            if (disease != null) { 
        %>
        <div class="disease-info">
            <h2><%= disease.getSuTitle() %></h2>
            <div class="info">
                <p>类型: <%= disease.getType() %></p>
                <p>日期: <%= disease.getTime() %></p>
            </div>
            <div class="section">
                <h3>病症概述</h3>
                <p><%= disease.getDetails() %></p>
            </div>
            <div class="section">
                <h3>发病原因</h3>
                <p><%= disease.getReason() %></p>
            </div>
            <div class="section">
                <h3>主要症状</h3>
                <p><%= disease.getExpression() %></p>
            </div>
            <div class="section">
                <h3>诊断标准</h3>
                <p><%= disease.getStandard() %></p>
            </div>
            <div class="section">
                <h3>治疗方法</h3>
                <p><%= disease.getTreat() %></p>
            </div>
        </div>
        <% 
            } else { 
        %>
        <p>未找到相关病症信息。</p>
        <% 
            } 
        %>
    </div>
</body>
</html>
