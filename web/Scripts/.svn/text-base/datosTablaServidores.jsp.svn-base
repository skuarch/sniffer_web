<%@page import="com.websniffer.ConnectCollector, java.sql.ResultSet, com.websniffer.Fechas,com.websniffer.SqlServidores,com.websniffer.ConnectPool" %>
<%@include file="../catchVariables.jsp" %>
<%

            String sql = "";
            String nivel = "";
            int filas = 0;
            int i = Integer.parseInt(request.getParameter("filas1"));
            String ip_servidor = request.getParameter("ip_servidor");
            String puerto_servidor = request.getParameter("puerto_server");
            String filas1 = request.getParameter("filas1");
            String filas2 = request.getParameter("filas2");

            if (filas1.equalsIgnoreCase("1")) {
                filas1 = "0";
            }

            sql = new SqlServidores().getSqlServidores(opcionGrafica, fecha_inicial, fecha_final, filas1, filas2, ip_servidor, puerto_servidor);

            ResultSet r = new ConnectCollector(short_context).select(sql, ip_remoto);

            filas = new ConnectPool(short_context).getNumFilas(r);

            if (filas > 0) {

%>

<!--tabla para poner las Servidores-->
<div align="right">
    <form
        onsubmit="javascript:ajaxTablaServidores('<%= request.getParameter("dataSet")%>',100,'fijo');"
        action="javascript:ajaxTablaServidores('<%= request.getParameter("dataSet")%>',100,'fijo');"
        method="post"
        name="formTabla" id="formTabla">

        [ <a href="javascript:filas1 = 0; filas2 = 0;ajaxTablaServidores('<%= request.getParameter("dataSet")%>',100,'siguiente');">Restaurar</a> ]

        <a href="#"><img border="0" align="middle" src="images/previous.gif" title="anterior" alt="anterior" onclick="javascript:ajaxTablaServidores('<%= request.getParameter("dataSet")%>',document.formTabla.filasTabla.value,'anterior');"></a>

        <input type="text" id="filasTabla" name="filasTabla" maxlength="3" size="3" value="<%= request.getParameter("limit")%>">

        <a href="#"><img border="0" align="middle" src="images/next.gif" title="siguiente" alt="siguiente" onclick="javascript:ajaxTablaServidores('<%= request.getParameter("dataSet")%>',document.formTabla.filasTabla.value,'siguiente');"></a>

    </form>
</div>
<div align="right" style="margin-right:55px">

    <span style="padding-right: 150px">volumen en (<%= request.getParameter("nombreUnidadMedida")%>) Throughput en (<%= request.getParameter("nombreUnidadMedida2")%> / seg) </span>  latencia de paquetes en milisegundos

</div>
<div class="div-titulos-amarillos" style="width:770px">Servidor [ <b><%= request.getParameter("ip_servidor")%></b> ] Puerto [ <b><%= request.getParameter("puerto_servidor")%></b> ]</div>
<table border="0" width="740px" class="filterable" id="tabla">
    <thead>
        <tr>
            <th bgcolor="#E9E9E9" class="bordes"> </th>
            <th bgcolor="#E9E9E9" class="bordes">Fecha</th>
            <th bgcolor="#E9E9E9" class="bordes">Vol entrada</th>
            <th bgcolor="#E9E9E9" class="bordes">Vol salida</th>
            <th bgcolor="#E9E9E9" class="bordes">Vol total</th>
            <th bgcolor="#E9E9E9" class="bordes">Total conexiones</th>
            <th bgcolor="#E9E9E9" class="bordes">Throughput</th>
            <th bgcolor="#E9E9E9" class="bordes">latencia man</th>
            <th bgcolor="#E9E9E9" class="bordes">latencia mix</th>
            <th bgcolor="#E9E9E9" class="bordes">latencia avg</th>
        </tr>
    </thead>
    <tbody>

        <% while (r.next()) {%>

        <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
            <td align="center" class="bordes"><%= i++%></td>
            <td align="center" class="bordes"><%= r.getDate("campo0")%> <%= r.getTime("campo0")%></td>
            <td align="center" class="bordes"><%= r.getInt("campo3")%></td>
            <td align="center" class="bordes"><%= r.getString("campo4")%></td>
            <td align="center" class="bordes"><%= r.getString("campo5")%></td>
            <td align="center" class="bordes"><%= r.getString("campo6")%></td>
            <td align="center" class="bordes"><%= r.getString("campo7")%></td>
            <td align="center" class="bordes"><%= r.getString("campo8").replace(",", "<br>")%></td>
            <td align="center" class="bordes"><%= r.getString("campo9").replace(",", "<br>")%></td>
            <td align="center" class="bordes"><%= r.getInt("campo10")%></td>
        </tr>

        <%
                        }
                    } else {
                        out.println("<b>[ No existen Datos ]</b>");

                        out.println("<a href=\"javascript:ajaxTablaServidores(0," + request.getParameter("filas2") + ",'anterior');\"><img align=\"middle\" title=\"regresar\" border=\"0\" align=\"middle\" src=\"images/previous.gif\" title=\"anterior\" alt=\"anterior\" border=\"0\"</a>");
                    }
        %>

    </tbody>
</table>

<% try {
                r.close();
            } finally {
                r = null;
            }
%>
