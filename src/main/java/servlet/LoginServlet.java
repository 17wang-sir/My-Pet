package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import bean.AttendantBean;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8"); 
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("dlzh");  //获取用户输入的用户名和密码
        String password = request.getParameter("dlmm");
        UserBean user = new UserBean();
        user.setUsername(username);
        user.setPassword(password);
        AttendantBean attendant = new AttendantBean();
        attendant.setAttendantname(username);
        attendant.setAttendantpassword(password);
        final String  url= "jdbc:mysql://localhost:3306/petshop?"+
     			"user=root&password=&characterEncoding=utf-8";//数据库连接url地址
       
       final String myname = "com.mysql.cj.jdbc.Driver";//mysql驱动包名
       
       Connection con=null; //声明连接对象；连接数据库时会用到
          

          try{
            Class.forName(myname);//加载mysql的驱动类
            con = DriverManager.getConnection(url);//连接数据库
            String cx="select * from user where username='"+user.getUsername()+"' and password='"+user.getPassword()+"'";   //查询用户表中是否有username、userpassword这行数据
            PreparedStatement p1=con.prepareStatement(cx);//创建PreparedStatement对象并且执行sql语句
            ResultSet rs1=p1.executeQuery();//接收结果
            String at="select * from attendant where attendantname='"+attendant.getAttendantname()+"' and attendantpassword='"+attendant.getAttendantpassword()+"'";   //查询管理员表中是否有attendantname、attendantpassword这行数据
            PreparedStatement p2=con.prepareStatement(at);//创建PreparedStatement对象并且执行sql语句
            ResultSet rs2=p2.executeQuery();//接收结果

            //查看是否有匹配的用户名密码
            if(rs1.next()||rs2.next())//用户名密码匹配成功，进入登录成功之后的界面
            {  
            	  HttpSession session = request.getSession(); //创建session对象
                  session.setAttribute("username",user.getUsername());//将用户名保存在整个会话期间
                  if(rs1.getRow()==0)  //判断用户表的结果是否为空
                       response.sendRedirect("AdminTitle.jsp"); //重定向到系统管理员主页
                  else
                       response.sendRedirect("Title.jsp");  //重定向到用户主页
            }
            else{
              response.setContentType("text/html;charset=utf-8");//设置响应的内容类型
              PrintWriter out = response.getWriter();//创建PrintWriter对象
              out.println("<script> alert('用户名或密码错误');location.href='login.jsp';</script>"); //作出提示，并且重新回到登录页面
              out.close();
            }
            }catch (Exception e) { //异常处理
                    e.printStackTrace();
                    System.out.println("数据库异常");
              }
	}

}
