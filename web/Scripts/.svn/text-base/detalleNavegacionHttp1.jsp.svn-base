<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.ConnectCollector, java.sql.*,java.io.*" %>
<%
            //esta pagina es para saber que es lo que paso en un minuto determinado

            String opcionGrafica = request.getParameter("opcionGrafica");
            String tipoGrafica = request.getParameter("tipoGrafica");
            String tiempoGrafica = request.getParameter("tiempoGrafica");
            boolean clic = Boolean.parseBoolean(request.getParameter("clic"));
            String nombreUnidadMedida = request.getParameter("nombreUnidadMedida");
            String unidadMedida = request.getParameter("unidadMedida");
            long unidadMedidaLong = Long.valueOf(unidadMedida).longValue();
            String ip_remoto = request.getParameter("ip_remoto");
            String remoto = request.getParameter("remoto");
            String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext();
%>

<%@include file="sqlDetalleNavegacionHttp.jsp" %>

<div style="width:544px;" class="div-titulos-amarillos"> [ <b>Navegación [ <%= ip_remoto%> ]</b> ] </div>
<%


            ResultSet r = null;

            int i = 1;
            r = new ConnectCollector(short_context).select(sqlNaveHttp, ip_remoto);            

%>


<table border="0" cellpadding="0" width="540"  class="filterable" id="tabla" align="center">
    <thead>
        <tr>
            <th bgcolor="#E9E9E9" class="bordes"> </th>
            <th bgcolor="#E9E9E9" class="bordes">Fecha </th>
            <th bgcolor="#E9E9E9" class="bordes">IP</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen total</th>
            <th bgcolor="#E9E9E9" class="bordes">AVG Tiempo Respuesta (seg)</th>
        </tr>
    </thead>
    <tbody>

        <% while (r.next()) {%>

        <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
            <td align="center" class="bordes"><%= i%></td>
            <td align="center" class="bordes"><%= r.getDate("campo3")%> <%= r.getTime("campo3")%></td>
            <td align="center" class="bordes"><%= r.getString("campo1").replace(",", "<br>")%></td>
            <td align="center" class="bordes"><%= r.getInt("campo2") / unidadMedidaLong%></td>
            <td align="center" class="bordes"><%= r.getDouble("campo4")%></td>
        </tr>

        <%
                        i++;
        }%>

    </tbody>
</table>
<!-- fin navegacion tcp -->



<%
            try {
                r.close();
            } finally {
                r = null;
            }
%>