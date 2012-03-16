<%-- 
    Document   : config1.jsp
    Created on : 29/03/2010, 05:39:33 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet, com.websniffer.ConnectPool"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            ResultSet rs = null;
            String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();

            rs = new ConnectPool(shortContext).select("select * from collectors");

            if(new ConnectPool(shortContext).getNumFilas(rs) > 0){
                int i = 1;                
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css?id=939" >
        <title>Configuracion</title>
    </head>
    <body>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 680px; height: 20px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;">
            Configuracion paso 1 <b>Selecciona el recolector a configurar</b>
        </div>

        <div style="width: 680px; height: 330px; margin:0 auto 0 auto; overflow: auto; background-color: #f4f4f4">

            <input type="checkbox" id="all" name="all">seleccionar / deseleccionar
            <br>

            <% while (rs.next()) {%>

                <%= i  %>
                <input id="chk<%= i  %>" type="checkbox" name="chk<%= i  %>" value="<%= rs.getString("collector_ip")  %>">
                <%= rs.getString("collector_site")  %>
                <br>

            <% i++; } %>
        </div>

            <center>                
                cancelar | siguiente                
            </center>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 680px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        <% } else {

            out.println("No existen recolectores registrados");

        } %>

    </body>
</html>

<%
    try{
        rs.close();
    }finally{
        rs = null;
    }

%>
