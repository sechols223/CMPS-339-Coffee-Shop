package com.github.sechols223.coffeeshop.Controllers;

import com.github.sechols223.coffeeshop.models.Product;
import com.github.sechols223.coffeeshop.repositories.ProductRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class ProductController {

    private final ProductRepository productRepository;

    public ProductController(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @GetMapping("/products")
    public ResponseEntity<List<Product>> getProducts() {
        try {

            List<Product> products = new ArrayList<>(productRepository.findAll());
            return new ResponseEntity<>(products, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @GetMapping("/products/{id}")
    public ResponseEntity<List<Product>> getProductById(@PathVariable("id") int id) {
        Optional<Product> productData = productRepository.findById(id);
        List<Product> products = new ArrayList<>();
        if (productData.isPresent()) {
            products.add(productData.get());
            try {
                return new ResponseEntity<>(products, HttpStatus.OK);
            } catch (Exception e) {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } else {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/products")
    public ResponseEntity<Product> createProduct(@RequestBody Product product) {
        try {
            Product _product = productRepository
                    .save(new Product(
                            product.getName(),
                            product.getSize()
                    ));
            return new ResponseEntity<>(_product, HttpStatus.CREATED);
        } catch (Exception e ) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PutMapping("/products/{id}")
    public ResponseEntity<Product> updateProduct(@PathVariable("id") int id, @RequestBody Product product) {
        Optional<Product> productData = productRepository.findById(id);
        if (productData.isPresent()) {
            Product _product = productData.get();
            _product.setName(product.getName());
            _product.setSize(product.getSize());
            return new ResponseEntity<>(productRepository.save(_product), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/products/{id}")
    public ResponseEntity<Product> deleteProduct(@PathVariable("id") int id) {
        try {
            productRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
