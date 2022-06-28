package com.githib.sechols223.coffeeshop.models;

import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;

@Entity
@Table(name = "Customer")
public class Customer {

    @Id
    @GeneratedValue
    @Column(name="id")
    private int id;
    @Column(name="firstname")
    private String firstname;
    @Column(name="lastname")
    private String lastname;
    @Column(name="address")
    private String address;


    public Customer(){

    }

    public Customer(String firstname, String lastname, String address) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
    }
    public int getId() {
        return  this.id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
