<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物网站后台</title>
    <link rel="stylesheet" type="text/css" href="Static/css/index2.css">
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="logo">
                宠物网站后台
            </div>
            <ul>
                <li><a href="#">商品管理</a></li>
                <li><a href="#">发布商品</a></li>
                <li><a href="#">商品类别管理</a></li>
                <li><a href="#">订单管理</a></li>
                <li><a href="#">新闻资讯管理</a></li>
                <li><a href="#">发布新闻资讯</a></li>
                <li><a href="#">新闻相册管理</a></li>
                <li><a href="#">友情链接管理</a></li>
                <li><a href="#">在线留言管理</a></li>
                <li><a href="#">会员评论管理</a></li>
                <li><a href="#">首页栏目管理</a></li>
                <li><a href="#">用户管理</a></li>
                <li><a href="#">会员管理</a></li>
                <li><a href="#">修改密码</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="header">
                <span>欢迎你: admin</span>
                <a href="#" class="logout">退出</a>
                <a href="#" class="preview">网站预览</a>
            </div>
            <div class="main">
                <h2>后台用户管理</h2>
                <form action="#" method="get">
                    <label for="username">用户名:</label>
                    <input type="text" id="username" name="username">
                    <button type="submit">搜索</button>
                </form>
                <table>
                    <thead>
                        <tr>
                            <th>选择</th>
                            <th>用户名</th>
                            <th>创建人</th>
                            <th>创建时间</th>
                            <th>绑定邮箱</th>
                            <th>电话</th>
                            <th>登录次数</th>
                            <th>真名</th>
                            <th>昵称</th>
                            <th>性别</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>admin</td>
                            <td>admin</td>
                            <td>2017-02-13 20:30:09</td>
                            <td>670@qq.com</td>
                            <td>0791-123456</td>
                            <td>1</td>
                            <td>admin</td>
                            <td>admin</td>
                            <td>男</td>
                            <td><a href="#">修改</a> <a href="#">查看</a></td>
                        </tr>
                    </tbody>
                </table>
                <div class="pagination">
                    共1条 - 1页 - 每页10条
                    <div>
                        跳转到 <input type="text" value="1" size="2"> 页
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
