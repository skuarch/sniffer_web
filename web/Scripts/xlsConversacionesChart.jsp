<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.SqlConversaciones,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.Redondear" %>
<%@include file="../catchVariables.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%    
    String paginaGrafica = request.getParameter("paginaGrafica");
    String sql = "";  
    ResultSet rs =null;

    sql = new SqlConversaciones().getSqlConversaciones(opcionGrafica, fecha_inicial, fecha_final, "0", "0"," -> ");

    rs = new ConnectCollector(short_context).select(sql, ip_remoto);

%>


<html>
    <head>

        <% response.setHeader("Content-Disposition", "attachment; filename=\"ReporteSisPro.xls\""); %>

        <meta http-equiv="application/vnd.ms-excel" content="application/vnd.ms-excel; charset=UTF-8">
        <title></title>
    </head>


    <body>

        <!-- tabla para ordenar -->
        <table border="1">
            <thead>

                <tr>
                    <th bgcolor="#EAEAEA">SisPro Conversaciones <%= opcionGrafica  %>  (<%= nombreUnidadMedida  %>) <% if(!ip_remoto.isEmpty()) out.println(ip_remoto); %></th>
                </tr>

            </thead>

            <tbody>

                <tr>
                    <td>

                            <!-- tabla con los datos -->
                        <table>
                            <thead>
                                <tr>
                                    <th bgcolor="#6FA8FF">Conversacion</th>                                    
                                    <th bgcolor="#6FA8FF">Volumen entrada</th>
                                    <th bgcolor="#6FA8FF">Volumen salida</th>
                                    <th bgcolor="#6FA8FF">Volumen total</th>
                                    <th bgcolor="#6FA8FF">Duracion (min)</th>
                                </tr>
                            </thead>
                            <tbody>

                                <% while(rs.next()){ %>

                                <tr>
                                    <td><%= rs.getString("campo0") %></td>
                                    <td><%= rs.getInt("campo1")  / unidadMedidaLong %></td>
                                    <td><%= rs.getDouble("campo2") / unidadMedidaLong %></td>
                                    <td><%= rs.getDouble("campo3") / unidadMedidaLong %></td>
                                    <td><%= new Redondear().redondear(rs.getDouble("campo4") / 60,2) %></td>
                                </tr>

                                <% } %>

                            </tbody>
                        </table>

                    </td>
                </tr>

            </tbody>
        </table>


    </body>

</html>



<%
  
    fecha_inicial = null;
    fecha_final = null;
    rs.close();
    sql = null;
    System.gc();

%>