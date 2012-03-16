<%-- 
    Document   : showContentOfStructure
    Created on : Sep 2, 2010, 12:19:24 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contenido bloqueo</title>
    </head>
    <body>

        contenido del bloqueo <%= request.getParameter("nameOfStructure")%>

        <br>

        <%
                    String[] content = new com.websniffer.ConnectWithFilter(shortContext).getContent(request.getParameter("nameOfStructure"), response.getWriter()).split(",") ;
        %>

        <% for(int i =0; i < content.length; i++){  %>

            <%=content[i] %>
            <br>

        <%}%>

    </body>
</html>
