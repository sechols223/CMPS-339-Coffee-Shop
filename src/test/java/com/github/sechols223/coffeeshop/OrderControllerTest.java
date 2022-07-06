package com.github.sechols223.coffeeshop;

import com.github.sechols223.coffeeshop.Controllers.OrderController;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;

@AutoConfigureMockMvc
@WebMvcTest(controllers = OrderController.class)
public class OrderControllerTest {
}
