package vn.nlu.banana.model;

import sun.swing.BakedArrayList;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class Shoe {
    public int id;
    public String name;
    public double price;
    public int size;
    public int idType;
    public List<String> image = new ArrayList<>();
    public int active;
    public String des;
    public List<Comment> commentArrayList = new ArrayList();

    public Shoe() {

    }

    public Shoe(int id, String name, double price, int size, int idType, List<String> image, int active, String des, List<Comment> cmt) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.size = size;
        this.idType = idType;
        this.image = image;
        this.active = active;
        this.des = des;
        this.commentArrayList = cmt;
    }

    public void addComment(Comment cmt) {
        this.commentArrayList.add(cmt);
    }

    public List<Comment> getCommentArrayList() {
        return commentArrayList;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getIdType() {
        return idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
    }

    public List<String> getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image.add(image);
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return name + " - " + price;
    }

    public static String insert(double price) {
        NumberFormat currentLocale = NumberFormat.getInstance();
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        long longNumber = (long) price;
        String str1 = en.format(longNumber);
        return str1;
    }

    public static void main(String[] args) {
        NumberFormat currentLocale = NumberFormat.getInstance();
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        long longNumber = 345678L;
        String str1 = en.format(longNumber);
        System.out.println("Số " + longNumber + " sau khi định dạng = " + str1);
    }

}
