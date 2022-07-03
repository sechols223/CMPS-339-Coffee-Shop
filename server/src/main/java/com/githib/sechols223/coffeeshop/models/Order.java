package com.githib.sechols223.coffeeshop.models;

import javax.persistence.*;

@SuppressWarnings("unused")
@Entity
@Table(name = "\"order\"")
public class Order {

    @Id
    @GeneratedValue
    private int id;


    @ManyToOne
    @JoinColumn(name = "productid")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private Customer customer;

    @Column(name = "amount")
    private int amount;

    @Column(name = "customerid", insertable = false, updatable = false)
    private int customerid;

    @Column(name = "productid", insertable = false, updatable = false)
    private int productid;

    public Order() {
    }

    public Order(Customer customer, Product product, int amount) {
        this.amount = amount;
        this.customer = customer;
        this.product = product;

        this.customerid = customer.getId();
        this.productid = product.getId();
    }

    public int getCustomerid() {
        return customerid;
    }

    public int getProductid() {
        return productid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

}
