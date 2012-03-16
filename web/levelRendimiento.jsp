<%--
    Document   : levelVolumen
    Created on : 8/04/2010, 04:38:50 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="catchVariables.jsp" %>
<%
    //int unidad = Integer.parseInt(unidadMedida);
    float level = new com.websniffer.CriticLevel(request.getParameter("ip_remoto"),short_context).getLevelRendimiento() / unidadMedidaLong;
    float max = new com.websniffer.CriticLevel(request.getParameter("ip_remoto"),short_context).getMaxDown() / unidadMedidaLong;

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css?id=939" >
        <script language="javascript" type="text/javascript" src="Scripts/checkEmpty.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/checkNumber.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validFormLevelVol.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validFormMaxDown.js"></script>
        <title><%= new com.websniffer.Theme(short_context).getWindowTitle()%></title>
    </head>
    <body>

        <center>
            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(short_context).getHeaderColor()%>; width: 350px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(short_context).getBorderColorHeader()%>;"></div>
            <div style="width: 340px; height: 400px">
                <h3>[ <%= request.getParameter("ip_remoto")%> ] <br>  Configuracion Nivel Critico</h3>

                Nivel critico de Throughput
                <form action="Scripts/saveLevelRendimiento.jsp?ip_remoto=<%= request.getParameter("ip_remoto")%>&unidadMedida=<%= request.getParameter("unidadMedida")%>" method="post" name="formLevelVol" id="formLevelVol" >

                    <input type="text" size="10" id="level" name="level" value="<%= level %>" >
                    <input type="button" id="save" name="save" value="guardar" onclick="validFormLevelVol()" >
                    <br>
                    los datos seguardaran en <%= request.getParameter("nombreUnidadMedida2")  %>

                </form>

                    <br>
                    <br>

                    Este cambio configura el nivel critico
                    <br>
                    y se mostrara una marca en la grafica de Throughput

                    <br>
                    <hr>                    
                    <h3>Configuracion de tasa de transferencia maxima de descarga</h3>
                    Tasa de transferencia maxima que en se debe de descargar
                    <form action="Scripts/saveMaxDown.jsp?ip_remoto=<%= request.getParameter("ip_remoto")%>&unidadMedida=<%= request.getParameter("unidadMedida")%>" method="post" name="formMaxDown" id="formMaxDown">

                        <input type="text" size="10" id="maxDown" name="maxDown" value="<%= max %>" >
                        <input type="button" id="save2" name="save2" value="guardar" onclick="validFormMaxDown()" >
                    </form>
                        <br>
                    <br>

                    Este cambio se representara con una linea punteada de color amarillo
                    <hr>

            </div>
            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(short_context).getHeaderColor()%>; width: 350px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(short_context).getBorderColorHeader()%>;"></div>
        </center>
    </body>
</html>

