<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.ConnectCollector,com.websniffer.ConnectPool, java.sql.*" %>
<%@include file="../catchVariables.jsp" %>


<%
            //esta pagina es para saber que es lo que paso en un minuto determinado
            ResultSet rsIps = null;
            ResultSet rsPuertos = null;
            int i = 1;

%>

<%@include file="sqlDetalleMinuto.jsp" %>

<div style="width:536px;" class="div-titulos-amarillos"> [ <b>IP's <% if (!ip_remoto.isEmpty()) {
                out.println(ip_remoto);
            }%>  </b> ] </div>

<%
            //ips=======================================================================
            rsIps = new ConnectCollector(short_context).select(sqlIps, ip_remoto);

%>
<table border="0" cellpadding="0" width="540"  class="filterable" id="tabla" align="center">
    <thead>
        <tr>
            <th bgcolor="#E9E9E9" class="bordes"> </th>
            <th bgcolor="#E9E9E9" class="bordes">IP</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen entrada</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen salida</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen total</th>
        </tr>
    </thead>
    <tbody>

        <% while (rsIps.next()) {%>

        <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
            <td align="center" class="bordes"><%= i%></td>
            <td align="center" class="bordes"><%= rsIps.getString("campo1")%></td>
            <td align="center" class="bordes"><%= rsIps.getInt("campo2") / unidadMedidaLong%></td>
            <td align="center" class="bordes"><%= rsIps.getInt("campo3") / unidadMedidaLong%></td>
            <td align="center" class="bordes"><%= rsIps.getInt("campo4") / unidadMedidaLong%></td>
        </tr>

        <% i++;
             }%>

    </tbody>
</table>
<!-- fin ips -->






<div style="width:536px;" class="div-titulos-amarillos"> [ <b>Puertos <% if (!ip_remoto.isEmpty()) {
                out.println(ip_remoto);
            }%>  </b> ] </div>
<%
            //puertos=======================================================================
            rsPuertos = new ConnectCollector(short_context).select(sqlPuertos, ip_remoto);
            i = 0;
%>


<table border="0" cellpadding="0" width="540"  class="filterable" id="tabla" align="center">
    <thead>
        <tr>
            <th bgcolor="#E9E9E9" class="bordes"> </th>
            <th bgcolor="#E9E9E9" class="bordes">Puerto</th>
            <th bgcolor="#E9E9E9" class="bordes">Protocolo</th>
            <th bgcolor="#E9E9E9" class="bordes">Conexiones</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen entrada</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen salida</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen total</th>
        </tr>
    </thead>
    <tbody>

        <% while (rsPuertos.next()) {%>

        <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
            <td align="center" class="bordes"><%= i%></td>
            <td align="center" class="bordes"><%= rsPuertos.getString("campo1")%></td>
            <td align="center" class="bordes"><%= rsPuertos.getString("campo2")%></td>
            <td align="center" class="bordes"><%= rsPuertos.getInt("campo3")%></td>
            <td align="center" class="bordes"><%= rsPuertos.getInt("campo4") / unidadMedidaLong%></td>
            <td align="center" class="bordes"><%= rsPuertos.getInt("campo5") / unidadMedidaLong%></td>
            <td align="center" class="bordes"><%= rsPuertos.getInt("campo6") / unidadMedidaLong%></td>
        </tr>

        <% i++;
             }%>

    </tbody>
</table>
<!-- fin Puertos -->






<%

            //conexiones================================================================
            int c = 1;
            ResultSet rsConexiones = new ConnectCollector(short_context).select(sqlConexiones, ip_remoto);

%>

<br>

<div style="width:536px;" class="div-titulos-amarillos"> [ <b>Conexiones <% if (!ip_remoto.isEmpty()) {
                out.println(ip_remoto);
            }%></b> ] </div>

<table border="0" cellpadding="0" width="540"  class="filterable" id="tabla" align="center">
    <thead>
        <tr>
            <th bgcolor="#E9E9E9" class="bordes"> </th>
            <th bgcolor="#E9E9E9" class="bordes">IP</th>
            <th bgcolor="#E9E9E9" class="bordes">Conexiones</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen entrada</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen salida</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen total</th>
        </tr>
    </thead>
    <tbody>

        <% while (rsConexiones.next()) {%>

        <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
            <td align="center" class="bordes"><%= c%></td>
            <td align="center" class="bordes"><%= rsConexiones.getString("campo1")%></td>
            <td align="center" class="bordes"><%= rsConexiones.getInt("campo2")%></td>
            <td align="center" class="bordes"><%= rsConexiones.getInt("campo3") / unidadMedidaLong%></td>
            <td align="center" class="bordes"><%= rsConexiones.getInt("campo4") / unidadMedidaLong%></td>
            <td align="center" class="bordes"><%= rsConexiones.getInt("campo5") / unidadMedidaLong%></td>
        </tr>

        <% c++;
             }%>


    </tbody>
</table>
<!-- fin conexiones -->

<%


            try {
                rsIps.close();
                rsPuertos.close();
                rsConexiones.close();
            } finally {
                rsIps = null;
                rsPuertos = null;
                rsConexiones = null;
            }

%>
