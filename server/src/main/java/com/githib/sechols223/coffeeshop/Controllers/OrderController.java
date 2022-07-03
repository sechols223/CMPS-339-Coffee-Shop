package com.githib.sechols223.coffeeshop.Controllers;

import com.githib.sechols223.coffeeshop.models.Customer;
import com.githib.sechols223.coffeeshop.models.Order;
import com.githib.sechols223.coffeeshop.models.Product;
import com.githib.sechols223.coffeeshop.repositories.CustomerRepository;
import com.githib.sechols223.coffeeshop.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class OrderController {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("/orders")
    public ResponseEntity<List<Order>> getAllOrders() {
        try {
            List<Order> orders = new ArrayList<>();

            orderRepository.findAll().forEach(orders::add);
            return new ResponseEntity<>(orders, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }


    @GetMapping("/orders/{customerid}")
    public ResponseEntity<List<Order>> getCustomerOrders(@PathVariable("customerid") int customerid ) {
        Optional<Customer> customerData = customerRepository.findById(customerid);
        List<Order> orders = new ArrayList<>();

        if (customerData.isPresent()) {

            orderRepository.findByCustomerId(customerid).forEach(orders::add);
            return new ResponseEntity<>(orders, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
