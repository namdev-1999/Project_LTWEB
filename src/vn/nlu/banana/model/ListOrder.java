package vn.nlu.banana.model;

import vn.nlu.banana.Util.DBConnection;

import java.nio.charset.Charset;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ListOrder {
    public static ArrayList<Order> getListOfOrder() throws SQLException, ClassNotFoundException, ParseException {
        String sql = "select * from `order` where status not like 0";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Order> list = new ArrayList<>();
        while (rs.next()) {
            Order o = new Order();
            o.setId(rs.getInt(1));
            o.setStatus(rs.getInt(2));
            String date[] = rs.getString(3).split("-");
            o.setDate(new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0])));
            o.setTotal(rs.getDouble(4));
            o.setCode(rs.getInt(5));
            o.setPayment(rs.getInt(6));
            o.setAddress(rs.getString(7));
            o.setName(rs.getString(8));
            o.setPhone(rs.getString(9));
            list.add(o);
        }
        return list;
    }

    public static int getNumberProductInMonthByType(Date date, int id) throws ParseException, SQLException, ClassNotFoundException {
        int count = 0;

        for (Order o : getListOfOrder()
        ) {
            if (o.getDate().inMonth(date)) {
                for (OrderItem item : getListOrderById(o.getId())
                ) {
                    if (item.getId() == id) {
                        count++;
                    }

                }
            }

        }
        return count;
    }

    public static int getDoanhThubyIDType(int id, Date date) throws ParseException, SQLException, ClassNotFoundException {
        int count = 0;
        for (Order o : getListOfOrder()
        ) {
            if (o.getDate().equals(date)) {
                for (OrderItem item : getListOrderById(o.getId())
                ) {
                    if (item.getId() == id) {
                        count += item.getTotal();
                    }
                }
            }

        }
        return count;
    }

    public static int getDoanhThuByYear(Date date) throws ParseException, SQLException, ClassNotFoundException {
        int count = 0;
        for (Order o : getListOfOrder()
        ) {
            if (o.getDate().getYear() == (date.getYear())) {

                count += o.getTotal();

            }

        }
        return count;
    }


    public static ArrayList<OrderItem> getListOrderById(int id) throws SQLException, ClassNotFoundException {
        String sql = "select product.name, orderdetail.size, product.price,orderdetail.quantity,(product.price * orderdetail.quantity) " +
                "as total, product.idtype from `order` join `orderdetail` on order.id = orderdetail.idorder JOIN product ON orderdetail.idproduct = product.id where order.id = ?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        ArrayList<OrderItem> list = new ArrayList<>();
        while (rs.next()) {
            OrderItem ot = new OrderItem();
            ot.setName(rs.getString(1));
            ot.setSize(rs.getInt(2));
            ot.setPrice(rs.getDouble(3));
            ot.setQuantity(rs.getInt(4));
            ot.setTotal(rs.getDouble(5));
            ot.setId(rs.getInt(6));
            String getImg = "SELECT image.img FROM image WHERE idproduct =?";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(getImg);
            ps1.setInt(1, ot.getId());
            ResultSet rs1 = ps1.executeQuery();
            rs1.first();
            ot.setUrlImg(rs1.getString(1));
            list.add(ot);
        }
        return list;
    }

    public static ArrayList<Order> getListOrderByIdUser(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * from `order` WHERE iduser =?";
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        ArrayList<Order> list = new ArrayList<>();
        rs.last();
        int row = rs.getRow();
        if (row == 0) {
            return new ArrayList<>();
        } else {
            rs.beforeFirst();

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setStatus(rs.getInt(2));
                String date[] = rs.getString(3).split("-");
                order.setDate(new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0])));
                order.setTotal(rs.getInt(4));
                order.setCode(rs.getInt(5));
                order.setPayment(rs.getInt(6));
                order.setAddress(rs.getString(7));
                order.setName(rs.getString(8));
                order.setPhone(rs.getString(9));
                order.setIdUser(rs.getInt(10));


                String orderItem = "select product.name, orderdetail.size, product.price,orderdetail.quantity,(product.price * orderdetail.quantity) " +
                        "as total, product.id from `order` join `orderdetail` on order.id = orderdetail.idorder JOIN product ON orderdetail.idproduct = product.id where order.id = ?";
                PreparedStatement ps1 = DBConnection.getPreparedStatement(orderItem);
                ps1.setInt(1, order.getId());
                ResultSet rs1 = ps1.executeQuery();
                ArrayList<OrderItem> listOrderItem = new ArrayList<>();
                while (rs1.next()) {
                    OrderItem ot = new OrderItem();
                    ot.setName(rs1.getString(1));
                    ot.setSize(rs1.getInt(2));
                    ot.setPrice(rs1.getDouble(3));
                    ot.setQuantity(rs1.getInt(4));
                    ot.setTotal(rs1.getDouble(5));
                    ot.setId(rs1.getInt(6));

                    String getImg = "SELECT image.img FROM image WHERE idproduct =?";
                    PreparedStatement ps2 = DBConnection.getPreparedStatement(getImg);
                    ps2.setInt(1, ot.getId());
                    ResultSet rs2 = ps2.executeQuery();
                    rs2.first();
                    ot.setUrlImg(rs2.getString(1));
                    listOrderItem.add(ot);
                }
                order.setListOrderItem(listOrderItem);
                list.add(order);
            }
        }
        return list;
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException, ParseException {

        System.out.println(getListOrderByIdUser(3));


    }
}
