Aplikacja To-Do

Webowa aplikacja do zarządzania listą zadań, napisana w Javie z wykorzystaniem Jakarta Servlet, JSP oraz Apache Tomcat 10.

Funkcjonalności:

Dodawanie nowych zadań
Oznaczanie zadań jako wykonane / cofanie oznaczenia
Usuwanie zadań
Komunikat gdy lista jest pusta


Technologie:

Java 17 <br>
Jakarta Servlet API 6.0
JSP + JSTL 3.0
Apache Tomcat 10
Maven


Wymagania:

Java 17+
Maven
Apache Tomcat 10


Budowanie

mvn package

Wdrożenie na Tomcat (Linux)

sudo cp target/todo-app.war /var/lib/tomcat10/webapps/
sudo systemctl restart tomcat10

Adres aplikacji

http://localhost:8080/todo-app/tasks

Opis klas

Task.java - klasa modelowa reprezentująca pojedyncze zadanie (id, title, done).

TaskManager.java - przechowuje listę zadań w pamięci (ArrayList). Udostępnia metody: addTask(), deleteTask(), toggleTask(), getAllTasks().

TaskServlet.java - kontroler HTTP pod adresem /tasks. Obsługuje GET (wyświetlenie listy) oraz POST z akcjami: add, delete, toggle.
