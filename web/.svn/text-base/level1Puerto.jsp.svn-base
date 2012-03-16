<%--
    Document   : detalleNavegacion
    Created on : 7/01/2010, 09:46:51 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.sqlVolTotal,com.websniffer.ConnectPool,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos"%>
<%@include file="catchVariables.jsp" %>
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();%>
<%

            
            java.sql.ResultSet rsVol = null;
            String sqlVol = new sqlVolTotal().getSqlVolTotal(opcionGrafica, fecha_inicial, fecha_final);
            rsVol = new ConnectCollector(shortContext).select(sqlVol, ip_remoto);
            rsVol.next();

            double[] volIn = new GraficaDatos(shortContext).getData(rsVol, "campo1", unidadMedidaLong);
            double[] volOut = new GraficaDatos(shortContext).getData(rsVol, "campo2", unidadMedidaLong);
            double[] volTot = new GraficaDatos(shortContext).getData(rsVol, "campo3", unidadMedidaLong);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%

            //table
            java.sql.ResultSet rs = null;
            int numRows = 0;
            int port = Integer.parseInt(request.getParameter("label"));
            String sql = new com.websniffer.SqlPuertos().getSqlLevel1(port, opcionGrafica, fecha_inicial, fecha_final, "0", "25");
            rs = new com.websniffer.ConnectCollector(short_context).select(sql, ip_remoto);
            numRows = new com.websniffer.ConnectPool(short_context).getNumFilas(rs);
            String[] campo1 = null;
            double[] campo2 = null;
            String[] campo3 = null;
            int i = 0;

            campo1 = new com.websniffer.GraficaDatos(short_context).getLabels(rs, "campo1");            
            campo2 = new com.websniffer.GraficaDatos(short_context).getData(rs, "campo2", unidadMedidaLong);
            campo3 = new com.websniffer.GraficaDatos(short_context).getLabels(rs, "campo3");

            //name of protocol
            java.sql.ResultSet rs1 = null;
            String sql1 = "SELECT protocolo FROM nombre_puertos WHERE  portNum = " + port + ";";
            rs1 = new com.websniffer.ConnectCollector(short_context).select(sql1, ip_remoto);
            String protocolo = null;

            if (new com.websniffer.ConnectPool(short_context).getNumFilas(rs1) > 0) {
                rs1.next();
                protocolo = rs1.getString("protocolo");
            } else {
                protocolo = "desconocido";
            }

%>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/default.css?id=939" rel="stylesheet" type="text/css">

        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxDetallePuertos.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/celdas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/sortFilter.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/openWindow2Level.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getUrlVars.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getUrlVarsNames.js"></script>

        <title>Detalle</title>

    </head>
    <body>



        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 450px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        <div id="header" align="center" style="background-color: #FDFEDC; width: 452px; margin:0 auto 0 auto;">
            puerto: <b><%= port%></b> protocolo:<%= protocolo%>
            <br>
            fecha inicial: <%= fecha_inicial%> fecha final <%= fecha_final%>
            <br>
            volumen en <%=nombreUnidadMedida%>, entrada: <%= new com.websniffer.Redondear().redondear(volIn[0],2)%> salida: <%= new com.websniffer.Redondear().redondear(volOut[0],2)%> total: <%= new com.websniffer.Redondear().redondear(volTot[0],2)%>
        </div>

        

        

        


        <% if (numRows > 0 || campo1.length > 0) {%>

        <table border="0" cellpadding="1" cellspacing="1" align="center" class="filterable" id="tabla">
            <thead>
                <tr>
                    <th bgcolor="#E9E9E9" class="bordes"></th>
                    <th bgcolor="#E9E9E9" class="bordes">IP</th>
                    <th bgcolor="#E9E9E9" class="bordes">Volumen total</th>
                    <th bgcolor="#E9E9E9" class="bordes">%</th>
                </tr>
            </thead>
            <tbody>

                <% while (i < campo1.length -1) {%>

                <tr align="center" onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">

                    <td class="bordes"><%= i %></td>
                    <td class="bordes"><a href="javascript:openWindow2Level('detalleIp.jsp?label=<%=campo1[i]%>',850,550,true,'&')" ><%= campo1[i]%></a></td>
                    <td class="bordes"><%= campo2[i]%></td>
                    <td class="bordes"><%= campo3[i]%></td>

                </tr>

                <% i++;
                     }%>

            </tbody>
        </table>

        <% } else {
                        out.println("<center>no existen datos que mostrar</center>");
                    }%>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 450px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

    </body>
</html>

<%

            try {
                rs.close();
                rs1.close();
                rsVol.close();
            } finally {
                rs = null;
                rs1 = null;
            }

%>
