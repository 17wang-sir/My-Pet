package servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.PrintWriter;
import bean.UserBean;
@WebServlet("/RegisterServlet")

public class RegisterServlet extends HttpServlet {
	   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
        // 设置获取数据的格式
        request.setCharacterEncoding("utf-8"); 
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        UserBean user = new UserBean();
        user.setUsername(username);
		user.setPassword(password);
		user.setTelephone(telephone);
		user.setEmail(email);
		
        final String  url= "jdbc:mysql://localhost:3306/petshop?"+
     			"user=root&password=&characterEncoding=utf-8";//数据库连接url地址，可以在Drive and Data Source里面查看自己的数据库的地址
         
        final String myname = "com.mysql.cj.jdbc.Driver";//mysql驱动包名
           
           Connection con=null;//声明连接对象；连接数据库时会用到
           
         
            try {
            Class.forName(myname);//加载mysql的驱动类
            con = DriverManager.getConnection(url);//连接数据库
            String cx="select * from user where username='"+user.getUsername()+"'";    //查询表中是否已经有该用户名的数据存在
            PreparedStatement abc=con.prepareStatement(cx);    //执行sql语句
            ResultSet rs=abc.executeQuery();    //接受结果
            //查看是否已经有记录
            if(rs.next())//已经有记录，提示用户并且重新注册
            {    
            	  response.setContentType("text/html;charset=utf-8");//设置响应的内容类型
	              PrintWriter out = response.getWriter();//创建PrintWriter对象
                 out.println("<script> alert('非常抱歉，该用户名已经被注册！');location.href='register.jsp';</script>");//提示用户并重新注册
                 out.close();
            }
            else{//没有记录，则将用户的注册信息写入数据库
                 
                 String sql = "INSERT INTO user(username,password,telephone,email) values('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getTelephone()+"','"+user.getEmail()+"')";//指定所要插入数据的列
                 PreparedStatement prep=con.prepareStatement(sql);
                 prep.executeUpdate(sql);//调用jdbc插入数据更新表格
                 // 跳转到注册成功页面
	             response.sendRedirect("registersuccess.jsp");
            }
       
            }catch (Exception e) { //异常处理
                e.printStackTrace();
                System.out.println("数据库异常");
     }
    }
}