package com.githib.sechols223.coffeeshop.repositories;

import com.githib.sechols223.coffeeshop.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findAllByName(String name);
    List<Product> findAllBySize(String size);
}
