package com.githib.sechols223.coffeeshop.models;


import javax.persistence.*;

@SuppressWarnings("unused")
@Entity
@Table(name="order")
public class Order {

    @Id
    @GeneratedValue
    private int id;
    @Column(name="customerid")
    private int customerId;
    @Column(name="productid")
    private int productId;

    public Order() {
    }

    public Order(int customerId, int productId) {
        this.customerId = customerId;
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
