package vn.nlu.banana.model;

public class OrderItem {
    private String name;
    private int size;
    private int id;
    private double price;
    private int quantity;
    private double total;
    private String urlImg;

    public OrderItem(String name, int size, double price, int quantity, double total,String urlImg) {
        this.name = name;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
        this.urlImg = urlImg;
    }

    public OrderItem() {
        super();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    @Override
    public String toString() {
        return name + "";
    }
}
