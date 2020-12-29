package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.Shoe;
import vn.nlu.banana.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListUser {
    public static ResultSet getRSUser() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM user";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
    }
}
