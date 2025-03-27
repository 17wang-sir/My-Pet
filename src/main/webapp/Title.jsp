<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>宠物之家</title>
		<link rel="stylesheet" type="text/css" href="Static/css/pet.css"/>
	</head>
<body>
	    <div class="navbarfirst">
	    <% String username = (String)session.getAttribute("username");
				   if(username!=null){%>
				    <a href="logoutservlet">注销</a><a href="">欢迎您！<%= username %></a>
				 <%} 
				   else{
				   %>
				   <a href="register.jsp">注册</a>
				   <a href="login.jsp">登录</a>
			   <%   			
				}
				%>
		</div> 
		<div class="zero">
		<div class="one"> <img src="Static/image/title.png" width="450" height="100" />
		<form class="size">
			<input type="text" class="sou"  placeholder="输入关键字搜索..."/>
			<input type="submit" class="value" value="搜索"/>
		</form>
		</div>
		<div>
		<div>
			<ul id="navul">
				<li class="navli">
					<h1 class="hson">首页</h1>
			</li>
			<li class="navli">
					<h1 class="hson">宠物商店</h1>
			</li>
			<li class="navli">
					<a href="SubjectServlet" style="text-decoration: none;color:black;"><h1 class="hson">狗狗百科</h1></a>
					<ul class="ulson">
			        <li class="lison">狗狗训练</li>
			        <li class="lison">狗狗医疗</li>
			        <li class="lison">狗狗孕事</li>
			        <li class="lison">饲养护理</li>
			        <li class="lison">狗狗病症</li>
					</ul>
			</li>
			<li class="navli">
					<a href="SubjectServlet" style="text-decoration: none;color:black;"><h1 class="hson">猫咪百科</h1></a>
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
				   <h1 class="hson"><a href="login.jsp" style="text-decoration:none;color:inherit">个人中心</h1></a>				
			</li>
			<div id="hk"></div>
			</ul>
		 <div class="a">
			<div class="b">
				<div class="c" style="--i:0"></div>
				<div class="d" style="--i:1"></div>
				<div class="e" style="--i:2"></div>
			</div>
		</div>
		</div>
		<div class="container">
			   <div style="background: linear-gradient(to left,rgb(255, 206, 236) 0%, 
			   rgb(152, 150, 240) 100%);-webkit-background-clip: text;background-clip: text;
			   color: transparent;margin-right: 30px;">
				   <h1><span>|</span>热门宠物推荐</h1>
			   </div>
		        <div class="item active" style="background-image: url(Static/image/bosimao.webp);">
		            <div class="shadow"></div>
		            <div class="content">
		                <div class="icon">
		                    <i class="fa fa-sun-o"></i>
		                </div>
		                <div class="text">
		                    <div class="tit">波斯猫</div>
		                    <div class="sub">点击查看详情</div>
		                </div>
		            </div>
		        </div>
		        <div class="item" style="background-image: url(Static/image/bixiong.webp);">
		            <div class="shadow"></div>
		            <div class="content">
		                <div class="icon">
		                    <i class="fa fa-cloud"></i>
		                </div>
		                <div class="text">
		                    <div class="tit">比熊</div>
		                    <div class="sub">点击查看详情</div>
		                </div>
		            </div>
		        </div>
		        <div class="item" style="background-image: url(Static/image/chaiquan.webp);">
		            <div class="shadow"></div>
		            <div class="content">
		                <div class="icon">
		                    <i class="fa fa-tint"></i>
		                </div>
		                <div class="text">
		                    <div class="tit">柴犬</div>
		                    <div class="sub">点击查看详情</div>
		                </div>
		            </div>
		        </div>
		        <div class="item" style="background-image: url(Static/image/labuladuo.webp);">
		            <div class="shadow"></div>
		            <div class="content">
		                <div class="icon">
		                    <i class="fa fa-bolt"></i>
		                </div>
		                <div class="text">
		                    <div class="tit">拉布拉多</div>
		                    <div class="sub">点击查看详情</div>
		                </div>
		            </div>
		        </div>
		        <div class="item" style="background-image: url(Static/image/luomao.webp);">
		            <div class="shadow"></div>
		            <div class="content">
		                <div class="icon">
		                    <i class="fa fa-snowflake-o"></i>
		                </div>
		                <div class="text">
		                    <div class="tit">暹罗猫</div>
		                    <div class="sub">点击查看详情</div>
		                </div>
		            </div>
		        </div>
		    </div>
			<div class="all">
				<div id="top1">
					<h1>|宠物狗狗<span>宠物狗狗销量榜</span></h1>
				</div>
				<div id="bottom">
					<div class="title">
						<img src="Static/image_dog/dogtitle.webp" alt="">
					</div>
					<div class="photo1">
						<img src="Static/image_dog/taidi.webp" alt="">
						<p>泰迪</p>
						<p class="p">￥980.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_dog/shamoye.webp" alt="">
						<p>萨摩耶</p>
						<p class="p">￥1,580.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_dog/maerjisi.webp" alt="">
						<p>马尔济斯</p>
						<p class="p">￥2,680.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_dog/hashiqi.webp" alt="">
						<p>哈士奇</p>
						<p class="p">￥1,280.00</p>
					</div>
					
					<div class="photo1">
						<img src="Static/image_dog/faguodouniuquan.webp" alt="">
						<p>法国斗牛犬</p>
						<p class="p">￥1,980.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_dog/qiutianquan.webp" alt="">
						<p>秋田犬</p>
						<p class="p">￥2,880.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_dog/bomeijunjie.webp" alt="">
						<p>博美俊介</p>
						<p class="p">￥980.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_dog/xigaodi.webp" alt="">
						<p>西高地</p>
						<p class="p">￥3,980.00</p>
					</div>
				</div>
			</div>
			<div class="all">
				<div id="top2">
					<h1>|宠物猫咪<span>宠物猫咪销量榜</span></h1>
				</div>
				<div id="bottom">
					<div class="title">
						<img src="Static/image_cat/cattitle.webp" alt="">
					</div>
					<div class="photo1">
						<img src="Static/image_cat/xianluo.webp" alt="">
						<p>暹罗猫</p>
						<p class="p">￥2,380.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_cat/jinjila.webp" alt="">
						<p>金吉拉猫</p>
						<p class="p">￥1,880.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_cat/dewenjuanmao.webp" alt="">
						<p>德文卷毛猫</p>
						<p class="p">￥1,880.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_cat/mianyin.webp" alt="">
						<p>缅因猫</p>
						<p class="p">￥1,580.00</p>
					</div>
					
					<div class="photo1">
						<img src="Static/image_cat/zheer.webp" alt="">
						<p>折耳猫</p>
						<p class="p">￥1,580.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_cat/buou.webp" alt="">
						<p>布偶猫</p>
						<p class="p">￥1,280.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_cat/yingduanlan.webp" alt="">
						<p>英短蓝猫</p>
						<p class="p">￥1,180.00</p>
					</div>
					<div class="photo1">
						<img src="Static/image_cat/jiafei.webp" alt="">
						<p>加菲猫</p>
						<p class="p">￥1,980.00</p>
					</div>
				</div>
			</div>
			<div class="all1">
				<div id="top3">
					<h1>|宠物用品</h1>
				</div>
				<div id="bottom">
					<div class="photo2">
						 <img src="Static/image_food/banbian.webp" alt="">
						<p>半边野兽 猫脸杯全价老年猫主食湿粮 鸡肉蔓越莓+鸡肉白灵菇</p>
						<p class="p">￥120.00</p>
					</div>
					<div class="photo2">
						<img src="Static/image_food/guanguzhuang.webp" alt="">
						<p>关谷庄 冻干零食 鸡肉粒 100g</p><br>
						<p class="p">￥13.80</p>
					</div>
					<div class="photo2">
						<img src="Static/image_food/guanguzhuang1.webp" alt="">
						<p>关谷庄 能量猫条 鸡肉+猫草 15g*5\t</p>
						<p class="p">￥3.50</p>
					</div>
					<div class="photo2">
						<img src="Static/image_food/wangwangdan.webp" alt="">
						<p>【旺旺蛋】食力萌主 犬用零食 40g 山楂鸡肉夹心</p>
						<p class="p">￥5.00</p>
					</div>
					<div class="photo2">
						<img src="Static/image_food/peima.webp" alt="">
						<p>佩玛恩特 天然抗氧化保护进口三文鱼&omega-3 美肌&美毛 2kg非转</p>
						<p class="p">￥238.00</p>
					</div>
					<div class="photo2">
						<img src="Static/image_food/bonatianchun.webp" alt="">
						<p>伯纳天纯 鲜肉系列 成猫粮 主粮主食宠物饲料 鸭鱼拼鲜</p>
						<p class="p">￥128.00</p>
					</div>
				</div>
			</div>
			<div class="last">
				<div class="last_1">
					<p style="font-weight: bold;">关于我们</p><br>
					<P style="margin-bottom: 8px;">联系我们</P>
					<p style="margin-bottom: 8px;">关于我们</p>
					<p style="margin-bottom: 8px;">问答资讯</p>
					<p style="margin-bottom: 8px;">帮助中心</p>
				</div>
				<div class="last_1">
					<p style="font-weight: bold;">购物指南</p><br>
					<P style="margin-bottom: 8px;">帮助中心</P>
					<p style="margin-bottom: 8px;">联系我们</p>
					<p style="margin-bottom: 8px;">我的订单</p>
				</div>
				<div class="last_1">
					<p style="font-weight: bold;">售后服务</p><br>
					<P style="margin-bottom: 8px;">售后政策</P>
					<p style="margin-bottom: 8px;">退款说明</p>
					<p style="margin-bottom: 8px;">联系我们</p>
					<p style="margin-bottom: 8px;">帮助中心</p>
				</div>
				<div class="last_1">
					<p style="font-weight: bold;">支付方式</p><br>
					<P style="margin-bottom: 8px;">微信支付</P>
					<p style="margin-bottom: 8px;">支付宝</p>
					<p style="margin-bottom: 8px;">在线支付</p>
					<p style="margin-bottom: 8px;">银行转账</p>
				</div>
			</div>
			<div >
				
			<div class="container1">
				<li style="--t:20%;">
				<a href="#">
					<i >首页</i>
				</a>
				</li>
				<li style="--t:30%;">
				<a href="#">
					<i >帮助中心</i>
				</a>
				</li>
				<li style="--t:40%;">
				<a href="#">
					<i >购物车</i>
				</a>
				</li>
				<li style="--t:50%;">
				<a href="#">
					<i >个人中心</i>
				</a>
				</li>
				<li style="--t:60%;">
				
					<i ><a href="OrderServlet">订单信息</i></a>
				
				</li>
				<li style="--t:70%;">
				<a href="#">
					<i >设置</i>
				</a>
				</li>
				<div class="top4"></div>
				<div class="middle"></div>
				<div class="bottom"></div>
			</div>	
		<script src="Static/js/133.js"></script>
	</body>
</html>