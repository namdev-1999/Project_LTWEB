package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.Blog;
import vn.nlu.banana.model.Shoe;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ListProduct {
    public static ArrayList<Shoe> getListProductByCategory(int type) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM product WHERE idtype = ?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, type);
        ResultSet rs = ps.executeQuery();
        ArrayList<Shoe> list = new ArrayList<>();
        while (rs.next()) {
            Shoe product = new Shoe();
            product.setId(rs.getInt(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getDouble(3));
            product.setIdType(rs.getInt(4));
            product.setDes(rs.getString(6));

            String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
            ps1.setInt(1, rs.getInt(1));
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                product.setImage(rs1.getString(1));
            }

            String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
            ps2.setInt(1, rs.getInt(1));
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Comment c = new Comment();
                c.setId(rs2.getInt(1));
                c.setUsername(rs2.getString(3));
                c.setContent(rs2.getString(4));
                c.setStar(rs2.getInt(5));
                product.addComment(c);
            }
            list.add(product);
        }
        return list;
    }

    public static ArrayList<Shoe> getListProduct() throws SQLException, ClassNotFoundException {
        String sql = "SELECT product.* FROM product ";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Shoe> list = new ArrayList<>();
        while (rs.next()) {
            Shoe product = new Shoe();
            product.setId(rs.getInt(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getDouble(3));
            product.setIdType(rs.getInt(4));
            product.setDes(rs.getString(6));

            String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
            ps1.setInt(1, rs.getInt(1));
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                product.setImage(rs1.getString(1));
            }
            String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
            ps2.setInt(1, rs.getInt(1));
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Comment c = new Comment();
                c.setId(rs2.getInt(1));
                c.setUsername(rs2.getString(3));
                c.setContent(rs2.getString(4));
                c.setStar(rs2.getInt(5));
                product.addComment(c);
            }

            list.add(product);
        }
        return list;
    }

    public static ArrayList<Shoe> getNewListProduct() throws SQLException, ClassNotFoundException {
        String sql = "SELECT product.* FROM newproduct join product on newproduct.idproduct = product.id ";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Shoe> list = new ArrayList<>();
        while (rs.next()) {
            Shoe product = new Shoe();
            product.setId(rs.getInt(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getDouble(3));
            product.setIdType(rs.getInt(4));
            product.setDes(rs.getString(6));

            String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
            ps1.setInt(1, rs.getInt(1));
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                product.setImage(rs1.getString(1));
            }
            String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
            ps2.setInt(1, rs.getInt(1));
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Comment c = new Comment();
                c.setId(rs2.getInt(1));
                c.setUsername(rs2.getString(3));
                c.setContent(rs2.getString(4));
                c.setStar(rs2.getInt(5));
                product.addComment(c);
            }
            list.add(product);
        }
        return list;
    }

    public static ArrayList<Shoe> getHotListProduct() throws SQLException, ClassNotFoundException {
        String sql = "SELECT product.* FROM hotproduct join product on hotproduct.idproduct = product.id ";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Shoe> list = new ArrayList<>();
        while (rs.next()) {
            Shoe product = new Shoe();
            product.setId(rs.getInt(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getDouble(3));
            product.setDes(rs.getString(6));
            product.setIdType(rs.getInt(4));

            String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
            ps1.setInt(1, rs.getInt(1));
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                product.setImage(rs1.getString(1));
            }
            String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
            ps2.setInt(1, rs.getInt(1));
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Comment c = new Comment();
                c.setId(rs2.getInt(1));
                c.setUsername(rs2.getString(3));
                c.setContent(rs2.getString(4));
                c.setStar(rs2.getInt(5));

                product.addComment(c);
            }

            list.add(product);
        }
        return list;
    }

    public static ArrayList<Shoe> getRelatedListProduct() throws SQLException, ClassNotFoundException {
        String sql = "SELECT product.* FROM relatedproduct join product on relatedproduct.idproduct = product.id ";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Shoe> list = new ArrayList<>();
        while (rs.next()) {
            Shoe product = new Shoe();
            product.setId(rs.getInt(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getDouble(3));
            product.setIdType(rs.getInt(4));
            product.setDes(rs.getString(6));

            String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
            ps1.setInt(1, rs.getInt(1));
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                product.setImage(rs1.getString(1));
            }
            String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
            ps2.setInt(1, rs.getInt(1));
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Comment c = new Comment();
                c.setId(rs2.getInt(1));
                c.setUsername(rs2.getString(3));
                c.setContent(rs2.getString(4));
                c.setStar(rs2.getInt(5));
                product.addComment(c);
            }
            list.add(product);
        }
        return list;
    }

    public static ArrayList<Shoe> getUpsellListProduct() throws SQLException, ClassNotFoundException {
        String sql = "SELECT product.* FROM upsellproduct join product on upsellproduct.idproduct = product.id ";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Shoe> list = new ArrayList<>();
        while (rs.next()) {
            Shoe product = new Shoe();
            product.setId(rs.getInt(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getDouble(3));
            product.setIdType(rs.getInt(4));
            product.setDes(rs.getString(6));

            String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
            ps1.setInt(1, rs.getInt(1));
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                product.setImage(rs1.getString(1));
            }
            String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
            ps2.setInt(1, rs.getInt(1));
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Comment c = new Comment();
                c.setId(rs2.getInt(1));
                c.setUsername(rs2.getString(3));
                c.setContent(rs2.getString(4));
                c.setStar(rs2.getInt(5));
                product.addComment(c);
            }
            list.add(product);
        }
        return list;
    }

    public static Shoe getShoe(int productID) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM product WHERE id = ?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, productID);
        ResultSet rs = ps.executeQuery();
        rs.first();
        Shoe product = new Shoe();
        product.setId(rs.getInt(1));
        product.setName(rs.getString(2));
        product.setPrice(rs.getDouble(3));
        product.setDes(rs.getString(6));

        String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
        PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
        ps1.setInt(1, rs.getInt(1));
        ResultSet rs1 = ps1.executeQuery();
        while (rs1.next()) {
            product.setImage(rs1.getString(1));
        }
        String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
        PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
        ps2.setInt(1, rs.getInt(1));
        ResultSet rs2 = ps2.executeQuery();
        while (rs2.next()) {
            Comment c = new Comment();
            c.setId(rs2.getInt(1));
            c.setUsername(rs2.getString(3));
            c.setContent(rs2.getString(4));
            c.setStar(rs2.getInt(5));
            String date[] = rs2.getString(6).split("-");
            c.setDate(new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0])));

            product.addComment(c);
        }
        return product;
    }

    public static ArrayList<Shoe> sortByPriceFromLowToHigh(ArrayList<Shoe> list) {
        Comparator<Shoe> com = new Comparator<Shoe>() {
            @Override
            public int compare(Shoe o1, Shoe o2) {
                if (o1.price == o2.price)
                    return 0;
                else if (o1.price > o2.price)
                    return 1;
                return -1;
            }
        };
        list.sort(com);
        return list;
    }

    public static ArrayList<Shoe> sortByPriceFromHighToLow(ArrayList<Shoe> list) {
        Comparator<Shoe> com = new Comparator<Shoe>() {
            @Override
            public int compare(Shoe o1, Shoe o2) {
                if (o1.price == o2.price)
                    return 0;
                else if (o1.price < o2.price)
                    return 1;
                return -1;
            }
        };
        list.sort(com);
        return list;
    }

    public static void addProduct(String name, double price, int idType, String desc, ArrayList<String> images) throws SQLException, ClassNotFoundException {
        int id = getListProduct().size() + 20;
        String sql = "Insert INTO product values(?,?,?,?,1,?)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setDouble(3, price);
        ps.setInt(4, idType);
        ps.setString(5, desc);
        ps.executeUpdate();

        int idImg = id * 6;
        for (String s : images) {
            String img = "Insert INTO image values(?,?,?)";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(img);
            ps2.setInt(1, idImg);
            ps2.setInt(2, id);
            ps2.setString(3, s);
            idImg++;
            ps2.executeUpdate();
        }

    }

    public static void editProduct(int id, String name, double price, int idType, String desc, ArrayList<String> images) throws SQLException, ClassNotFoundException {
        String sql = "Update product SET product.name=?,product.price=?,product.idtype=?,product.description=? where product.id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setString(1, name);
        ps.setDouble(2, price);
        ps.setInt(3, idType);
        ps.setString(4, desc);
        ps.setInt(5, id);
        ps.executeUpdate();

        String sqlImg = "select * from image where idproduct =?";
        PreparedStatement ps1 = DBConnection.getPreparedStatement(sqlImg);
        ps1.setInt(1,id);
        ResultSet rs = ps1.executeQuery();
        rs.first();
        for (String s : images) {
            String img = "Update image SET image.idproduct=?,image.img=? where image.id=?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(img);
            ps2.setInt(1, id);
            ps2.setString(2, s);
            ps2.setInt(3, rs.getInt(1));
            ps2.executeUpdate();
            rs.next();
        }

    }

    public static ArrayList<String> getImagesProduct(int id) throws SQLException, ClassNotFoundException {
        String sql = "select * from image where idproduct=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        ArrayList<String> list = new ArrayList<>();
        while(rs.next()){
            list.add(rs.getString(3));
        }
        return list;
    }

    public static void delProduct(int id) throws SQLException, ClassNotFoundException {
        String sql = "Delete FROM product where id=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        System.out.println(sortByPriceFromHighToLow(getListProduct()));
        try {
            System.out.println(getShoe(1).getName());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Shoe> getListProductExcept(String except) throws SQLException, ClassNotFoundException {
        String sql = "select * from product where product.id NOT IN( SELECT " + except + ".idproduct from " + except + ")";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Shoe> list = new ArrayList<>();
        while (rs.next()) {
            Shoe product = new Shoe();
            product.setId(rs.getInt(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getDouble(3));
            product.setIdType(rs.getInt(4));
            product.setDes(rs.getString(6));

            String img = "select img,product.id from product join image on product.id=image.idproduct where product.id=?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(img);
            ps1.setInt(1, rs.getInt(1));
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                product.setImage(rs1.getString(1));
            }
            String cmt = "SELECT *	FROM `comment` WHERE idproduct =?";
            PreparedStatement ps2 = DBConnection.getPreparedStatement(cmt);
            ps2.setInt(1, rs.getInt(1));
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Comment c = new Comment();
                c.setId(rs2.getInt(1));
                c.setUsername(rs2.getString(3));
                c.setContent(rs2.getString(4));
                c.setStar(rs2.getInt(5));
                product.addComment(c);
            }

            list.add(product);
        }
        return list;
    }

    public static void addHotProduct(int idproduct) throws SQLException, ClassNotFoundException {
        String sqlId = "select * from hotproduct";
        PreparedStatement psId = DBConnection.getPreparedStatement(sqlId);
        ResultSet rs2 = psId.executeQuery();
        int id = 1;
        while (rs2.next()){
            if (rs2.getInt(1)>=id){
                id=rs2.getInt(1)+1;
            }
        }
        String sql = "Insert into hotproduct values(?,?)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setInt(2, idproduct);
        ps.executeUpdate();
    }

    public static void addNewProduct(int idproduct) throws SQLException, ClassNotFoundException {
        String sqlId = "select * from newproduct";
        PreparedStatement psId = DBConnection.getPreparedStatement(sqlId);
        ResultSet rs2 = psId.executeQuery();
        int id = 1;
        while (rs2.next()){
            if (rs2.getInt(1)>=id){
                id=rs2.getInt(1)+1;
            }
        }
        String sql = "Insert into newproduct values(?,?)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setInt(2, idproduct);
        ps.executeUpdate();
    }

    public static void addRelatedProduct(int idproduct) throws SQLException, ClassNotFoundException {
        String sqlId = "select * from relatedproduct";
        PreparedStatement psId = DBConnection.getPreparedStatement(sqlId);
        ResultSet rs2 = psId.executeQuery();
        int id = 1;
        while (rs2.next()){
            if (rs2.getInt(1)>=id){
                id=rs2.getInt(1)+1;
            }
        }
        String sql = "Insert into relatedproduct values(?,?)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setInt(2, idproduct);
        ps.executeUpdate();
    }

    public static void addUpsellProduct(int idproduct) throws SQLException, ClassNotFoundException {
        String sqlId = "select * from upsellproduct";
        PreparedStatement psId = DBConnection.getPreparedStatement(sqlId);
        ResultSet rs2 = psId.executeQuery();
        int id = 1;
        while (rs2.next()){
            if (rs2.getInt(1)>=id){
                id=rs2.getInt(1)+1;
            }
        }
        String sql = "Insert into upsellproduct values(?,?)";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ps.setInt(2, idproduct);
        ps.executeUpdate();
    }

    public static void delProductSp(int idproduct,String sp) throws SQLException, ClassNotFoundException {
        String sql = "Delete FROM " + sp + "product where idproduct=?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, idproduct);
        ps.executeUpdate();
    }



}

