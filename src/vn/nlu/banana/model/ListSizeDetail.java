package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListSizeDetail {
    public static ArrayList<SizeDetail> listProductSize(int idProduct) throws SQLException, ClassNotFoundException {
        String sql = "select size.id,  size.size, size.remain FROM size JOIN product ON product.id=size.idproduct where product.id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, idProduct);
        ResultSet rs = ps.executeQuery();
        ArrayList<SizeDetail> list = new ArrayList<>();
        while (rs.next()) {
            SizeDetail sd = new SizeDetail();
            sd.setId(rs.getInt(1));
            sd.setIdproduct(idProduct);
            sd.setSize(rs.getInt(2));
            sd.setRemain(rs.getInt(3));
            list.add(sd);
        }
        return list;
    }

    //     add size
    public static void addSizeDetail(int idproduct, int size, int remain) throws SQLException, ClassNotFoundException {
        String sqlId = "select * from size";
        PreparedStatement psId = DBConnection.getPreparedStatement(sqlId);
        ResultSet rs2 = psId.executeQuery();
        int id = 1;
        while (rs2.next()) {
            if (rs2.getInt(1) >= id) {
                id = rs2.getInt(1) + 1;
            }
        }
        String sql = "Insert into size values(?,?,?,?)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setInt(2, idproduct);
        ps.setInt(3, size);
        ps.setInt(4, remain);
        ps.executeUpdate();
    }

    public static void addListSizeDetail(ArrayList<SizeDetail> list) throws SQLException, ClassNotFoundException {
        int idproduct = ListProduct.getListProduct().get(ListProduct.getListProduct().size() - 1).getId();
        for (SizeDetail sizeDetail : list) {
            sizeDetail.setIdproduct(idproduct);
            addSizeDetail(idproduct, sizeDetail.getSize(), sizeDetail.getRemain());
        }
    }

    public static void editSizeDetail(int idsize,int size, int remain) throws SQLException, ClassNotFoundException {
        String sql = "Update size SET size.size=?, size.remain=? where size.id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, size);
        ps.setInt(2, remain);
        ps.setInt(3, idsize);
        ps.executeUpdate();
    }
}
