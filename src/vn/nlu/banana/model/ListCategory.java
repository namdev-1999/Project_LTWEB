package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.Type;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListCategory {
    public static ArrayList<Type> getListCategory() throws SQLException, ClassNotFoundException {
        String sql = "Select * from producttype";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Type> list = new ArrayList<>();
        while (rs.next()) {
            Type category = new Type();
            category.setId(rs.getInt(1));
            category.setName(rs.getString(2));
            category.setQuantity(rs.getInt(3));
            list.add(category);
        }

        return list;
    }

    public static String getTypeName(int type) throws SQLException, ClassNotFoundException {
        String name = "";
        for (Type t : getListCategory()) {
            if (type == t.getId()) {
                name = t.getName();
            }
        }
        return name;
    }

}
