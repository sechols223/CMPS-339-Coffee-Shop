package com.github.sechols223.coffeeshop;

import com.github.sechols223.coffeeshop.Controllers.CustomerController;
import com.github.sechols223.coffeeshop.models.Customer;
import com.github.sechols223.coffeeshop.repositories.CustomerRepository;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@AutoConfigureMockMvc

@WebMvcTest(controllers = CustomerController.class)
public class CustomerControllerTest {

    Customer customer1 = new Customer("Samuel", "Echols", "123 Brown Drive");
    Customer customer2 = new Customer("Daid", "Echols", "123 Orange Drive");
    @Autowired
    private WebApplicationContext webApplicationContext;
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private CustomerRepository customerRepository;

    @Before
    public void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void getAllCustomersTest() throws Exception {
        List<Customer> customers = new ArrayList<>(Arrays.asList(customer1, customer2));

        Mockito.when(customerRepository.findAll()).thenReturn(customers);

        mockMvc.perform(MockMvcRequestBuilders
                        .get("/api/customers")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].firstname", is("Samuel")));

    }
}
