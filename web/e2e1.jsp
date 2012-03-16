<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.Fechas" %>

<%@include file="chartE2ETiempo.jsp" %>
<%@include file="chartE2ESaltos.jsp" %>

<div class="bordes" style="width:783px; height:417px; margin:5px; overflow:auto" >
    <img src='<%=response.encodeURL("getchart.jsp?" + chartBarrasConversaciones)%>' usemap="#map1" border="0" alt="">
    <br>
    <br>
    <img src='<%=response.encodeURL("getchart.jsp?" + chartSaltos)%>' usemap="#map2" border="0" alt="">

    <br>
    <br>

    <%

                String sql3 = "SELECT trace_fecha,trace_destino,trace_index,trace_hostname_saltos,trace_time FROM traceroute WHERE (trace_fecha >= '" + request.getParameter("fecha_inicial") + "' AND trace_fecha <= '" + request.getParameter("fecha_final") + "') ORDER BY trace_fecha DESC;";
                ResultSet r3 = new ConnectCollector(context).select(sql3, request.getParameter("ip_remoto"));
                int tam3 = (int) new ConnectPool(context).getNumFilas(r3);


                if (tam3 > 0) {
                    int g = 0;

    %>

    <table border="0" width="730" class="filterable" id="tabla">
        <thead>
            <tr>
                <th bgcolor="#E9E9E9" class="bordes"></th>
                <th bgcolor="#E9E9E9" class="bordes">Fecha</th>
                <th bgcolor="#E9E9E9" class="bordes">Destino</th>
                <th bgcolor="#E9E9E9" class="bordes">Indice</th>
                <th bgcolor="#E9E9E9" class="bordes">hostname</th>
                <th bgcolor="#E9E9E9" class="bordes">tiempo (ms)</th>
            </tr>
        </thead>
        <tbody>

            <% while (r3.next()) {%>

            <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
                <td align="center" class="bordes"><%= g++ %></td>
                <td align="center" class="bordes"><%= r3.getDate("trace_fecha")%> <%= r3.getTime("trace_fecha")%></td>
                <td align="center" class="bordes"><%= r3.getString("trace_destino")%></td>
                <td align="center" class="bordes"><%= r3.getString("trace_index").replace(",", "<br>")%></td>
                <td align="center" class="bordes"><%= r3.getString("trace_hostname_saltos").replace(",", "<br>")%></td>
                <td align="center" class="bordes"><%= r3.getString("trace_time").replace(",", "<br>")%></td>
            </tr>

            <% }%>

        </tbody>
    </table>    

    <% }%>

</div>

<%

            try {
                r3.close();
            } finally {
                r3 = null;
            }

%>
