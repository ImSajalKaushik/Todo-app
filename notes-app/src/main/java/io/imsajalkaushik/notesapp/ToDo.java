package io.imsajalkaushik.notesapp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ToDo {
	@Id
	private String id;

	private String todoTitle;
	private boolean isDone;

	@ManyToOne
	private UserData user;

	public ToDo() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ToDo(String id, String todoTitle, boolean isDone, String userId) {
		this.id = id;
		this.todoTitle = todoTitle;
		this.setDone(isDone);
		this.user = new UserData(userId, "");
	}

	public UserData getUser() {
		return user;
	}

	public void setUser(UserData user) {
		this.user = user;
	}

	public boolean isDone() {
		return isDone;
	}

	public void setDone(boolean isDone) {
		this.isDone = isDone;
	}

	public String getTodoTitle() {
		return todoTitle;
	}

	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}
}
