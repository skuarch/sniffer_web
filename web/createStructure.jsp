<%-- 
    Document   : createStructure
    Created on : Sep 1, 2010, 12:39:09 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css?id=939" >
        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxCreateStructureSource.js"></script>
        <title>Crear bloqueo</title>
    </head>
    <body>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 260px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        <center>
            <b>Crear bloqueo</b>
            <br>
            Nombre del bloqueo
            <form action="" name="formStructure" id="formStructure">
                <input type="text" id="nameOfStructure" maxlength="15" size="15">
                <input type="button" value="crear" onclick="javascript:ajaxCreateStructureSource(document.formStructure.nameOfStructure.value);">
            </form>

        </center>
        
        <br>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 260px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>
    </body>
</html>
