package vn.nlu.banana.model;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    ArrayList<Item> listItem = new ArrayList<>();

    public Cart() {
    }

    public Cart(ArrayList<Item> data) {
        this.listItem = data;
    }

    public ArrayList<Item> getData() {
        return listItem;
    }

    public void addOne(int id, int size) {
        for (Item item : getData()) {
            if (item.getShoe().getId() == id & item.getSize() == size) {
                item.setQuantity(item.getQuantity() + 1);
            }
        }
    }

    public void subOne(int id, int size) {
        for (Item item : getData()) {
            if (item.getShoe().getId() == id & item.getSize() == size) {
                item.setQuantity(item.getQuantity() - 1);
            }
        }
    }

    public void addToCart(Shoe shoe, int numOfProduct, int size) {
        boolean add = false;
        if (numOfProduct <1) {
            numOfProduct = 1;
        }
        for (Item item : listItem) {
            if (item.getShoe().getId() == shoe.getId() && size == item.getSize()) {
                item.setQuantity(item.getQuantity() + numOfProduct);
                add = true;
            }

        }
        if (!add) {
            listItem.add(new Item(shoe, numOfProduct, size));
        }
    }

    public void subToCart(Shoe shoe) {
        for (Item item : listItem) {
            if (item.getShoe().getId() == shoe.getId()) {
                if ((item.getQuantity() - 1) == 0) {
                    listItem.remove(shoe);
                } else
                    item.setQuantity(item.getQuantity() - 1);
            }
        }
    }

    public void removeToCart(Shoe shoe, int size) {
        for (Item item : listItem
        ) {

            if (item.getShoe().getId() == shoe.getId()&& size == item.getSize()) {
                listItem.remove(item);
                break;
            }


        }

    }

    public int countItem() {
        return listItem.size();
    }

    public double total() {
        double total = 0;
        for (Item item : listItem
        ) {
            total += item.getShoe().getPrice() * item.getQuantity();
        }
        return total;
    }
}
