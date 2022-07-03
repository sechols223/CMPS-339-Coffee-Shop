package com.githib.sechols223.coffeeshop.repositories;

import com.githib.sechols223.coffeeshop.models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    List<Customer> findByAddress(String address);
}
