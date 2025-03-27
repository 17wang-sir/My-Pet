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
        // ���û�ȡ���ݵĸ�ʽ
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
     			"user=root&password=&characterEncoding=utf-8";//���ݿ�����url��ַ��������Drive and Data Source����鿴�Լ������ݿ�ĵ�ַ
         
        final String myname = "com.mysql.cj.jdbc.Driver";//mysql��������
           
           Connection con=null;//�������Ӷ����������ݿ�ʱ���õ�
           
         
            try {
            Class.forName(myname);//����mysql��������
            con = DriverManager.getConnection(url);//�������ݿ�
            String cx="select * from user where username='"+user.getUsername()+"'";    //��ѯ�����Ƿ��Ѿ��и��û��������ݴ���
            PreparedStatement abc=con.prepareStatement(cx);    //ִ��sql���
            ResultSet rs=abc.executeQuery();    //���ܽ��
            //�鿴�Ƿ��Ѿ��м�¼
            if(rs.next())//�Ѿ��м�¼����ʾ�û���������ע��
            {    
            	  response.setContentType("text/html;charset=utf-8");//������Ӧ����������
	              PrintWriter out = response.getWriter();//����PrintWriter����
                 out.println("<script> alert('�ǳ���Ǹ�����û����Ѿ���ע�ᣡ');location.href='register.jsp';</script>");//��ʾ�û�������ע��
                 out.close();
            }
            else{//û�м�¼�����û���ע����Ϣд�����ݿ�
                 
                 String sql = "INSERT INTO user(username,password,telephone,email) values('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getTelephone()+"','"+user.getEmail()+"')";//ָ����Ҫ�������ݵ���
                 PreparedStatement prep=con.prepareStatement(sql);
                 prep.executeUpdate(sql);//����jdbc�������ݸ��±��
                 // ��ת��ע��ɹ�ҳ��
	             response.sendRedirect("registersuccess.jsp");
            }
       
            }catch (Exception e) { //�쳣����
                e.printStackTrace();
                System.out.println("���ݿ��쳣");
     }
    }
}