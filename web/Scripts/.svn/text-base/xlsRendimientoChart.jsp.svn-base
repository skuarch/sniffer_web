<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.SqlRendimiento,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.CriticLevel,com.websniffer.Redondear" %>
<%@include file="../catchVariables.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%    
    String sql = "";
    ResultSet rs =null;
    
    sql = new SqlRendimiento().getSqlRendimiento(opcionGrafica, fecha_inicial, fecha_final, "0", "0");

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
                    <th bgcolor="#EAEAEA">SisPro Throughput <%= opcionGrafica  %>  (<%= nombreUnidadMedida  %>) <% if(!ip_remoto.isEmpty()) out.println(ip_remoto); %></th>
                </tr>

            </thead>
            
            <tbody>

                <tr>
                    <td>

                            <!-- tabla con los datos -->
                        <table width="200" border="1">
                            <thead>
                                <tr>
                                    <th bgcolor="#6FA8FF">Fecha</th>
                                    <th bgcolor="#6FA8FF">Throughput salida</th>
                                    <th bgcolor="#6FA8FF">Throughput entrada</th>
                                    <th bgcolor="#6FA8FF">Throughput total</th>
                                </tr>
                            </thead>
                            <tbody>

                                <% while(rs.next()){ %>

                                <tr>
                                    <td><%= rs.getDate("campo1") %>  <%= rs.getTime("campo1") %></td>
                                    <td><%= new Redondear().redondear(rs.getDouble("campo2") / unidadMedidaLong,3) %></td>
                                    <td><%= new Redondear().redondear(rs.getDouble("campo3") / unidadMedidaLong,3) %></td>
                                    <td><%= new Redondear().redondear(rs.getDouble("campo4") / unidadMedidaLong,3) %></td>
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
    System.gc();

%>