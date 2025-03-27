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
        String username = request.getParameter("dlzh");  //��ȡ�û�������û���������
        String password = request.getParameter("dlmm");
        UserBean user = new UserBean();
        user.setUsername(username);
        user.setPassword(password);
        AttendantBean attendant = new AttendantBean();
        attendant.setAttendantname(username);
        attendant.setAttendantpassword(password);
        final String  url= "jdbc:mysql://localhost:3306/petshop?"+
     			"user=root&password=&characterEncoding=utf-8";//���ݿ�����url��ַ
       
       final String myname = "com.mysql.cj.jdbc.Driver";//mysql��������
       
       Connection con=null; //�������Ӷ����������ݿ�ʱ���õ�
          

          try{
            Class.forName(myname);//����mysql��������
            con = DriverManager.getConnection(url);//�������ݿ�
            String cx="select * from user where username='"+user.getUsername()+"' and password='"+user.getPassword()+"'";   //��ѯ�û������Ƿ���username��userpassword��������
            PreparedStatement p1=con.prepareStatement(cx);//����PreparedStatement������ִ��sql���
            ResultSet rs1=p1.executeQuery();//���ս��
            String at="select * from attendant where attendantname='"+attendant.getAttendantname()+"' and attendantpassword='"+attendant.getAttendantpassword()+"'";   //��ѯ����Ա�����Ƿ���attendantname��attendantpassword��������
            PreparedStatement p2=con.prepareStatement(at);//����PreparedStatement������ִ��sql���
            ResultSet rs2=p2.executeQuery();//���ս��

            //�鿴�Ƿ���ƥ����û�������
            if(rs1.next()||rs2.next())//�û�������ƥ��ɹ��������¼�ɹ�֮��Ľ���
            {  
            	  HttpSession session = request.getSession(); //����session����
                  session.setAttribute("username",user.getUsername());//���û��������������Ự�ڼ�
                  if(rs1.getRow()==0)  //�ж��û���Ľ���Ƿ�Ϊ��
                       response.sendRedirect("AdminTitle.jsp"); //�ض���ϵͳ����Ա��ҳ
                  else
                       response.sendRedirect("Title.jsp");  //�ض����û���ҳ
            }
            else{
              response.setContentType("text/html;charset=utf-8");//������Ӧ����������
              PrintWriter out = response.getWriter();//����PrintWriter����
              out.println("<script> alert('�û������������');location.href='login.jsp';</script>"); //������ʾ���������»ص���¼ҳ��
              out.close();
            }
            }catch (Exception e) { //�쳣����
                    e.printStackTrace();
                    System.out.println("���ݿ��쳣");
              }
	}

}
