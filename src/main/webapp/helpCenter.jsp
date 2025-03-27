<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Question" %> <!-- Replace 'your.package.name' with the actual package name of your Question class -->

<!DOCTYPE html>
<html>
<head>
    <title>帮助中心</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>帮助中心</h1>
    <div class="questions-list">
        <% 
            List<Question> questions = (List<Question>) request.getAttribute("questions");
            if (questions != null) {
                for (Question question : questions) {
        %>
                    <div class="question-item">
                        <a href="QuestionDetailServlet?id=<%= question.getId() %>" class="question-link"><%= question.getQuestion() %></a>
                        <span class="question-time"><%= question.getTime() %></span>
                    </div>
        <% 
                }
            }
        %>
    </div>
</body>
</html>
