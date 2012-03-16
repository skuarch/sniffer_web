<%--
    Document   : detalleLineasVol
    Created on : 17/11/2009, 10:23:52 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%

    String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
    String minuto = "";

    //checo l tamaño del minuto, para agregarle lo del principio o lo del final
    if(request.getParameter("minuto").length() > 15){
        //con 15 digitos biene de volumen
        minuto = request.getParameter("minuto");
    }else{
        minuto = "20"+request.getParameter("minuto")+":00";
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/default.css?id=939" rel="stylesheet" type="text/css">

        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxDetalleMinuto.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/celdas.js"></script>

        <title>Detalle</title>
    </head>

    <body onload="javascript:ajaxDetalleMinuto('<%= minuto %>')">

            <center>

                <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 550px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

                <br>

                <!-- informacion -->
                <div>
                    fecha [ <b><%= minuto %> </b>] opción grafica [ <b><%= request.getParameter("opcionGrafica") %></b> ] [ <b><%= request.getParameter("nombreUnidadMedida") %></b> ]
                </div>

                <br>

                <!-- ips -->
                <!-- <div align="center" id="contenedor1"  style="width:540px; height:200px;"> -->
                <div align="center" id="contenedor1">

                </div>

                <br>

                <script type="text/javascript" src="Scripts/sortFilter.js"></script>

                <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 550px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        </center>

    </body>
</html>


<%

    minuto = null;
    System.gc();

%>
