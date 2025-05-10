package io.ds.pierwszy;

public class Cart {
    private final Product product;
    private int quantity;

public Cart(Product product, int quantity){
    this.product=product;
    this.quantity=quantity;
}
public Product getProduct(){
return product;}
    public int getQuantity(){
    return quantity;
    }
    public void setQuantity(int quantity){
    this.quantity=quantity;
    }
    public double getTotalPrice(){
    return product.getPrice()*quantity;
    }
}
