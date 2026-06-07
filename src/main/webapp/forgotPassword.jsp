<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>

<h2>Forgot Password</h2>

<%
String msg=(String)request.getAttribute("msg");
if(msg!=null){
%>
<h4 style="color:red"><%=msg%></h4>
<%
}
%>

<form action="sendOtp" method="post">

    Email :
    <input type="email"
           name="email"
           required>

    <button type="submit">
        Send OTP
    </button>

</form>

</body>
</html>