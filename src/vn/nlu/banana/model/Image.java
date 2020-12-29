package vn.nlu.banana.model;

public class Image {
    private int id;
    private int idProduct;
    private String img;

    public Image() {

    }

    public Image(int id, int idProduct, String img) {
        this.id = id;
        this.idProduct = idProduct;
        this.img = img;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
