<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify OTP</title>
</head>
<body>

<h2>Verify OTP</h2>

<%
String msg=(String)request.getAttribute("msg");
if(msg!=null){
%>
<h4 style="color:red"><%=msg%></h4>
<%
}
%>

<form action="verifyOtp"
      method="post">

    OTP :

    <input type="text"
           name="otp"
           required>

    <button type="submit">
        Verify OTP
    </button>

</form>

</body>
</html>