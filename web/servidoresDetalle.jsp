<%--
    Document   : alarmas
    Created on : 20/11/2009, 04:15:44 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link type="text/css" rel="stylesheet" href="css/default.css">

        <script language="javascript" type="text/javascript" src="Scripts/celdas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxTablaServidores.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/abrirVentanaOpener.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/abrirVentanaOpenerMinuto.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/variablesServidor.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/servidores.js"></script>
        

        <title>Servidores SisPro</title>

    </head>
    <body onload="javascript:ajaxTablaServidores(0,100,'siguiente')">

        <center>

            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 750px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

            <div id="contenedorServidores">

            </div>

            <div id="contenedorTablaServidores">
                da clic en la grafica para ver el detalle
            </div>

            <script type="text/javascript" src="Scripts/sortFilter.js"></script>

            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 750px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>
            
        </center>

    </body>
</html>
