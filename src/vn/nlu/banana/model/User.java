package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private int id;
    private String email;
    private String pass;
    private String name;
    private String address;
    private String phone;
    private int admin;
    private int active;

    public User() {
    }

    public User(int id, String email, String pass, String name, String address, String phone, int admin, int active) {
        super();
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.admin = admin;
        this.active = active;
    }

    public User(String email, String pass, String phone, String address) {
        super();
        this.email = email;
        this.pass = pass;
        this.phone = phone;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return email;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public static void addUser(String email, String password, String username, String address, String phone, byte admin, byte active) throws SQLException, ClassNotFoundException {
        ResultSet rs = ListUser.getRSUser();
        rs.last();
        int id = rs.getRow() + 1;
        String sql = "Insert into `user` values(?,?,?,?,?,?,?,?,null)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setString(4, username);
        ps.setString(5, address);
        ps.setString(6, phone);
        ps.setByte(7, admin);
        ps.setByte(8, active);
        ps.executeUpdate();
    }

    public static void delUser(int id) throws SQLException, ClassNotFoundException {
        String sql = "delete from `user` where id =?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public static void editUser(int id, String email, String password, String username, String address, String phone, byte admin, byte active) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE user SET user.email=?,user.password=?,user.name=?,user.address=?,user.phone=?,user.admin=?,user.active=? where user.id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        ps.setString(3, username);
        ps.setString(4, address);
        ps.setString(5, phone);
        ps.setByte(6, admin);
        ps.setByte(7, active);
        ps.setInt(8,id);
        ps.executeUpdate();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ResultSet rs = ListUser.getRSUser();
        rs.last();
        int id = rs.getRow();
        System.out.println(id);
    }
}
