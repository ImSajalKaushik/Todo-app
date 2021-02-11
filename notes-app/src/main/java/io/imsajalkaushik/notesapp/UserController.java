package io.imsajalkaushik.notesapp;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    private List<UserData> users = Arrays.asList(
        new UserData("id", "Sajal"),
        new UserData("id1", "BA") 
    );

    @Autowired
    private TodoService service ;
    
    @PostMapping("/user")
    private void addUser(@RequestBody UserData user) {
        this.service.addUser(user);
    }

    @RequestMapping("/user")
    public List<UserData> getUsers() {
        return service.getUsers();
    }

    // @RequestMapping("/error")
    // public String getErrorPage() {
    //     return "<H1> Ho gyi galti!</H1>";
    // }
}
