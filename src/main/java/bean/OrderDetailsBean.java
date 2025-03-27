package bean;

import java.math.BigDecimal;
import java.util.List;

public class OrderDetailsBean {
    private String productphoto;
    private String productname;
    private String sex;
    private String age;
    private BigDecimal price;
    private int quantity;
    private BigDecimal allprice;
    
    private int orderid;
    private String orderstatus;
    private String name;
    private String address;
    private String telephone;
    private List<OrderDetailsBean> orderItems;

    // Getters and setters
    public String getProductphoto() {
        return productphoto;
    }

    public void setProductphoto(String productphoto) {
        this.productphoto = productphoto;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getAllprice() {
        return allprice;
    }

    public void setAllprice(BigDecimal allprice) {
        this.allprice = allprice;
    }
    
    // Getters and setters
    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public List<OrderDetailsBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderDetailsBean> orderItems) {
        this.orderItems = orderItems;
    }
}

