# 🚀 Quiz Portal - Online Quiz Management System

## 📌 Project Overview

Quiz Portal is a full-stack Java web application that enables administrators to manage quizzes and users to participate in quizzes through an interactive web interface.

The application is developed using **JSP, Servlets, JDBC, PostgreSQL, HTML, CSS, JavaScript, Bootstrap, and Apache Tomcat**. It follows the MVC (Model-View-Controller) architecture and has been successfully deployed on **Render** using **Docker** and a cloud-hosted **PostgreSQL** database.

---

# ✨ Features

## 👨‍💼 Admin Module

* Secure Admin Login
* Dashboard with Statistics
* Add New Questions
* Edit Questions
* Delete Questions
* View All Questions
* Manage Categories
* Manage Difficulty Levels
* View Total Users
* View Total Quiz Attempts
* View Average Score

---

## 👨‍🎓 User Module

* User Registration
* User Login
* Select Quiz Category
* Select Difficulty Level
* Start Quiz
* Random Question Generation
* Submit Quiz
* View Score
* View Quiz Result

---

# 🏗️ Project Architecture

```
User
   │
   ▼
JSP Pages
   │
   ▼
Servlet Controllers
   │
   ▼
DAO Layer
   │
   ▼
JDBC
   │
   ▼
PostgreSQL Database
```

The project follows the **MVC Design Pattern**.

---

# 🛠️ Tech Stack

### Backend

* Java
* JSP
* Servlets
* JDBC

### Frontend

* HTML5
* CSS3
* Bootstrap
* JavaScript

### Database

* PostgreSQL

### Server

* Apache Tomcat 9

### Deployment

* Docker
* Render

### Version Control

* Git
* GitHub

---

# 📂 Project Structure

```
Quiz_Portal
│
├── src
│   ├── controller
│   ├── dao
│   ├── model
│   └── util
│
├── WebContent
│   ├── admin
│   ├── user
│   ├── css
│   ├── js
│   └── images
│
├── build
├── Dockerfile
├── QuizPortal.war
└── README.md
```

---

# 🗄️ Database Tables

The application uses the following PostgreSQL tables:

* users
* questions1
* categories
* difficulties
* results

---

# ⚙️ Installation

## 1. Clone Repository

```bash
git clone https://github.com/Charanrajueluri123/Quiz_Portal.git
```

---

## 2. Open in Eclipse

```
File
→ Import
→ Existing Projects into Workspace
```

---

## 3. Configure PostgreSQL

Update your database credentials inside:

```
DBConnection.java
```

Example

```java
String url = "jdbc:postgresql://HOST:5432/DATABASE?sslmode=require";
String username = "USERNAME";
String password = "PASSWORD";
```

---

## 4. Add PostgreSQL JDBC Driver

Copy

```
postgresql-42.x.x.jar
```

into

```
WEB-INF/lib
```

---

## 5. Create Database Tables

Create:

* users
* categories
* difficulties
* questions1
* results

Insert initial records for:

* Categories
* Difficulty Levels

---

## 6. Export WAR

```
Right Click Project

→ Export

→ WAR File
```

---

## 7. Deploy Using Docker

Dockerfile

```dockerfile
FROM tomcat:9.0

COPY QuizPortal.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
```

---

## 8. Push to GitHub

```bash
git add .

git commit -m "Initial Deployment"

git push
```

---

## 9. Deploy on Render

* Create PostgreSQL Database
* Create Web Service
* Connect GitHub Repository
* Runtime → Docker
* Deploy

---

# 📊 Database Relationships

```
categories
      │
      │
      ▼
questions1
      ▲
      │
difficulties

users
   │
   ▼
results
```

---

# 🔍 Important PostgreSQL Changes

While migrating from MySQL to PostgreSQL, the following changes were required:

| MySQL          | PostgreSQL        |
| -------------- | ----------------- |
| AUTO_INCREMENT | SERIAL            |
| RAND()         | RANDOM()          |
| NOW()          | CURRENT_TIMESTAMP |

---

# 🐞 Challenges Faced

During deployment, several issues were encountered and resolved:

* Migrated from MySQL to PostgreSQL
* JDBC connection configuration
* Docker deployment setup
* WAR deployment on Tomcat
* PostgreSQL foreign key constraints
* Case-sensitive lookups in PostgreSQL
* Random question selection (`RAND()` → `RANDOM()`)
* Manual database table creation on Render
* Render deployment troubleshooting

---

# 📸 Screenshots

Add screenshots here.


Home Page
<img width="1913" height="872" alt="image" src="https://github.com/user-attachments/assets/361d438a-76c4-4213-b46b-f3ce985f07d3" />
<img width="1917" height="880" alt="image" src="https://github.com/user-attachments/assets/f976576e-75cb-4a21-99f6-05872fc6c653" />


Admin Dashboard
<img width="1917" height="877" alt="image" src="https://github.com/user-attachments/assets/a2e6e004-1bfa-486f-a78f-baff3819ba67" />
<img width="1915" height="868" alt="image" src="https://github.com/user-attachments/assets/ac6e03e1-00c4-4983-bf1b-f9492cd3c92f" />


Manage Questions
<img width="1908" height="873" alt="image" src="https://github.com/user-attachments/assets/bfcedd73-ace8-478a-9018-6ea7f1366b73" />
<img width="1918" height="872" alt="image" src="https://github.com/user-attachments/assets/eab65fd2-6a1c-4161-9d76-6b854b8d64e5" />
<img width="1912" height="875" alt="image" src="https://github.com/user-attachments/assets/1f7bdb7d-6380-4a5f-8b8d-e0980598a5ec" />
<img width="1912" height="872" alt="image" src="https://github.com/user-attachments/assets/1261d308-fcc7-477a-8ad2-35dc1b087ca2" />

Add Question
<img width="1917" height="882" alt="image" src="https://github.com/user-attachments/assets/9bedcf3b-4183-4f5d-9b9c-e8dd234da961" />
<img width="1918" height="892" alt="image" src="https://github.com/user-attachments/assets/a0a48b15-2fdb-47af-8588-66b0fa2ac705" />


User Login
<img width="1918" height="877" alt="image" src="https://github.com/user-attachments/assets/7078466c-4196-42a0-9b68-26c088fc7b90" />
<img width="1917" height="875" alt="image" src="https://github.com/user-attachments/assets/10a204b5-eb31-4ba2-918e-e4fac8b603fa" />
<img width="1915" height="870" alt="image" src="https://github.com/user-attachments/assets/c761073c-043b-40ff-8ad2-21eb1cf01725" />
<img width="1907" height="872" alt="image" src="https://github.com/user-attachments/assets/544e286c-09f7-470e-8a91-e37d7f8bcc97" />
<img width="1915" height="872" alt="image" src="https://github.com/user-attachments/assets/55521b89-121b-4afa-bd92-7fd22008de4b" />
<img width="1908" height="857" alt="image" src="https://github.com/user-attachments/assets/bc3c303f-015c-4c23-8c2a-e33ab38fddff" />


---

# 🚀 Future Enhancements

* Password Encryption (BCrypt)
* Forgot Password
* JWT Authentication
* Leaderboard
* Certificate Generation
* Question Images
* REST API
* Spring Boot Migration

---

# 👨‍💻 Author

**Eluri Charan Raju**

Java Full Stack Developer

---

# ⭐ If you found this project useful

Please consider giving it a ⭐ on GitHub.

It helps others discover the project and motivates future improvements.

---

## 📜 License

This project is intended for learning, educational, and portfolio purposes.
