package com.github.sechols223.coffeeshop.Controllers;

import com.github.sechols223.coffeeshop.models.Customer;
import com.github.sechols223.coffeeshop.models.Order;
import com.github.sechols223.coffeeshop.models.Product;
import com.github.sechols223.coffeeshop.repositories.CustomerRepository;
import com.github.sechols223.coffeeshop.repositories.OrderRepository;
import com.github.sechols223.coffeeshop.repositories.ProductRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
//TODO
// Create PUT/Update mapping


@RestController
@RequestMapping("/api")
public class OrderController {


    private final CustomerRepository customerRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;

    public OrderController(CustomerRepository customerRepository,
                           OrderRepository orderRepository,
                           ProductRepository productRepository) {

        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
    }

    @GetMapping("/orders")
    public ResponseEntity<List<Order>> getAllOrders() {
        try {

            List<Order> orders = new ArrayList<>(orderRepository.findAll());
            return new ResponseEntity<>(orders, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }


    @GetMapping("/orders/{customerid}")
    public ResponseEntity<List<Order>> getCustomerOrders(@PathVariable("customerid") int customerid ) {
        Optional<Customer> customerData = customerRepository.findById(customerid);

        if (customerData.isPresent()) {

            List<Order> orders = new ArrayList<>(orderRepository.findByCustomerId(customerid));
            return new ResponseEntity<>(orders, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/orders/{customerid}/{productid}")
    public ResponseEntity<Order> createOrder(
            @PathVariable("customerid") int customerid,
            @PathVariable("productid") int productid,
            @RequestBody Order order) {

        Optional<Customer> customerData = customerRepository.findById(customerid);
        Optional<Product> productData = productRepository.findById(productid);

        if (customerData.isPresent()) {
            Customer customer = customerData.get();
            if (productData.isPresent()) {
                Product product = productData.get();
                Order _order = orderRepository.save(
                        new Order(customer, product, order.getAmount())
                );
                return new ResponseEntity<>(_order, HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/orders/{customerid}/{orderid}")
    public ResponseEntity<Order> deleteOrder(
                    @PathVariable("customerid") int customerid,
                    @PathVariable("orderid") int orderid) {

        Optional<Customer> customerData = customerRepository.findById(customerid);

        if (customerData.isPresent()) {
            List<Order> orders = new ArrayList<>(orderRepository.findByCustomerId(customerid));

            for (Order order : orders) {
                if (order.getId() == orderid) {
                    orderRepository.deleteById(order.getId());
                    return new ResponseEntity<>(HttpStatus.NO_CONTENT);
                } else {
                    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
                }
            }
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
