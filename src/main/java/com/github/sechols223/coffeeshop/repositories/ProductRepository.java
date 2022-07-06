package com.github.sechols223.coffeeshop.repositories;

import com.github.sechols223.coffeeshop.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findAllByName(String name);
    List<Product> findAllBySize(String size);
}
