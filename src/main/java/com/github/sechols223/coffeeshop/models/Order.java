package com.github.sechols223.coffeeshop.models;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.Instant;

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

    @Column(name = "order_date")
    private Timestamp orderDate;

    public Order() {
    }

    public Order(Customer customer, Product product, int amount) {
        this.amount = amount;
        this.customer = customer;
        this.product = product;

        this.customerid = customer.getId();
        this.productid = product.getId();
        this.orderDate = Timestamp.from(Instant.now());
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
