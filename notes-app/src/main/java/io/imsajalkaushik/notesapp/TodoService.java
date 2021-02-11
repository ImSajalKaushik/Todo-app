package io.imsajalkaushik.notesapp;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TodoService {
    
    // List<TodoData> toDos = Arrays.asList(
    //     new TodoData("Second notes", false), 
    //     new TodoData("thrid note", false)
    //     );

    // private List<UserToDos> userNotes = new ArrayList<>(Arrays.asList(
    //     new UserToDos("user", toDos),
    //     new UserToDos("Kiii", toDos)
    //     )
    // );

    // private User user = new User("id", "Sajal");
    // private List<ToDo> td = Arrays.asList(
    //     new ToDo("todoTitle", true, user),
    //     new ToDo("todoTitle2", false, user)
    // );
    @Autowired
    private ToDoRepository repository;

    @Autowired
    private UserRepository userRepository;

    public List<ToDo> getAllTodos() {
        // return this.userNotes; 
        List<ToDo> todos = new ArrayList<>();
        repository.findAll()
        .forEach(todos::add); 
        return todos;
    }

    public void addTodoToExistingUser(String id, ToDo todo) {
        // UserToDos userData = userNotes.stream().filter(t-> t.getUser().equals(id)).findFirst().get();
        //userNotes.stream().filter(t-> t.getUser().equals(id)).findFirst().get();
        ToDo userData = repository.findById(id).get();
        // userData.addData(todo);
        repository.deleteById(id);
        repository.save(userData);
	}

	public void updateTodosOfUser(ToDo userData) {
        // UserToDos userData  =  userNotes.stream().filter(t-> t.getUser().equals(id)).findFirst().get();
        // userNotes.remove(userData);
        // userData.setData(note.getData());
        // userNotes.add(userData);
        repository.deleteById(userData.getId());
        repository.save(userData);
	}

	public List<ToDo> getToDosOfUser(String id) {
        // UserToDos userData = userNotes.stream().filter(t-> t.getUser().equals(id)).findFirst().get();
        return repository.findByUserId(id);
	}

	public void addTodoWihUser(ToDo data) {
        repository.save(data);
	}

	public void addUser(UserData user) {
	userRepository.save(user);
        }
    
    public List<UserData> getUsers() {
        List<UserData> users = new ArrayList<>();
        userRepository.findAll()
        .forEach(users::add); 
        return users;
        }
}

/**
 * break points how to use?
 * multiple auto wiring in a file
 * keys in json?
 */