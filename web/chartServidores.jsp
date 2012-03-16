<%-- 
    Document   : graficaServidores
    Created on : 18/12/2009, 12:42:29 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ChartDirector.*,com.websniffer.ConnectCollector,com.websniffer.SqlServidores,java.sql.ResultSet" %>
<%@include file="catchVariables.jsp" %>

<%

            String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
            int tam = 0;
            int i = 1;
            String sql = null;
            ResultSet r = null;

            sql = new SqlServidores().getSqlServidores(opcionGrafica, fecha_inicial, fecha_final, "0", "25");
            //sql = "SELECT (servidor_min_ip)campo1,(servidor_min_port)campo2,SUM(servidor_min_vol_in)campo3,SUM(servidor_min_vol_out)campo4,SUM(servidor_min_vol_tot)campo5,SUM(servidor_min_conex_tot)campo6,SUM(servidor_min_throughput_tot)campo7,MAX(servidor_min_tr)campo8,MIN(servidor_min_tr)campo9,AVG(servidor_min_tr)campo10 FROM servidor_min WHERE (id_servidor_min >= " + new Fechas().fechaId(fecha_inicial) + " AND id_servidor_min <= " + new Fechas().fechaId(fecha_final) + " ) GROUP BY servidor_min_ip,servidor_min_port ORDER BY servidor_min_vol_tot;";


            r = new ConnectCollector(shortContext).select(sql, ip_remoto);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>

        <div class="bordes" style="width:783px; height:417px; margin:5px; overflow:auto" >

            <div align="right" style="margin-right:55px">

                <span style="padding-right: 150px">volumen en (<%= request.getParameter("nombreUnidadMedida")%>) Throughput en (<%= request.getParameter("nombreUnidadMedida2")%> / seg) </span>  latencia de paquetes en milisegundos

            </div>

            <table border="0" cellpadding="1" cellspacing="1" width="761px" class="filterable" id="tabla">

                <thead>
                    <tr>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">

                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            IP Servidor
                            <br>
                            (<%=nombreUnidadMedida%>)
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Puerto
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Volumen
                            <br>
                            entrada
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Volumen
                            <br>
                            salida
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Volumen
                            <br>
                            total
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Numero
                            <br>
                            Conexiones
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Thorughput total
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Max latencia 
                            <br>
                            paquete
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            Min latencia 
                            <br>
                            por paquete
                        </th>

                        <th align="center" class="bordes" bgcolor="#E9E9E9">
                            AVG latencia 
                            <br>
                            por paquete
                        </th>

                    </tr>
                </thead>


                <tbody>

                    <% while (r.next()) {%>

                    <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">

                        <td align="center" class="bordes">
                            <%= i%>
                        </td>

                        <td align="center" class="bordes">
                            <a href="javascript:servidores('<%= r.getString("campo1")%>',<%= r.getString("campo2")%>);openWindow('servidoresDetalle.jsp',800,500,true,'?')">
                                <img src="images/server.gif" alt="" border="0" style="margin:10px">
                                <br>
                            </a>
                            <%= r.getString("campo1")%>
                        </td>
                        <td align="center" class="bordes"><%= r.getString("campo2")%></td>
                        <td align="center" class="bordes"><%= (int) r.getDouble("campo3") / unidadMedidaLong%></td>
                        <td align="center" class="bordes"><%= (int) r.getDouble("campo4") / unidadMedidaLong%></td>
                        <td align="center" class="bordes"><%= (int) r.getDouble("campo5") / unidadMedidaLong%></td>
                        <td align="center" class="bordes"><%= r.getInt("campo6")%></td>
                        <td align="center" class="bordes"><%= (int) r.getInt("campo7") / unidadMedidaLong%></td>
                        <td align="center" class="bordes"><%= (int) r.getInt("campo8")%></td>
                        <td align="center" class="bordes"><%= (int) r.getInt("campo9")%></td>
                        <td align="center" class="bordes"><%= (int) r.getDouble("campo10")%></td>
                    </tr>

                    <%
                                    i++;
                                }
                    %>

                </tbody>
            </table>

        </div>

        <div class="buttons" align="right">
            <a href="javascript:openWindow('configServers.jsp',400,400,true,'?');">
                <img src="images/cog.png" alt=""/>
                Configurar
            </a>
        </div>
    </body>
</html>

<%
            try {
                r.close();
            } finally {
                r = null;
            }
            System.gc();
%>
