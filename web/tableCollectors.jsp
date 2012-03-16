<%-- 
    Document   : tableCollectors
    Created on : 24/03/2010, 01:35:20 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet, com.websniffer.ConnectPool"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<% String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext(); %>
<%
            ResultSet rs = null;

            rs = new ConnectPool(short_context).select("select * from collectors");

            if(new ConnectPool(short_context).getNumFilas(rs) > 0){
                int i = 1;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <center>

            <div style="width: 790px; height: 390px; overflow: auto">

                <table border="0" cellpadding="1" cellspacing="1" align="center" width="773" class="filterable" id="tabla">
                    <thead>

                        <tr align="center">
                            <th bgcolor="#E9E9E9" class="bordes">Recolector </th>
                            <th bgcolor="#E9E9E9" class="bordes">IP</th>
                            <th bgcolor="#E9E9E9" class="bordes">Hostname</th>
                            <th bgcolor="#E9E9E9" class="bordes">Sitio</th>
                            <th bgcolor="#E9E9E9" class="bordes">Descripcion</th>
                            <th bgcolor="#E9E9E9" class="bordes">Editar</th>
                        </tr>

                    </thead>
                    <tbody>

                        <% while (rs.next()) {%>

                        <tr align="center" onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
                            <td class="bordes"><%= i %></td>
                            <td class="bordes">
                                <a href="javascript:clickListCollector('<%= rs.getString("collector_ip") %>','<%= rs.getString("collector_site") %>');">
                                    <%= rs.getString("collector_ip") %>                                    
                                </a>
                            </td>
                            <td class="bordes"><%= rs.getString("collector_hostname") %></td>
                            <td class="bordes"><%= rs.getString("collector_site") %></td>
                            <td class="bordes"><%= rs.getString("collector_description") %></td>
                            <td class="bordes"> <a href="javascript:openWindow('configCollector.jsp?ip=<%= rs.getString("collector_ip") %>',550,250,false,'');"> <img src="images/arrow.png" alt="" border="0"> </a> </td>
                        </tr>

                        <% i++; } %>

                    </tbody>
                </table>
            </div>

        </center>

    </body>
</html>


<%
            }else{

                out.println("no existen recolectores registrados");

            }

            try {
                rs.close();
                rs = null;
            } finally {                
                rs = null;
            }
   
%>