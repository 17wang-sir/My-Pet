<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html>
  <head>
    <title>欢迎登录</title>
    <link rel="stylesheet" href="Static/css/login.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <div class="big-box">
    
        <h1>登&nbsp;&nbsp;&nbsp;录</h1>
        
        <div class="buju">
        
        <form action="LoginServlet" name = "loginForm" method="post">  
        
            <div class="zhma">
                <input type="text" name="dlzh" placeholder="用户名">
            </div>
            
            <div class="zhma">
                <input type="password" name="dlmm" placeholder="密码">
            </div>
            
            <input  class="denglu" type="submit" value="登&nbsp;录">
            
        </form>
        
         <%--<div class="remember-password">
                <p><input type="checkbox" name="jzma"> 记住密码</p> 
                </div>
                --%>   
            
            <div class="zhuce">
            
                还没账户？<a href="register.jsp"">立即注册</a>
                
            </div>
        </div>
    </div>
</body>
<script>
   //下雨特效
   function rainAnimation(time) {
        setInterval(() => {
            // 创建rain
            var rain = document.createElement("div")
            //初始化rain
            rain.style.position = "fixed" //相对于视窗定位
            rain.style.height = "45px"
            rain.style.width = "2px"
            rain.style.backgroundColor = "#fff"
            rain.style.filter = "blur(1px)"
            rain.style.top = "0"
            rain.style.left = Math.random() * 1920 + "px" //水平随机刷新
            rain.style.opacity = parseInt(Math.random() * 10) / 10 + "" // 随机透明度
            // 向body里添加子节点rain
            document.body.appendChild(rain)
            // rain动画
            var timer = setInterval(() => {
                var height = parseInt(rain.style.top);
                var i = 1;
                i++;
                rain.style.top = height + 5 * Math.pow(i, 2) + "px";

                if (rain.style.top >= "900px") {
                    clearInterval(timer);
                    rain.parentNode.removeChild(rain)
                }
            }, time)
        })
    }
    rainAnimation(12)
</script>
</html>
