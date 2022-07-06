package com.github.sechols223.coffeeshop.repositories;

import com.github.sechols223.coffeeshop.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
}
