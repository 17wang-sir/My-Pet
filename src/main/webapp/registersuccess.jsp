<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
 注册成功！<span id="span01" style="color: red">3</span>秒后自动跳转到登录页面，如果没有跳转点击<a href="login.jsp">登录</a>   <span id="remainSeconds">3</span>
<script type="text/javascript">
    var sec = 3;
    function jump(){
        sec--;
        if(sec > 0){
            document.getElementById('remainSeconds').innerHTML = sec;
            setTimeout(this.jump,1000);
        }else{
            window.location.href = 'login.jsp';
        }
    }
    setTimeout(jump,1000);
</script>
</body>
</html>