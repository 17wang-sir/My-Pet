<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
  <head> 
    <title>欢迎注册</title>
    <link rel="stylesheet" href="Static/css/register.css">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <div class="kong">
        <div class="buju">
            <h1>注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</h1>
            
            <form action="RegisterServlet" name = "loginForm" method="post">      <%--  action表示接收数据的页面;method表示请求方法 因为是修改数据 一般是post;--%>

                <ul>
                    <li>用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type="text" name="username"  maxlength="11" placeholder="用户名最长11个字"></li>      <%-- name是后台request.getParmter("name")的参数 ;是个很重要的参数！！！ --%> 
                        

                    <li>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="password" maxlength="18" minlength="6" placeholder="6-18位数字&字母组合"></li>
                    
                    <li>手&nbsp;&nbsp;机&nbsp;&nbsp;号：<input type="text" name="telephone"  maxlength="11" placeholder="以1开头的11位手机号"></li>
                           
                    <li>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="email" name="email"  pattern="[^@]*@[^@]*[\.com$]" placeholder="请输入邮箱"></li>        
                    <div>
                        <input class="zhuce" type="submit" value="注&nbsp;册">&emsp;&emsp;
                        
                        <input type="checkbox" checked="checked"> 我同意注册条款
                    </div>
                    
                    <div class="loading">
                    
                        <a href="login.jsp"> 已有账户，立即登录</a>
                        
                    </div>
                </ul>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">
    /* 控制下雪 */
    function snowFall(snow) {
        /* 可配置属性 */
        snow = snow || {};
        this.maxFlake = snow.maxFlake || 20;   /* 最多片数 */
        this.flakeSize = snow.flakeSize || 8;  /* 雪花形状 */
        this.fallSpeed = snow.fallSpeed || 1;   /* 坠落速度 */
    }
    /* 兼容写法 */
    requestAnimationFrame = window.requestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        function(callback) { setTimeout(callback, 1000 / 60); };
 
    cancelAnimationFrame = window.cancelAnimationFrame ||
        window.mozCancelAnimationFrame ||
        window.webkitCancelAnimationFrame ||
        window.msCancelAnimationFrame ||
        window.oCancelAnimationFrame;
    /* 开始下雪 */
    snowFall.prototype.start = function(){
        /* 创建画布 */
        snowCanvas.apply(this);
        /* 创建雪花形状 */
        createFlakes.apply(this);
        /* 画雪 */
        drawSnow.apply(this)
    }
    /* 创建画布 */
    function snowCanvas() {
        /* 添加Dom结点 */
        var snowcanvas = document.createElement("canvas");
        snowcanvas.id = "snowfall";
        snowcanvas.width = window.innerWidth;
        snowcanvas.height = document.body.clientHeight;
        snowcanvas.setAttribute("style", "position:absolute; top: 0; left: 0; z-index: 1; pointer-events: none;");
        document.getElementsByTagName("body")[0].appendChild(snowcanvas);
        this.canvas = snowcanvas;
        this.ctx = snowcanvas.getContext("2d");
        /* 窗口大小改变的处理 */
        window.onresize = function() {
            snowcanvas.width = window.innerWidth;
            /* snowcanvas.height = window.innerHeight */
        }
    }
    /* 雪运动对象 */
    function flakeMove(canvasWidth, canvasHeight, flakeSize, fallSpeed) {
        this.x = Math.floor(Math.random() * canvasWidth);   /* x坐标 */
        this.y = Math.floor(Math.random() * canvasHeight);  /* y坐标 */
        this.size = Math.random() * flakeSize + 2;          /* 形状 */
        this.maxSize = flakeSize;                           /* 最大形状 */
        this.speed = Math.random() * 1 + fallSpeed;         /* 坠落速度 */
        this.fallSpeed = fallSpeed;                         /* 坠落速度 */
        this.velY = this.speed;                             /* Y方向速度 */
        this.velX = 0;                                      /* X方向速度 */
        this.stepSize = Math.random() / 30;                 /* 步长 */
        this.step = 0                                       /* 步数 */
    }
    flakeMove.prototype.update = function() {
        var x = this.x,
            y = this.y;
        /* 左右摆动(余弦) */
        this.velX *= 0.98;
        if (this.velY <= this.speed) {
            this.velY = this.speed
        }
        this.velX += Math.cos(this.step += .05) * this.stepSize;
 
        this.y += this.velY;
        this.x += this.velX;
        /* 飞出边界的处理 */
        if (this.x >= canvas.width || this.x <= 0 || this.y >= canvas.height || this.y <= 0) {
            this.reset(canvas.width, canvas.height)
        }
    };
    /* 飞出边界-放置最顶端继续坠落 */
    flakeMove.prototype.reset = function(width, height) {
        this.x = Math.floor(Math.random() * width);
        this.y = 0;
        this.size = Math.random() * this.maxSize + 2;
        this.speed = Math.random() * 1 + this.fallSpeed;
        this.velY = this.speed;
        this.velX = 0;
    };
    // 渲染雪花-随机形状（此处可修改雪花颜色！！！）
    flakeMove.prototype.render = function(ctx) {
        var snowFlake = ctx.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.size);
        snowFlake.addColorStop(0, "rgba(255, 255, 255, 0.9)");  /* 此处是雪花颜色，默认是白色 */
        snowFlake.addColorStop(.5, "rgba(255, 255, 255, 0.5)"); /* 若要改为其他颜色，请自行查 */
        snowFlake.addColorStop(1, "rgba(255, 255, 255, 0)");    /* 找16进制的RGB 颜色代码。 */
        ctx.save();
        ctx.fillStyle = snowFlake;
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.fill();
        ctx.restore();
    };
    /* 创建雪花-定义形状 */
    function createFlakes() {
        var maxFlake = this.maxFlake,
            flakes = this.flakes = [],
            canvas = this.canvas;
        for (var i = 0; i < maxFlake; i++) {
            flakes.push(new flakeMove(canvas.width, canvas.height, this.flakeSize, this.fallSpeed))
        }
    }
    /* 画雪 */
    function drawSnow() {
        var maxFlake = this.maxFlake,
            flakes = this.flakes;
        ctx = this.ctx, canvas = this.canvas, that = this;
        /* 清空雪花 */
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        for (var e = 0; e < maxFlake; e++) {
            flakes[e].update();
            flakes[e].render(ctx);
        }
        /*  一帧一帧的画 */
        this.loop = requestAnimationFrame(function() {
            drawSnow.apply(that);
        });
    }
    /* 调用及控制方法 */
    var snow = new snowFall({maxFlake:500});
    snow.start();
</script>
</html>
