<%--
    Document   : detalleNavegacion
    Created on : 7/01/2010, 09:46:51 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="catchVariables.jsp" %>
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%

            //table
            java.sql.ResultSet rs = null;
            int numRows = 0;
            String ip = request.getParameter("label");
            String sql = new com.websniffer.SqlIps().getSqlDetalleIps1(ip, opcionGrafica, fecha_inicial, fecha_final, "0", "25");
            rs = new com.websniffer.ConnectCollector(short_context).select(sql, ip_remoto);
            numRows = new com.websniffer.ConnectPool(short_context).getNumFilas(rs);
            String[] campo1 = null;
            double[] campo2 = null;
            String[] campo3 = null;
            double[] campo4 = null;
            double[] campo5 = null;
            double[] campo6 = null;
            double[] campo7 = null;
            double[] campo8 = null;
            int i = 0;

            campo1 = new com.websniffer.GraficaDatos(short_context).getLabels(rs, "campo1");
            campo2 = new com.websniffer.GraficaDatos(short_context).getData(rs, "campo2");
            campo3 = new com.websniffer.GraficaDatos(short_context).getLabels(rs, "campo3");
            campo4 = new com.websniffer.GraficaDatos(short_context).getData(rs, "campo4");
            campo5 = new com.websniffer.GraficaDatos(short_context).getData(rs, "campo5", unidadMedidaLong);
            campo6 = new com.websniffer.GraficaDatos(short_context).getData(rs, "campo6", unidadMedidaLong);
            campo7 = new com.websniffer.GraficaDatos(short_context).getData(rs, "campo7", unidadMedidaLong);
            campo8 = new com.websniffer.GraficaDatos(short_context).getData(rs, "campo8");            

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

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 800px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        <div id="header" align="center" style="background-color: #FDFEDC; width: 802px; margin:0 auto 0 auto;">
            ip: <b><%= ip %></b> fecha inicial: <%= fecha_inicial%> fecha final <%= fecha_final%>
        </div>

        <% if (numRows > 0 || campo1.length > 0) {%>

        <table border="0" cellpadding="1" cellspacing="1" align="center" class="filterable" id="tabla">
            <thead>
                <tr>
                    <th bgcolor="#E9E9E9" class="bordes"></th>
                    <th bgcolor="#E9E9E9" class="bordes">IP origen</th>
                    <th bgcolor="#E9E9E9" class="bordes">Puerto origen</th>
                    <th bgcolor="#E9E9E9" class="bordes">IP destino</th>
                    <th bgcolor="#E9E9E9" class="bordes">Puerto destino</th>
                    <th bgcolor="#E9E9E9" class="bordes">vol entrada</th>
                    <th bgcolor="#E9E9E9" class="bordes">vol salida</th>
                    <th bgcolor="#E9E9E9" class="bordes">vol total</th>
                    <th bgcolor="#E9E9E9" class="bordes">%</th>
                </tr>
            </thead>
            <tbody>

                <% while (i < campo1.length-1) {%>

                <tr align="center" onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
                    <td class="bordes"><%= i %></td>
                    <td class="bordes"><%= campo1[i]%></td>
                    <td class="bordes"><a href="javascript:openWindow2Level('detallePuerto.jsp?label=<%=(int) campo2[i]%>',850,550,true,'&')" ><%= (int) campo2[i]%></a></td>
                    <td class="bordes"><%= campo3[i]%></td>
                    <td class="bordes"><a href="javascript:openWindow2Level('detallePuerto.jsp?label=<%=(int) campo4[i]%>',850,550,true,'&')" ><%= (int) campo4[i]%></a></td>
                    <td class="bordes"><%= campo5[i]%></td>
                    <td class="bordes"><%= campo6[i]%></td>
                    <td class="bordes"><%= campo7[i]%></td>
                    <td class="bordes"><%= campo8[i]%></td>
                </tr>

                <% i++;
                     }%>

            </tbody>
        </table>

        <% } else {
                        out.println("<center>no existen datos que mostrar</center>");
                    }%>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 800px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

    </body>
</html>

<%

            try {
                rs.close();                
            } finally {
                rs = null;                
            }

%>
