<%-- 
    Document   : signUp
    Created on : Feb 23, 2018, 2:23:01 PM
    Author     : Asmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <script src=http://code.jquery.com/jquery-latest.min.js></script>
    </head>

    <body>
        <div id="registerPage">
            <center>
                <input placeholder="Username" type="text" name="username" id="username"/><br/>
                <input placeholder="Password" type="password" name="password" id="password"/><br/>
                <input type="button" value="Sign Up" id="registrationBtn" onclick="createUser();"/><br/>
                Have an account?<br/><a href="login.jsp" id="loginText">Login</a>
            </center>
        </div>

        <script>
            function createUser() {
                var name = $("#username").val();
                var password = $("#password").val();
                var userData = {"username": name, "password": password};
                $.ajax({
                    url: 'RegisterServlet',
                    type: 'GET',
                    contentType: 'application/json',
                    data: userData,
                    success: function (data, textStatus, jqXHR) {
                        window.location.href = "login.jsp";
                    }
                });
            }
        </script>
    </body>
</html>
