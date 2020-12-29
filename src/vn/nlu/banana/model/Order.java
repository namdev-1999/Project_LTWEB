package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Order {

    private int id;
    private int status;
    private Date date;
    private double total;
    private int code;
    private int payment;
    private String address;
    private String name;
    private String phone;
    private int idUser;
    private ArrayList<OrderItem> listOrderItem = new ArrayList<>();


    public Order(int id, int status, Date date, double total, int code, int payment, String address, String name, String phone) {
        this.id = id;
        this.status = status;
        this.date = date;
        this.total = total;
        this.code = code;
        this.payment = payment;
        this.address = address;
        this.name = name;
        this.phone = phone;
    }

    public Order() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdUser() {
        return idUser;
    }

    public ArrayList<OrderItem> getListOrderItem() {
        return listOrderItem;
    }

    public void setListOrderItem(ArrayList<OrderItem> listOrderItem) {
        this.listOrderItem = listOrderItem;
    }

    public static void delOrder(int id) throws SQLException, ClassNotFoundException {
        String sql = "update  `order` SET `order`.`status`=0 where id =?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    @Override
    public String toString() {
        return this.getName() + " - " + this.getStatus() + " - " + this.getDate();
    }
}
