package com.githib.sechols223.coffeeshop.repositories;

import com.githib.sechols223.coffeeshop.models.Customer;
import com.githib.sechols223.coffeeshop.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    @Query(value="SELECT * FROM \"order\" WHERE customerid = ?1", nativeQuery = true)
    List<Order> findByCustomerId(int customerid);
}
