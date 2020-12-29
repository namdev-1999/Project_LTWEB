package vn.nlu.banana.model;

public class OrderDetail {
    private int id;
    private int idProduct;
    private int idOrder;
    private int size;
    private int quantity;

    public OrderDetail(int id, int idProduct, int idOrder,int size, int quantity) {
        this.id = id;
        this.idProduct = idProduct;
        this.idOrder = idOrder;
        this.size= size;
        this.quantity=quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
