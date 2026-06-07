<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

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
    margin-top:10px;
    margin-bottom:20px;
}

button{
    width:100%;
    padding:10px;
    border:none;
    background:#007bff;
    color:white;
    cursor:pointer;
}

.msg{
    color:red;
    text-align:center;
    margin-bottom:15px;
}
</style>
</head>

<body>

<div class="container">

    <h2>Forgot Password</h2>

    <%
    String msg=(String)request.getAttribute("msg");
    if(msg!=null){
    %>
        <div class="msg"><%=msg%></div>
    <%
    }
    %>

    <form action="sendOtp" method="post">

        <input type="email"
               name="email"
               placeholder="Enter Email"
               required>

        <button type="submit">Send OTP</button>

    </form>

</div>

</body>
</html>