package vn.nlu.banana.model;

public class Size {
    private int size;
    private int idOrder;

    public Size(int size, int idOrder) {
        this.size = size;
        this.idOrder = idOrder;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

}
