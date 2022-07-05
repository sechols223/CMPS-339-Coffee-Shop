package com.githib.sechols223.coffeeshop.web;

import com.moesif.servlet.MoesifFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.Filter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Bean
    public Filter moesifFilter() {
        return new MoesifFilter("eyJhcHAiOiI3MTA6NzA0IiwidmVyIjoiMi4wIiwib3JnIjoiMTYzOjI4NiIsImlhdCI6MTY1NjYzMzYwMH0.xnqmVzo93qDmBggjaspfM4BAXu1Hb4x45s-ged6OoZg");
    }
}
