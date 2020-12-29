package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListBlog {
    public static ArrayList<Blog> getListBlog() throws SQLException, ClassNotFoundException {
        String sql = "SELECT blog.* FROM blog ";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Blog> list = new ArrayList<>();
        while (rs.next()) {
            Blog blog = new Blog();
            blog.setId(rs.getInt(1));
            blog.setContent(rs.getString(2));
            blog.setTitle(rs.getString(3));
            blog.setTitleContent(rs.getString(4));
            String date[] = rs.getString(5).split("-");
            blog.setDate(new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0])));
            list.add(blog);
        }
        return list;
    }

    public static void main(String[] args) {
        try {
            System.out.println(getListBlog());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
