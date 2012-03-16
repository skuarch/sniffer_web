<%-- 
    Document   : graficaIndicadores
    Created on : 21/12/2009, 06:35:31 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="catchVariables.jsp" %>
<%@page import="ChartDirector.*,java.sql.ResultSet" %>

<%@include file="graficaIndicadorArp.jsp" %>
<%@include file="graficaIndicadorSnmp.jsp" %>
<%@include file="graficaIndicadorIcmp.jsp" %>
<%@include file="graficaIndicadorPop.jsp" %>
<%@include file="graficaIndicadorSmtp.jsp" %>
<%@include file="graficaIndicadorFtp.jsp" %>
<%@include file="graficaIndicadorTelnet.jsp" %>
<%@include file="graficaIndicadorSsh.jsp" %>
<%@include file="graficaIndicadorIp4.jsp" %>
<%@include file="graficaIndicadorIp6.jsp" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>

    </head>

    <body>

        <div class="bordes" style="width:783px; height:490px; margin:5px; overflow:auto" >

            <table border="0" align="center" width="761px" cellpadding="2" cellspacing="2">

                <tbody>

                    <tr>
                        
                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLArp)%>' alt=""> </td>
                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLSnmp)%>' alt=""> </td>
                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLIcmp)%>' alt=""> </td>                        
                        
                    </tr>

                    <tr>

                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLPop3)%>' alt=""> </td>
                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLSmtp)%>' alt=""> </td>
                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLFtp)%>' alt=""> </td>

                    </tr>

                    <tr>

                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLTelnet)%>' alt=""> </td>
                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLSsh)%>' alt=""> </td>

                    </tr>


                    <tr>

                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLIp4)%>' alt=""> </td>                        

                        <td align="center"> <img src='<%=response.encodeURL("getchart.jsp?"+chart1URLIp6)%>' alt=""> </td>
                    </tr>


                </tbody>

            </table>

        </div>

    </body>
</html>


<%
    System.gc();
%>