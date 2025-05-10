package io.ds.pierwszy;

public class Product {
    private final String category;
    private final String name;
    private final double price;
    private final String description;
    private final String image;
    public Product(String category, String name, double price, String description,String image){
        this.category=category;
        this.name=name;
        this.price=price;
        this.description=description;
        this.image=image;
    }
    public String getCategory(){
        return category;
    }
    public String getName(){
        return name;
    }
    public double getPrice(){
        return price;
    }
    public String getDescription(){return description;}
    public String getImage() {return image;}
}