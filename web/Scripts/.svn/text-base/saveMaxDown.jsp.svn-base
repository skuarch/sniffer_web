<%--
    Document   : saveLevelVol
    Created on : 9/04/2010, 09:46:56 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%

        String l = request.getParameter("maxDown");
        String u = request.getParameter("unidadMedida");      
        
        double unid = Long.parseLong(u);
        float lev = Float.parseFloat(l);

        double f = lev * unid;
        new com.websniffer.ConnectCollector(short_context).update("update configuracion set config_tasa_transferencia_download = " + f + "", request.getParameter("ip_remoto")); 

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/default.css?id=939" >
        <title></title>

        <script language="javascript" type="text/javascript">
            function closeWindow(){
                window.close();
            }
        </script>

    </head>
    <body onload="window.opener.handler();">

        <center>

            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(short_context).getHeaderColor()%>; width: 350px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(short_context).getBorderColorHeader()%>;"></div>
            <div style="width: 340px; height: 400px">

                <br>
                <br>
                <br>

                <b>Los datos sean guardado correctamente</b>

                <br>
                <br>
                <br>

                <input type="button" onclick="javascrit:closeWindow();" value="cerrar ventana">

            </div>

            <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(short_context).getHeaderColor()%>; width: 350px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(short_context).getBorderColorHeader()%>;"></div>

        </center>

    </body>
</html>


