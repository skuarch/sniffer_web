<%--
    Document   : configServidores
    Created on : 11/02/2010, 06:14:36 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.ConnectCollector,java.sql.ResultSet;"%>
<%@include file="catchVariables.jsp" %>

<%
            ResultSet rs = new ConnectCollector(short_context).select("select * from servidor_config;", ip_remoto);
            int i = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="expires" content="0">
        <link rel="stylesheet" type="text/css" href="css/default.css?id=939" >

        <script language="javascrip" type="text/javascript" src="Scripts/ajaxGuardaServidor.js"></script>
        <script language="javascrip" type="text/javascript" src="Scripts/ajaxBorraServidor.js"></script>
        <script language="javascrip" type="text/javascript" src="Scripts/validaIp.js"></script>
        <script language="javascrip" type="text/javascript" src="Scripts/validaPuerto.js"></script>
        <script language="javascrip" type="text/javascript" src="Scripts/guardaServidor.js"></script>
        <script language="javascrip" type="text/javascript" src="Scripts/borraServidor.js"></script>
        <script language="javascrip" type="text/javascript" src="Scripts/getAllVariables.js"></script>
        <script language="javascrip" type="text/javascript" src="Scripts/ajax.js"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title></title>

    </head>

    <body>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(short_context).getHeaderColor()%>; width: 350px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(short_context).getBorderColorHeader()%>;"></div>

        <center>

            <b>configuracion de servidores</b>
            <br>
            <br>

            <div style="height: 320px;  width: 350px; overflow: auto">

                <form action="" method="post" name="formServidores" id="formServidores">

                    <% while (rs.next()) {

                                    i++;
                                    String varIp = "document.formServidores.ipServidor" + i + ".value";
                                    String varPuerto = "document.formServidores.puertoServidor" + i + ".value";
                                    String varBoton = "document.formServidores.guardar" + i + "";

                    %>

                    <%= i + ".-  "%>
                    IP <input type="text" name="ipServidor<%= i%>" value="<%= rs.getString("servidor_ip")%>" maxlength="15" size="15">
                    Puerto <input type="text" name="puertoServidor<%= i%>"  value="<%= rs.getString("servidor_puerto")%>" maxlength="5" size="5">
                    <img src="images/ok_mini.png" alt="" onclick="javascript:guardaServidor(<%= varIp%>,<%= varPuerto%>)">
                    <img src="images/error_mini.png" alt="" onclick="javascript:borraServidor(<%= varIp%>,<%= varPuerto%>)">


                    <br>

                    <% }%>

                    <%
                                for (int e = i + 1; e <= 50; e++) {
                                    String varIp = "document.formServidores.ipServidor" + e + ".value";
                                    String varPuerto = "document.formServidores.puertoServidor" + e + ".value";
                                    String varBoton = "document.formServidores.guardar" + e + "";
                    %>

                    <%= e + ".-  "%>
                    IP <input type="text" name="ipServidor<%= e%>" maxlength="15" size="15">
                    Puerto <input type="text" name="puertoServidor<%= e%>" maxlength="5" size="5">

                    <a href="#"><img  border="0" src="images/ok_mini.png" alt="" onclick="javascript:guardaServidor(<%= varIp%>,<%= varPuerto%>)"></a>

                    <a href="#"><img border="0" src="images/error_mini.png" alt="" onclick="javascript:borraServidor(<%= varIp%>,<%= varPuerto%>)"></a>

                    <br>

                    <% }%>



                </form>

            </div>

        </center>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(short_context).getHeaderColor()%>; width: 350px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(short_context).getBorderColorHeader()%>;"></div>

    </body>
</html>
<%

            try {
                rs.close();
            } finally {
                rs = null;
            }

%>