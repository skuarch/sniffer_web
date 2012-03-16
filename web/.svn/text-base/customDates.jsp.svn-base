<%--
    Document   : personalizarFechas
    Created on : 17/11/2009, 06:13:14 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <link href="css/default.css?id=939" rel="stylesheet" type="text/css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--  calendario   -->
        <link rel="stylesheet" href="Scripts/calendario/themes/aqua.css" type="text/css">
        <link rel="stylesheet" href="Scripts/calendario/themes/layouts/small.css" type="text/css">
        <script type="text/javascript" language="javascript" src="Scripts/calendario/src/utils.js"></script>
        <script type="text/javascript" language="javascript" src="Scripts/calendario/src/calendar.js"></script>
        <script type="text/javascript" language="javascript" src="Scripts/calendario/src/calendar-setup.js"></script>
        <script type="text/javascript" language="javascript" src="Scripts/calendario/lang/calendar-sp.js"></script>
        <!--  calendario   -->

        <script language="javascript" type="text/javascript" src="Scripts/clickFechas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/cambiarFechasCerrar.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validaFechas.js"></script>

        <title>Personalizar Fechas</title>

    </head>
    <body>


        <center>

            <h3>Personalizar fechas</h3>
            Elija una fecha inicial y otra final con los calendarios de lado derecho
            <div style="width:300px; height:150px; padding-top:45px">

                <form action="" name="form" id="form" method="post">

                                    De

                                    <input type="text" name="fecha_inicial" id="fecha_inicial" readonly="readonly" onclick="javascript:clickFechas()" value="<%= request.getParameter("fecha_inicial") %>"/>

                                    <button id="trigger1" title="Calendario">...</button>
                                    <script type="text/javascript">//<![CDATA[
                                     Zapatec.Calendar.setup({
                                        firstDay          : 1,
                                        electric          : true,
                                        inputField        : "fecha_inicial",
                                        button            : "trigger1",
                                                showsTime		  : true,
                                        ifFormat          : "%Y-%m-%d %H:%M:00",
                                        daFormat          : "%Y/%m/%d %H:%M:00"

                                     });
                                    //]]></script>

                                    <br>

                                    A&nbsp;&nbsp;

                                    <input type="text" name="fecha_final" id="fecha_final"  readonly="readonly" onclick="javascript:clickFechas()" value="<%= request.getParameter("fecha_final") %>"/>

                                    <button id="trigger2" title="Calendario">...</button>
                                    <script type="text/javascript">//<![CDATA[
                                     Zapatec.Calendar.setup({
                                        firstDay          : 1,
                                        electric          : true,
                                        inputField        : "fecha_final",
                                        button            : "trigger2",
                                                showsTime		  : true,
                                        ifFormat          : "%Y-%m-%d %H:%M:00",
                                        daFormat          : "%Y/%m/%d %H:%M:00"

                                     });
                                    //]]></script>

                                    <br>
                                    <br>

                                    <input type="button" name="button7" id="button7" value="cambiar fechas y cerrar"  onclick="cambiarFechasCerrar()"/>

                    </form>

                <div id="error"></div>

            </div>
            
    </center>

    </body>
</html>
