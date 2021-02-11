package io.imsajalkaushik.notesapp;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface ToDoRepository extends CrudRepository<ToDo, String> {

    public List<ToDo> findByUserId(String userID);

    public void deleteByUserId(String userID);
}

