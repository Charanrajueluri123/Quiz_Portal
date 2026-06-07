<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify OTP</title>

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
    margin-bottom:20px;
}

button{
    width:100%;
    padding:10px;
    border:none;
    background:#28a745;
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

    <h2>Verify OTP</h2>

    <%
    String msg=(String)request.getAttribute("msg");
    if(msg!=null){
    %>
        <div class="msg"><%=msg%></div>
    <%
    }
    %>

    <form action="verifyOtp" method="post">

        <input type="text"
               name="otp"
               placeholder="Enter OTP"
               required>

        <button type="submit">Verify OTP</button>

    </form>

</div>

</body>
</html>