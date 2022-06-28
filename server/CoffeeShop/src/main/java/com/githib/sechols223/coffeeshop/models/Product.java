package com.githib.sechols223.coffeeshop.models;


import javax.persistence.*;

@Entity
@Table(name="product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name="name")
    private String name;
    @Column(name="size")
    private String size;


    public Product() {}

    public Product(String name, String size) {
        this.name = name;
        this.size = size;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
}
