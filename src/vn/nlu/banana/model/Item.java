package vn.nlu.banana.model;

import java.text.NumberFormat;
import java.util.Locale;

public class Item {
    private Shoe shoe;
    private int quantity;
    private int size = 37;

    public Item() {

    }

    public Item(Shoe shoe, int quantity, int size) {
        this.shoe = shoe;
        this.quantity = quantity;
        this.size = size;
    }

    public Shoe getShoe() {
        return shoe;
    }

    public void setShoe(Shoe shoe) {
        this.shoe = shoe;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity <= 0) {
            this.quantity = 1;
        } else
            this.quantity = quantity;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public double total() {
        return shoe.getPrice() * quantity;
    }

    @Override
    public String toString() {
        return total() + "";
    }

    public static String insert(double price) {
        NumberFormat currentLocale = NumberFormat.getInstance();
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        long longNumber = (long) price;
        String str1 = en.format(longNumber);
        return str1;
    }
}
