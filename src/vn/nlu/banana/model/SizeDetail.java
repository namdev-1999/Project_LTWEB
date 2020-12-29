package vn.nlu.banana.model;

public class SizeDetail {
    private int id;
    private int idproduct;
    private int size;
    private int remain;

    public SizeDetail(int id, int idproduct, int size, int remain) {
        this.id = id;
        this.idproduct = idproduct;
        this.size = size;
        this.remain = remain;
    }
    public SizeDetail(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdproduct() {
        return idproduct;
    }

    public void setIdproduct(int idproduct) {
        this.idproduct = idproduct;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }
}
