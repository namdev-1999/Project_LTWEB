package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Type {
    private int id;
    private String name;
    private int quantity;
    private int active;

    public Type() {

    }

    public Type(int id, String name, int quantity, int active) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.active = active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
    public static void delProducer(int id) throws SQLException, ClassNotFoundException {
        String sql = "Delete FROM producttype where id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public static void addProducer(String name) throws SQLException, ClassNotFoundException {
        int id = ListCategory.getListCategory().size() + 1;
        String sql = "Insert into producttype values(?,?,?,1)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.executeUpdate();
    }

    public static void editProducer(int id, String name) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE producttype SET producttype.name =? where producttype.id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setString(1, name);
        ps.setInt(2, id);
        ps.executeUpdate();
    }
}
