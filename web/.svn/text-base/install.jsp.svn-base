<%-- 
    Document   : init
    Created on : 19/03/2010, 06:25:52 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    <% 
        String context = request.getContextPath().toLowerCase();
        context = context.substring(1, context.length());
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebSniffer Start</title>
    </head>
    <body>


        <center>

            <h1>WebSniffer Start</h1>

            <b>this page to create the database and the initial customization</b>
            <br>
            <br>
            <br>

            <form name="formInit" action="createsDatabase.jsp" method="POST">

                <table border="0">

                    <tbody>
                        <tr>
                            <td>Name of the database to create</td>
                            <td><input type="text" value="websniffer<%= new com.websniffer.Context(request.getContextPath()).getShortContext() %>"  id="database" name="database" readonly></td>
                        </tr>
                        <tr>
                            <td>ip o hostname of server database</td>
                            <td><input type="text" value="localhost"  id="ip" name="ip">*</td>
                        </tr>

                        <tr>
                            <td>User (Privileged)</td>
                            <td><input type="text" value="root"  id="user" name="user"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" value="vitalnoc"  id="password" name ="password"></td>
                        </tr>

                        <tr>
                            <td>DataBase Port</td>
                            <td><input type="text" value="3306"  id="port" name ="port"></td>
                        </tr>

                        <tr>
                            <td>Project name</td>
                            <td><input type="text" value="<%= context %>"  id="project" name="project">*</td>
                        </tr>


                        <tr>
                            <td>Project short name</td>
                            <td><input readonly type="text" value="<%= new com.websniffer.Context(request.getContextPath()).getShortContext().substring(1) %>"  id="project_short_name" name="project_short_name">*</td>
                        </tr>

                        <tr>
                            <td>Path</td>
                            <td><input type="text" value="/opt/"  id="path" name="path">*</td>
                        </tr>

                    </tbody>

                </table>

                <br>
                <input type="submit" value="create">

            </form>

            <br>
            Fields with a * lowercase
            <br>
            all fields are necesarions

        </center>

    </body>
</html>
