package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListComment {

    public static ArrayList<Comment> getListComment() throws SQLException, ClassNotFoundException {
        String sql = "SELECT comment.* FROM comment ";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Comment> list = new ArrayList<>();
        while (rs.next()) {
            Comment comment = new Comment();
            comment.setId(rs.getInt(1));
            comment.setIdProduct(rs.getInt(2));
            comment.setUsername(rs.getString(3));
            comment.setContent(rs.getString(4));
            String date[] = rs.getString(6).split("-");
            comment.setDate(new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0])));
            list.add(comment);
        }
        return list;
    }
}
