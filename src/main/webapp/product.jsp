<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>无敌大坤坤 商品详情</title>
    <link rel="stylesheet" href="Static/css/style.css">
</head>
<body>
    <div class="product-container">
        <div class="product-image">
            <img src="Static/image/labuladuo.webp" alt="商品图片">
        </div>
        <div class="product-details">
            <h1>无敌大坤坤</h1>
            <p class="tagline">血统纯正 疫苗齐全 价格实惠</p>
            <p class="price">价格 <span>￥2400.00</span> <del>￥3000.00</del></p>
            
            <form action="PurchaseServlet" method="post">
                <input type="hidden" name="productName" value="无敌大坤坤">
                <input type="hidden" name="productPrice" value="2400.00">
                <div class="options">
                    <label>性别</label>
                    <label><input type="radio" name="gender" value="公"> 公</label>
                    <label><input type="radio" name="gender" value="母"> 母</label>
                </div>
                <div class="options">
                    <label>颜色</label>
                    <label><input type="radio" name="color" value="白色"> 白色</label>
                    <label><input type="radio" name="color" value="黄色"> 黄色</label>
                </div>
                <div class="options">
                    <label>年龄</label>
                    <label><input type="radio" name="age" value="幼年犬"> 幼年犬(45日龄-12月龄)</label>
                    <label><input type="radio" name="age" value="幼年犬"> 青年年犬(1年龄-3年龄)</label>
                    <label><input type="radio" name="age" value="幼年犬"> 成熟犬(3年龄-5年龄)</label>
                </div>
                <div class="quantity">
                    <button type="button" onclick="changeQuantity(-1)">-</button>
                    <input type="text" id="quantity" name="quantity" value="1">
                    <button type="button" onclick="changeQuantity(1)">+</button>
                </div>
                <div class="actions">
                    <button type="submit" name="action" value="buy">立即购买</button>
                    <button type="submit" name="action" value="cart">加入购物车</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function changeQuantity(amount) {
            var quantityInput = document.getElementById('quantity');
            var currentQuantity = parseInt(quantityInput.value);
            if (currentQuantity + amount > 0) {
                quantityInput.value = currentQuantity + amount;
            }
        }
    </script>
</body>
</html>
