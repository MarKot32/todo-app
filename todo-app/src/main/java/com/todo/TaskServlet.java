package com.todo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {

    private TaskManager taskManager = new TaskManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("tasks", taskManager.getAllTasks());
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String title = req.getParameter("title");
            if (title != null && !title.trim().isEmpty()) {
                taskManager.addTask(title.trim());
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            taskManager.deleteTask(id);
        } else if ("toggle".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            taskManager.toggleTask(id);
        }

        resp.sendRedirect(req.getContextPath() + "/tasks");
    }
}