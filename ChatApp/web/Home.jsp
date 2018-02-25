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
        <title>Home Page</title>
        <script src=http://code.jquery.com/jquery-latest.min.js></script>
    </head>

    <body onload="setInterval('render()', 1000)">
        <button style="float:right;" id="exit" onclick="logout();">Logout</button>

        <div id="messagePage">
                <input placeholder="Message" name="message" id="message"/><br/>
                <input type="button" value="Send" id="sendMessageBtn" onclick="sendMessage()"/>
        </div>

        <div id="friendsPage">
            <center>
                <table>
                    <tr><td>Online Friends</td></tr>
                </table>
                <table id="friendsTable" style="word-wrap:break-word; padding: 10px;">

                </table>
            </center>
        </div>

        <div id="messagesPage">
            <center>
                <table>
                    <tr><td>Messages</td></tr>
                </table>
                <table id="messagesTable" style="word-wrap:break-word; padding: 10px;">

                </table>
            </center>
        </div>

        <script>
            function sendMessage() {
                var message = $("#message").val();
                document.getElementById("message").value = "";
                var jsonData = {"message": message};
                $.ajax({
                    url: 'HomeServlet',
                    type: 'GET',
                    contentType: 'application/json',
                    data: jsonData,
                    dataType: 'json'
                });
            }

            function render() {
                getMessages();
                getUsers();
            }

            function getMessages() {
                $.ajax({
                    url: 'HomeServlet',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        messages = data;
                        $("#messagesTable tr").remove();
                        for (counter = 0; counter < messages.length; counter++) {
                            $("#messagesTable").append('<tr><td>' + messages[counter].username + '</td><td>' + messages[counter].message + '</td></tr>');
                        }
                    }

                });
            }

            function getUsers() {
                $.ajax({
                    url: 'UserServlet',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        users = data;
                        $("#friendsTable tr").remove();
                        for (counter = 0; counter < users.length; counter++) {
                            $("#friendsTable").append('<tr><td>' + users[counter].username + '</td></tr>');
                        }
                    }

                });
            }

            function logout() {
                $.ajax({
                    url: 'UserServlet',
                    type: 'GET',
                    success: function (data, status, jqXHR) {
                        window.location.href = "login.jsp";
                    }
                });

            }

        </script>
    </body>
</html>
