# My-Pet 项目

My-Pet 是一个基于 Java 的宠物商店管理系统，支持用户浏览宠物信息、管理订单、购物车功能以及用户注册和登录等功能。

## 项目结构
My-Pet/ ├── .classpath # Eclipse 类路径配置文件 ├── .project # Eclipse 项目配置文件 ├── .settings/ # Eclipse 项目设置目录 ├── build/ # 编译后的字节码文件 │ ├── classes/ # 编译后的 Java 类文件 ├── src/ # 源代码目录 │ ├── main/ │ │ ├── java/ # Java 源代码 │ │ ├── webapp/ # Web 应用资源 │ │ ├── Static/ # 静态资源 (CSS, JS, 图片等) │ │ ├── *.jsp # JSP 页面 ├── .vscode/ # VS Code 配置文件 │ ├── launch.json # VS Code 启动配置

导入项目到 Eclipse：

打开 Eclipse，选择 File -> Import -> Existing Projects into Workspace。
选择项目所在目录并导入。
配置数据库：

创建名为 petshop 的数据库。
导入项目中提供的 SQL 文件（如果有）。
配置 Tomcat：

在 Eclipse 中添加 Tomcat 服务器。
将项目部署到 Tomcat。
启动项目：

运行 Tomcat 服务器。
在浏览器中访问 http://localhost:8080/My-Pet。

## 功能

- **用户功能**
  - 用户注册、登录、注销
  - 浏览宠物信息
  - 添加宠物到购物车
  - 提交订单并查看订单状态

- **管理员功能**
  - 管理商品信息
  - 管理订单状态
  - 发布新闻资讯

- **其他功能**
  - 帮助中心
  - 问答资讯

## 技术栈

- **后端**: Java Servlet, JSP
- **前端**: HTML, CSS, JavaScript, jQuery
- **数据库**: MySQL
- **服务器**: Apache Tomcat 8.5
- **开发工具**: Eclipse, Visual Studio Code

## 环境要求

- JDK 1.8 或更高版本
- Apache Tomcat 8.5 或更高版本
- MySQL 数据库

## 部署步骤

1. 克隆项目到本地：
   ```bash
   git clone https://github.com/your-username/My-Pet.git
2.导入项目到 Eclipse：

3.打开 Eclipse，选择 File -> Import -> Existing Projects into Workspace。
选择项目所在目录并导入。
配置数据库：

4.创建名为 petshop 的数据库。
导入项目中提供的 SQL 文件（如果有）。
配置 Tomcat：

5.在 Eclipse 中添加 Tomcat 服务器。
将项目部署到 Tomcat。
启动项目：

6.运行 Tomcat 服务器。
在浏览器中访问 http://localhost:8080/My-Pet。


使用说明
用户可以通过注册和登录访问宠物商店的功能。
管理员可以通过后台管理界面管理商品和订单。
