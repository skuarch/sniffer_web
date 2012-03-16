<%@page contentType="application/vnd.ms-excel" import="ChartDirector.*,com.websniffer.ConnectCollector,com.websniffer.ConnectPool,com.websniffer.SqlAplicaciones,java.sql.*,java.io.*" %>

<%
            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");

            String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
            String opcionGrafica = request.getParameter("opcionGrafica");
            String tipoGrafica = request.getParameter("tipoGrafica");
            String tiempoGrafica = request.getParameter("tiempoGrafica");
            boolean clic = Boolean.parseBoolean(request.getParameter("clic"));
            String refrescar = request.getParameter("refrescar");
            String fecha_inicial = request.getParameter("fecha_inicial");
            String fecha_final = request.getParameter("fecha_final");
            String nombreUnidadMedida = request.getParameter("nombreUnidadMedida");
            String unidadMedida = request.getParameter("unidadMedida");
            long unidadMedidaLong = Long.valueOf(unidadMedida).longValue();
            String remoto = request.getParameter("remoto");
            String ip_remoto = request.getParameter("ip_remoto");
            int tam = 0;
            String aplicacion = request.getParameter("label");
            String sql = null;
            ResultSet r = null;
            int i = 0;

            sql = new SqlAplicaciones().getDetalleAplicaciones(opcionGrafica, fecha_inicial, fecha_final, "0", "25",aplicacion,"<br>");

            r = new ConnectCollector(shortContext).select(sql, ip_remoto);


            //out.println(sql);

            tam = new ConnectPool(shortContext).getNumFilas(r);

            if(tam >0){

            r.next();

%>

<% response.setHeader("Content-Disposition", "attachment; filename=\"ReporteSisPro.xls\"");%>

        <meta http-equiv="application/vnd.ms-excel" content="application/vnd.ms-excel; charset=UTF-8">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<html>

    <head>


        <%
                response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
                response.setHeader("Pragma", "no-cache"); //HTTP 1.0
                response.setDateHeader("Expires", 0); //prevent caching at the proxy server
%>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>

    </head>

    <body>

        <table border="0" align="center" class="filterable" id="tabla">

            <thead>
                <tr>
                    <th bgcolor="#E9E9E9" class="bordes">Fecha</th>
                    <th bgcolor="#E9E9E9" class="bordes">Aplicacion</th>
                    <th bgcolor="#E9E9E9" class="bordes">IP Origen</th>
                    <th bgcolor="#E9E9E9" class="bordes">IP Aplicacion</th>
                    <th bgcolor="#E9E9E9" class="bordes">Puerto Aplicacion</th>
                    <th bgcolor="#E9E9E9" class="bordes">Vol in</th>
                    <th bgcolor="#E9E9E9" class="bordes">Vol out</th>
                    <th bgcolor="#E9E9E9" class="bordes">Vol Total</th>
                </tr>
            </thead>

            <tbody>

                <% do{ %>

                <tr onmouseover="pintaCelda(this)" onmouseout="regresaCelda(this)">
                    <td align="center" class="bordes"><%= r.getDate("campo0") + " " + r.getTime("campo0") %></td>
                    <td align="center" class="bordes"><%= r.getString("campo7") %></td>
                    <td align="center" class="bordes"><%= r.getString("campo1") %></td>
                    <td align="center" class="bordes"><%= r.getString("campo2") %></td>
                    <td align="center" class="bordes"><%= r.getString("campo3") %></td>
                    <td align="center" class="bordes"><%= r.getString("campo4") %></td>
                    <td align="center" class="bordes"><%= r.getString("campo5") %></td>
                    <td align="center" class="bordes"><%= r.getString("campo6") %></td>
                </tr>

                <% }while(r.next()); %>

            </tbody>

        </table>


    </body>

</html>

<%

    }else{

        out.println("no existen mas datos");

    }

    opcionGrafica = null;
    tiempoGrafica = null;
    fecha_inicial = null;
    fecha_final = null;
    refrescar = null;
    nombreUnidadMedida = null;
    unidadMedida = null;
    sql = null;
    unidadMedidaLong = 0;
    tam = 0;
    //r.close();
    //marca = 0;
    System.gc();

%>

