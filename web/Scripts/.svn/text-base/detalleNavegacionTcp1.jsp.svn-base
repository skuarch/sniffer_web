<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.SqlDetalleNavegacionTcp,com.websniffer.ConnectCollector,com.websniffer.ConnectPool, java.sql.ResultSet" %>
<%@include file="../catchVariables.jsp" %>

<div style="width:544px;" class="div-titulos-amarillos"> [ <b>Navegación</b> ] </div>
<%

            //ips=======================================================================
            int i = 1;
            int tam = 0;
            String label = request.getParameter("label");

            String sql = new SqlDetalleNavegacionTcp().getSqlDetalleNavegacionTcp(fecha_inicial, fecha_final, "0", "25", label);            
            ResultSet r = new ConnectCollector(short_context).select(sql, ip_remoto);

            tam = new ConnectPool(short_context).getNumFilas(r);

            if (tam > 0) {

%>


<table border="0" cellpadding="0" width="540"  class="filterable" id="tabla" align="center">
    <thead>
        <tr>
            <th bgcolor="#E9E9E9" class="bordes"> </th>
            <th bgcolor="#E9E9E9" class="bordes">IP</th>
            <th bgcolor="#E9E9E9" class="bordes">Volumen total</th>
        </tr>
    </thead>
    <tbody>

        <% while (r.next()) {%>

        <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
            <td align="center" class="bordes"><%= i%></td>
            <td align="center" class="bordes"><%= r.getString("campo1").replace(",", "<br>") %></td>
            <td align="center" class="bordes"><%= r.getInt("campo2") / unidadMedidaLong%></td>
        </tr>

        <% i++;
                        }%>

    </tbody>
</table>
<!-- fin navegacion tcp -->



<%
                try{
                r.close();
                }finally{
                    r = null;
                }

            } else {
                out.println("no existen datos");
            }

%>