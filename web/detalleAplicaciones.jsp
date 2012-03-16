<%--
    Document   : detalleNavegacion
    Created on : 7/01/2010, 09:46:51 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    String opcionGrafica = request.getParameter("opcionGrafica");
    String tipoGrafica = request.getParameter("tipoGrafica");
    String tiempoGrafica = request.getParameter("tiempoGrafica");
    boolean clic = Boolean.parseBoolean(request.getParameter("clic"));
    String refrescar = request.getParameter("refrescar");
    String fecha_inicial = request.getParameter("fecha_inicial");
    String fecha_final = request.getParameter("fecha_final");
    String nombreUnidadMedida = request.getParameter("nombreUnidadMedida");
    String unidadMedida = request.getParameter("unidadMedida");
    long unidadMedidaLong = Long.valueOf(unidadMedida).longValue();
    String remoto = request.getParameter("remoto");
    String ip_remoto = request.getParameter("ip_remoto");            
%>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/default.css?id=939" rel="stylesheet" type="text/css">

        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxDetalleAplicaciones.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/celdas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/openWindow2Level.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getterGlobal.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getAllVariables.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getUrlVarsNames.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getUrlVars.js"></script>

        <title>Detalle</title>

    </head>
    <body onload="ajaxDetalleAplicaciones('<%=request.getParameter("label") %>')">


        <center>

            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 650px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

                <!-- informacion -->
                <div>
                    [  <b>Detalle aplicación <%= request.getParameter("label") %></b> ] opcion grafica [ <b><%= request.getParameter("opcionGrafica") %></b> ] [ bytes ] [<a href="Scripts/detalleAplicaciones.jsp?opcionGrafica=<%=opcionGrafica%>&tipoGrafica=<%=tiempoGrafica%>&fecha_inicial=<%=fecha_inicial%>&fecha_final=<%=fecha_final%>&nombreUnidadMedida=<%=nombreUnidadMedida%>&unidadMedida=<%=unidadMedida%>&unidadMedidaLong=<%=unidadMedidaLong%>&remoto=<%=remoto%>&ip_remoto=<%=ip_remoto%>&label=<%=request.getParameter("label")%>"> excel </a>]
                </div>

                <br>

                <!--contenedor -->
                <div align="center" id="contenedor1">

                </div>

                <script type="text/javascript" src="Scripts/sortFilter.js"></script>

<div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 650px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>
            
        </center>
    </body>
</html>
