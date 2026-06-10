<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Lista zadań</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            padding: 40px 16px;
        }

        .container {
            background: white;
            border-radius: 12px;
            padding: 32px;
            width: 100%;
            max-width: 540px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
        }

        h1 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 24px;
            color: #1a1a1a;
        }

        .add-form {
            display: flex;
            gap: 8px;
            margin-bottom: 28px;
        }

        .add-form input[type="text"] {
            flex: 1;
            padding: 10px 14px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
        }

        .add-form input[type="text"]:focus {
            border-color: #4f8ef7;
        }

        .btn-add {
            padding: 10px 18px;
            background: #4f8ef7;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
        }

        .btn-add:hover { background: #3a7de0; }

        .task-list { list-style: none; }

        .task-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .task-item:last-child { border-bottom: none; }

        .task-title {
            font-size: 15px;
            color: #333;
            flex: 1;
        }

        .task-title.done {
            text-decoration: line-through;
            color: #aaa;
        }

        .actions {
            display: flex;
            gap: 8px;
        }

        .btn-toggle {
            padding: 6px 12px;
            background: #52c41a;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
        }

        .btn-toggle:hover { background: #389e0d; }

        .btn-toggle.undo {
            background: #faad14;
        }

        .btn-toggle.undo:hover { background: #d48806; }

        .btn-delete {
            padding: 6px 12px;
            background: #ff4d4f;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
        }

        .btn-delete:hover { background: #d9363e; }

        .empty {
            color: #aaa;
            font-size: 14px;
            text-align: center;
            padding: 24px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Lista zadań</h1>

    <form class="add-form" action="${pageContext.request.contextPath}/tasks" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="title" placeholder="Nowe zadanie..." required>
        <button type="submit" class="btn-add">Dodaj</button>
    </form>

    <ul class="task-list">
        <c:choose>
            <c:when test="${empty tasks}">
                <p class="empty">Brak zadań. Dodaj pierwsze!</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="task" items="${tasks}">
                    <li class="task-item">
                        <span class="task-title ${task.done ? 'done' : ''}">
                            ${task.title}
                        </span>
                        <div class="actions">
                            <form action="${pageContext.request.contextPath}/tasks" method="post">
                                <input type="hidden" name="action" value="toggle">
                                <input type="hidden" name="id" value="${task.id}">
                                <button type="submit" class="btn-toggle ${task.done ? 'undo' : ''}">
                                    ${task.done ? 'Cofnij' : 'Wykonane'}
                                </button>
                            </form>
                            <form action="${pageContext.request.contextPath}/tasks" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${task.id}">
                                <button type="submit" class="btn-delete">Usuń</button>
                            </form>
                        </div>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>
</html>