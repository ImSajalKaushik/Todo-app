package io.imsajalkaushik.notesapp;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
public class TodosController {
    
    @Autowired
    private TodoService service ;

    @RequestMapping("/getTodos")
    private List<ToDo> getAllTodos() {
        return this.service.getAllTodos();
    }

    @RequestMapping("/user/{id}/getTodos")
    private List<ToDo> getToDosOfUser(@PathVariable String id) {
        return this.service.getToDosOfUser(id);
    }

    @PostMapping(value="/user/{id}/getTodos")
    public void addTodoWihUser(@PathVariable String id, @RequestBody ToDo data) {
        data.setUser(new UserData(id, ""));
        data.setId(data.getId());
        service.addTodoWihUser(data);
    }

    @PutMapping(value="/user/{userId}/setTodos")
    public void updateTodosOfUser(@PathVariable String userId, @RequestBody ToDo todo) {
        //todo.setUser(new UserData(userId, ""));
        service.updateTodosOfUser(todo);
    }
}
