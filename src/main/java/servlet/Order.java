package servlet;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private int orderid;
    private Date ordertime;
    private String name;
    private String orderstatus;
    private String telephone;
    private String address;
    
 
    

    public int getOrderid() { return orderid; }
    public void setOrderid(int orderid) { this.orderid = orderid; }

    public Date getOrdertime() { return ordertime; }
    public void setOrdertime(Date ordertime) { this.ordertime = ordertime; }

    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }


    public String getOrderstatus() { return orderstatus; }
    public void setOrderstatus(String orderstatus) { this.orderstatus = orderstatus; }

    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }


}