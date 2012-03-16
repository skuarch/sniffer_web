<%--
    Document   : detalleNavegacion
    Created on : 7/01/2010, 09:46:51 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/default.css?id=939" rel="stylesheet" type="text/css">

        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxDetalleNavegacionHttp.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/celdas.js"></script>

        <title>Detalle</title>

    </head>
    <body onload="ajaxDetalleNavegacionHttp('<%=request.getParameter("label") %>')">


        <center>

            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 690px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

                <!-- informacion -->
                <div>
                    [  <b>Detalle Navegación <a href="<%= request.getParameter("label") %>" target="_black"><%= request.getParameter("label") %></a></b> ] opción grafica [ <b><%= request.getParameter("opcionGrafica") %></b> ] [ <b><%= request.getParameter("nombreUnidadMedida") %></b> ]
                </div>


                <!--contenedor -->
                <div align="center" id="contenedor1">

                </div>

                <script type="text/javascript" src="Scripts/sortFilter.js"></script>

            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 690px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        </center>

        

    </body>
</html>

