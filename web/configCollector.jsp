<%-- 
    Document   : configCollector
    Created on : 30/03/2010, 11:43:18 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet, com.websniffer.ConnectPool"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();

            if(request.getParameter("save") != null){

                    new ConnectPool(shortContext).update("UPDATE collectors SET collector_site = '"+request.getParameter("collector_site")+"' , collector_hostname = '"+request.getParameter("collector_hostname")+"' , collector_description = '"+request.getParameter("collector_description")+"'  WHERE collector_ip = '"+request.getParameter("ip")+"' ; ");

            }

            String ip = request.getParameter("ip");
            ResultSet rs = null;

            rs = new ConnectPool(shortContext).select("select * from collectors where collector_ip = '" + ip + "'");
            rs.next();

%>

<html>
    <head>

        <link rel="stylesheet" type="text/css" href="css/default.css?id=939" >

        <base target="_self" />

        <script language="javascript" type="text/javascript" src="Scripts/validateConfigCollector.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/reloadTableCollector.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuracion recolector</title>

    </head>
    <body>

        <br>        

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 480px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        <center>

            configuracion del recollector <%= request.getParameter("ip")%>

            <br>
            <br>
            <br>
            <form action="" method="get" id="formConfigCollector" name="formConfigCollector" target="_self">
                <table border="0" align="center" cellpadding="1" cellspacing="1">

                    <tbody>

                        <tr>
                            <td> hostname </td>
                            <td> <input type="text" id="collector_hostname" name="collector_hostname" value="<%= rs.getString("collector_hostname") %>" size="35" maxlength="15"> </td>
                        </tr>

                        <tr>
                            <td> sitio </td>
                            <td> <input type="text" id="collector_site" name="collector_site" value="<%= rs.getString("collector_site") %>" size="35" maxlength="35"> </td>
                        </tr>

                        <tr>
                            <td> descripcion </td>
                            <td> <input type="text" id="collector_description" name="collector_description" value="<%= rs.getString("collector_description") %>" size="35" maxlength="50"> </td>
                        </tr>

                        <tr>
                            <td> </td>
                            <td> <input type="button" value="guardar" onclick="javascript:validateConfigCollector()"> </td>
                        </tr>

                    </tbody>
                </table>

                            <input type="hidden" name="ip" id="ip" value="<%=ip %>">
                            <input type="hidden" name="save" id="save" value="1">
            </form>
            <br>

            <%
                if(request.getParameter("save") != null){
                    out.println("los cambios se guardaron con exito");
                    out.println("<script language=\"javascript\" type=\"text/javascrip\" >reloadTableCollector();</script>");
                }
            %>

        </center>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 480px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

    </body>
</html>

<%
    try{
        rs.close();
    }finally{
        rs = null;
    }
%>
