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
        <title>Login Page</title>
        <script src=http://code.jquery.com/jquery-latest.min.js></script>
    </head>
    <body>

        <div id="loginPage">
                <input placeholder="Username" type="text" name="username" id="username"/><br/>
                <input placeholder="Password" type="password" name="password" id="password"/><br/>
                <input type="button" value="Login" id="loginBtn" onclick="login();"/><br/>
        </div>

        <script>
            function login() {
                var name = $("#username").val();
                var password = $("#password").val();
                $.post('RegisterServlet',{"username": name, "password": password}, function(response, status, xhr){
                    if(status==="success"){
                        if(response.result==="true"){
                            window.location.href = "Home.jsp";
                        }
                    }
                    else{
                       alert("Wrong username or password"); 
                    }
                });
                 
            }
        </script>
    </body>
</html>
