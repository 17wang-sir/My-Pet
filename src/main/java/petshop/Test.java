package petshop;
import java.sql.*;
public class Test {

    public static Connection getConn(){
	    	String driver_string = "com.mysql.cj.jdbc.Driver";
	    	String url= "jdbc:mysql://localhost:3306/petshop?"+
	          			"user=root&password=WZC5201314&characterEncoding=gb2312";     
	        Connection conn = null;
	        try {
	            Class.forName(driver_string);   //Step1：加载JDBC驱动
	            conn = DriverManager.getConnection(url);    //Step2：建立连接
	            System.out.println("数据库连接正常");
	        } catch (Exception e){
	            System.out.println("数据库连接异常");
	            e.printStackTrace();
	            }
	        return conn;
	    }
      public static void main(String[] args) {
		Test.getConn();
	}
	}
