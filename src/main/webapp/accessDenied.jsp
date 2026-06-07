<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#f4f4f4;
}

.container{
    width:90%;
    max-width:500px;
    background:white;
    padding:30px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

h1{
    color:red;
    margin-bottom:15px;
}

h3{
    margin-bottom:20px;
}

a{
    text-decoration:none;
    background:#007bff;
    color:white;
    padding:10px 20px;
    border-radius:5px;
}
</style>
</head>

<body>

<div class="container">
    <h1>ACCESS DENIED</h1>
    <h3>You are not authorized to access this page.</h3>
    <a href="login.jsp">Login Again</a>
</div>

</body>
</html>