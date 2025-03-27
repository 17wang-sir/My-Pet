<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="Static/css/cart.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            function updateSubtotal(row) {
                const price = parseFloat(row.find('.price').text().replace(/[¥,]/g, ''));
                const quantity = parseInt(row.find('.quantity input').val());
                const subtotal = price * quantity;
                row.find('.subtotal').text('¥' + subtotal.toLocaleString('zh-CN', {minimumFractionDigits: 2}));

                if (quantity < 1) {
                    row.remove(); // 如果数量小于1，移除该行
                }

                updateTotal();
            }

            function updateTotal() {
                let total = 0;
                $('.subtotal').each(function(){
                    total += parseFloat($(this).text().replace(/[¥,]/g, ''));
                });
                $('.total-price').text('¥' + total.toLocaleString('zh-CN', {minimumFractionDigits: 2}));
            }

            $('.quantity button').click(function(){
                const button = $(this);
                const input = button.siblings('input');
                let quantity = parseInt(input.val());

                if (button.text() === '+') {
                    quantity++;
                } else if (button.text() === '-') {
                    quantity--; // 直接减少数量

                    if (quantity < 0) {
                        quantity = 0; // 确保数量不会小于0
                    }
                }

                input.val(quantity);
                updateSubtotal(button.closest('tr'));
            });

            $('.delete-button').click(function(){
                $(this).closest('tr').remove();
                updateTotal();
            });

            updateTotal();
        });
    </script>
</head>
<body>
    <div class="cart-container">
        <h1>购物车</h1>
        <table class="cart-table">
            <tr>
                <th>产品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
                <th>操作</th>
            </tr>
            <tr>
                <td>
                    <img src="Static/image/run1.png" alt="猫粮">
                    <span>(效期至24.8) 伯纳天纯 鲜肉系列成猫粮 主粮主食宠物饲料 鸭鱼拼鲜 1.5kg - 1.5kg 鸭鱼拼鲜</span>
                </td>
                <td class="price">¥128.00</td>
                <td class="quantity">
                    <button>-</button>
                    <input type="text" value="4" readonly>
                    <button>+</button>
                </td>
                <td class="subtotal">¥512.00</td>
                <td><button class="delete-button">删除</button></td>
            </tr>
            <tr>
                <td>
                    <img src="Static/image/luomao.webp" alt="公狗">
                    <div class="product-info">
                        <div class="product-name">边牧</div>
                        <div class="product-detail">性别: <span class="product-value">公</span></div>
                        <div class="product-detail">颜色: <span class="product-value">隔石色</span></div>
                        <div class="product-detail">年龄: <span class="product-value">幼年犬(45日龄-12月龄)</span></div>
                        <div class="product-detail">品种: <span class="product-value">边境牧羊犬</span></div>
                    </div>
                </td>
                <td class="price">¥1,500.00</td>
                <td class="quantity">
                    <button>-</button>
                    <input type="text" value="2" readonly>
                    <button>+</button>
                </td>
                <td class="subtotal">¥3,000.00</td>
                <td><button class="delete-button">删除</button></td>
            </tr>
            <tr>
                <td>
                    <img src="Static/image_dog/taidi.webp" alt="母狗">
                    <div class="product-info">
                        <div class="product-name">边牧</div>
                        <div class="product-detail">性别: <span class="product-value">母</span></div>
                        <div class="product-detail">颜色: <span class="product-value">金色</span></div>
                        <div class="product-detail">年龄: <span class="product-value">幼年犬(45日龄-12月龄)</span></div>
                        <div class="product-detail">品种: <span class="product-value">边境牧羊犬</span></div>
                    </div>
                </td>
                <td class="price">¥1,580.00</td>
                <td class="quantity">
                    <button>-</button>
                    <input type="text" value="1" readonly>
                    <button>+</button>
                </td>
                <td class="subtotal">¥1,580.00</td>
                <td><button class="delete-button">删除</button></td>
            </tr>
        </table>
        <div class="cart-summary">
            <p>购物车总计</p>
            <p>小计: <span class="total-price">¥26,792.00</span></p>
            <p>配送: 免费配送</p>
            <p>合计: <span class="total-price">¥26,792.00</span></p>
            <button class="checkout-btn">去结算</button>
        </div>
    </div>
</body>
</html>
