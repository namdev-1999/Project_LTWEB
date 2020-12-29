package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Blog {
    int id;
    String title;
    String titleContent;
    String content;
    Date date;
    public List<String> image = new ArrayList<>();

    public Blog() {
    }

    public Blog(int id, String title, String titleContent, String content, List<String> image) {
        this.id = id;
        this.title = title;
        this.titleContent = titleContent;
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public String getTitleContent() {
        return titleContent;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setTitleContent(String titleContent) {
        this.titleContent = titleContent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public static Blog getBlogById(int id) {
        Blog b = new Blog();
        try {
            String sql = "Select * from `blog` where blog.id=? ";
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.first();
            b.setId(rs.getInt(1));
            b.setTitle(rs.getString(3));
            b.setTitleContent(rs.getString(4));
            b.setContent(rs.getString(2));
            String date[] = rs.getString(5).split("-");
            b.setDate(new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0])));

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public String toString() {
        return title + date;
    }
}
