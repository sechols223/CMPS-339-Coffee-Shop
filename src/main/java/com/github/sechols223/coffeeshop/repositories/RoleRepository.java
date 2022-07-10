package com.github.sechols223.coffeeshop.repositories;

import com.github.sechols223.coffeeshop.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
}
