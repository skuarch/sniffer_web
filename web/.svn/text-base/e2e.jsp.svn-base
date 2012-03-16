<%-- 
    Document   : e2e.jsp
    Created on : 8/02/2010, 05:47:16 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ChartDirector.*,com.websniffer.*,java.sql.ResultSet" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/default.css?id=939" rel="stylesheet" type="text/css">
        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxE2E.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeE2E.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ejecutaE2E.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/sortFilter.js"> </script>

        <title>SysPro End 2 End</title>
    </head>
    <body>

        <div class="bordes" style="width:783px; height:417px; margin:5px; overflow:auto" >

            <center>

                <br>
                <br>

                <form action="" id="formE2E" name="formE2E">

                    Origen
                    <select id="origen" name="origen">

                        <%
                                    String short_context = new Context(request.getContextPath()).getShortContext();
                                    String sql = new SqlRemotos().getSqlRemotosIp();
                                    ResultSet r1 = new ConnectPool(short_context).select(sql);
                                    while (r1.next()) {

                                        out.println("<option value='" + r1.getString("collector_ip") + "'>" + r1.getString("collector_ip") + "</option>");

                                    }

                        %>


                    </select>

                    Destino
                    <select id="destino" name="destino" onchange="changeE2E(document.formE2E.destino.value)">
                        <option value="">Selecciona un destino</option>
                        <option value="personalizar">personalizar</option>
                        <%
                                    String sql2 = new SqlRemotos().getSqlRemotosIp();
                                    ResultSet r2 = new ConnectPool(short_context).select(sql2);
                                    while (r2.next()) {

                                        out.println("<option value='" + r2.getString("collector_ip") + "'>" + r2.getString("collector_ip") + "</option>");

                                    }

                        %>
                    </select>

                    <input type="text" id="destinoPersonalizado" disabled>

                    <input type="button" value="Ejecutar" onclick="javascript:ejecutaE2E();" id="ejecutar">

                </form>
                <br>

                <div style="width:730px; height:335px; overflow:auto" id="contenedor1">


                    <br>
                    <br>
                    <br>
                    Seleccione un origen y un destino y presione el boton ejecutar
                    
                </div>

            </center>

        </div>

    </body>
</html>
<%
            try {
                r1.close();
                r2.close();
            } finally {
                r1 = null;
                r2 = null;
            }
%>