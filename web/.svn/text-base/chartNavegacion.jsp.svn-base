<%--
    Document   : graficaBarrasNavegacion
    Created on : 23/12/2009, 05:46:33 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <% if(request.getParameter("opcionGrafica").equalsIgnoreCase("TCP")){ %>
            <%@include file="chartNavegacionTcp.jsp" %>
        <% }else{  %>
            <%@include file="chartNavegacionHttp.jsp" %>
        <% }%>

    </body>
</html>