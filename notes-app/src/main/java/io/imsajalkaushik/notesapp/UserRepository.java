package io.imsajalkaushik.notesapp;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<UserData, String> {
    
}
