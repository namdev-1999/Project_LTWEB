package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Ads {
    private String img;
    private int id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;
    private Date dateStart;
    private Date dateEnd;
    private double saleUp;
    private int active;

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }


    public Ads() {
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public double getSaleUp() {
        return saleUp;
    }

    public void setSaleUp(double saleUp) {
        this.saleUp = saleUp;
    }

    @Override
    public String toString() {
        return id + "  " + dateStart + "  " + dateEnd;
    }

    public static List<Ads> getListAds() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM ads WHERE active=1";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Ads> list = new ArrayList<>();

        while (rs.next()) {
            Ads ads = new Ads();
            ads.setId(rs.getInt(1));
            ads.setName(rs.getString(2));
            ads.setImg(rs.getString(3));
            String dateStart[] = rs.getString(4).split("-");
            ads.setDateStart(new Date(Integer.parseInt(dateStart[2]), Integer.parseInt(dateStart[1]), Integer.parseInt(dateStart[0])));
            String dateEnd[] = rs.getString(5).split("-");
            ads.setDateEnd(new Date(Integer.parseInt(dateEnd[2]), Integer.parseInt(dateEnd[1]), Integer.parseInt(dateEnd[0])));
            ads.setSaleUp(rs.getInt(6));
            ads.setActive(rs.getInt(7));
            list.add(ads);
        }
        return list;
    }

    public static List<Ads> getListAllAds() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM ads";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Ads> list = new ArrayList<>();

        while (rs.next()) {
            Ads ads = new Ads();
            ads.setId(rs.getInt(1));
            ads.setName(rs.getString(2));
            ads.setImg(rs.getString(3));

            String dateStart[] = rs.getString(4).split("-");
            ads.setDateStart(new Date(Integer.parseInt(dateStart[2]), Integer.parseInt(dateStart[1]), Integer.parseInt(dateStart[0])));
            String dateEnd[] = rs.getString(5).split("-");
            ads.setDateEnd(new Date(Integer.parseInt(dateEnd[2]), Integer.parseInt(dateEnd[1]), Integer.parseInt(dateEnd[0])));
            ads.setSaleUp(rs.getInt(6));
            ads.setActive(rs.getInt(7));
            list.add(ads);
        }
        return list;
    }

    public static void addAds(String name, String images, String dateStart, String dateEnd, double saleUp, int active) throws SQLException, ClassNotFoundException {
        String sqlId = "select * from ads";
        PreparedStatement psId = DBConnection.getPreparedStatement(sqlId);
        ResultSet rs2 = psId.executeQuery();
        int id = 1;
        while (rs2.next()) {
            if (rs2.getInt(1) >= id) {
                id = rs2.getInt(1) + 1;
            }
        }
        String sql = "Insert INTO ads values(?,?,?,?,?,?,?)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setString(3, images);
        ps.setString(4, dateStart);
        ps.setString(5, dateEnd);
        ps.setDouble(6, saleUp);
        ps.setInt(7, active);
        ps.executeUpdate();
    }

    public static void editAds(String name, String images, String dateStart, String dateEnd, double saleUp, int active, int idAds) throws SQLException, ClassNotFoundException {
        String sql = "Update ads SET ads.name=?,ads.img=?,ads.datestart=?,ads.dateend=?,ads.saleup=?,ads.active=? where ads.id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setString(1, name);
        ps.setString(2, images);
        ps.setString(3, dateStart);
        ps.setString(4, dateEnd);
        ps.setDouble(5, saleUp);
        ps.setInt(6, active);
        ps.setInt(7, idAds);
        ps.executeUpdate();
    }

    public static void delAds(int id) throws SQLException, ClassNotFoundException {
        String sql = "Delete FROM ads where id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public static void main(String[] args) {
        try {
            System.out.println(getListAllAds());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
