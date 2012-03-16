<%-- 
    Document   : blockHost
    Created on : Sep 1, 2010, 10:45:32 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<% String context = new com.websniffer.Context(request.getContextPath()).getShortContext();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
                    String s = new com.websniffer.ConnectWithFilter(context).showStructures(response.getWriter());
                    String[] structures = s.split(",");
                    int other = 0;
                    int length = structures.length;
        %>

        <% if (length > 0) {%>

        <h3>Politicas</h3>
        <input type="button" name="blokeo" id="blockeo" value="crear politica" onclick="openWindow('createStructure.jsp',300,150,false,'')">
        <hr>        

        <table border="0" cellpadding="5" cellspacing="5" >
            <tbody>

                <%do {%>

                <tr>                    
                    <% for (int r = 0; (r < 4 && other < length); r++) {%>
                    <td bgcolor="#F4F4F4" align="left">
                        <img src='images/cross-shield.png' align='absmiddle' border="0" alt="">
                        <a href="javascript:openWindow('showContentOfStructure.jsp?nameOfStructure=<%=structures[other]%>',300,300,false)">
                            <b><%=structures[other]%></b>
                        </a>
                        <a href="javascript:openWindow('addinSgtructureSource.jsp?nameOfStructure=<%=structures[other]%>',600,400,false)">
                            <img src="images/funnel--plus.png" title="agregar host, segmentos al bloqueo" alt="agregar host, segmentos al bloqueo" align='absmiddle' border="0">
                        </a>
                        <a href="#">
                            <img src="images/funnel--minus.png" title="quitar host, segmentos al bloqueo" alt="quitar host, segmentos al bloqueo" align='absmiddle' border="0">
                        </a>                        
                        <a href="javascript:ajaxDeleteStructureSource('<%=structures[other]%>')">
                            <img src="images/cross-script.png" title="eliminar bloqueo" alt="eliminar bloqueo" align='absmiddle' border="0">
                        </a>
                    </td>
                    <% other++;%>
                    <% }%>
                </tr>

                <% } while (other < length);%>

            </tbody>
        </table>

        <% }%>

    </body>    

</html>
