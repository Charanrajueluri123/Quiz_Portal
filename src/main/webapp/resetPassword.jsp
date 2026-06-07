<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

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
    max-width:400px;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

h2{
    text-align:center;
    margin-bottom:20px;
}

input{
    width:100%;
    padding:10px;
    margin-bottom:15px;
}

button{
    width:100%;
    padding:10px;
    border:none;
    background:#007bff;
    color:white;
    cursor:pointer;
}
</style>
</head>

<body>

<div class="container">

    <h2>Reset Password</h2>

    <form action="resetPassword" method="post">

        <input type="password"
               name="password"
               placeholder="New Password"
               required>

        <input type="password"
               name="confirmPassword"
               placeholder="Confirm Password"
               required>

        <button type="submit">Update Password</button>

    </form>

</div>

</body>
</html>