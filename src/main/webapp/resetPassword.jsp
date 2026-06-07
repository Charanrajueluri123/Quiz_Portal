<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>

<form action="resetPassword"
      method="post">

    New Password :

    <input type="password"
           name="password"
           required>

    <br><br>

    Confirm Password :

    <input type="password"
           name="confirmPassword"
           required>

    <br><br>

    <button type="submit">
        Update Password
    </button>

</form>

</body>
</html>