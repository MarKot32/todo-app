package com.todo;

import java.util.ArrayList;
import java.util.List;

public class TaskManager {
    private List<Task> tasks = new ArrayList<>();
    private int nextId = 1;

    public void addTask(String title) {
        tasks.add(new Task(nextId++, title));
    }

    public void deleteTask(int id) {
        tasks.removeIf(task -> task.getId() == id);
    }

    public void toggleTask(int id) {
        for (Task task : tasks) {
            if (task.getId() == id) {
                task.setDone(!task.isDone());
                break;
            }
        }
    }

    public List<Task> getAllTasks() {
        return tasks;
    }
}