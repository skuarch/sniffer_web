<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log"%>
<%@page session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<% String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext();%>

<html>
    <head>

        <link rel="icon" type="image/png" href="images/ico.png" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%
                    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
                    response.setDateHeader("Expires", 0); //prevent caching at the proxy server
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="expires" content="0">

        <%
                    HttpSession ses = request.getSession();
                    String user = (String) ses.getAttribute("user");
                    if (user == null) {                        
                        //response.sendRedirect("index.jsp?error=2");
                    }
        %>

        <link rel="stylesheet" type="text/css" href="css/default.css?id=939" >
        <link rel="stylesheet" type="text/css" href="css/menu.css?id=939">
        <link rel="stylesheet" type="text/css" href="css/jquery.jgrowl.css">
        <link rel="stylesheet" type="text/css" href="css/Button.css">
        <link rel="stylesheet" type="text/css" href="css/table.css">

        <script language="javascript" type="text/javascript" src="Scripts/fechas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/unidad.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/variablesGlobales.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/setterGlobal.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getterGlobal.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/getAllVariables.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/handler.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeStatus.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeDates.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeMeasure.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeOption.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeCollector.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeUnid.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/sortFilter.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/jquery-1.3.2.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/jquery.jgrowl.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/tipo.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxGraficas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/graficaRutas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/celdas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/disableSelectCollectors.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/jGrowMessages.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeSelects.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validaRecolector.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/dateFormat.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/tiempo.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/fechas.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/openWindow.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/openModalWindow.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/antiCache.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeOnLoad.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/clickListCollector.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/clicks.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/muestraInfoGrafica.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxMuestraPuerto.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validateConversaciones.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validateNavegacion.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/servidores.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxDetalleAlarm.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxE2E.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/changeE2E.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ejecutaE2E.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/disableFormSelects.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/categorias.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/unblockDomains.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxUnBlockDomain.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxUnBlockUrl.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/blockDomains.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/unBlockUrls.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxBlockDomain.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/blockUrls.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxBlockUrl.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxDeleteStructureSource.js"></script>
        

        <title><%= new com.websniffer.Theme(short_context).getWindowTitle()%></title>

        <% com.websniffer.Theme theme = new com.websniffer.Theme(short_context);  %>

    </head>
    <body onload="javascript:handler();changeOnLoad();">


        <!-- container -->
        <div style="margin: auto; width: 950px; vertical-align: middle;">

            <!-- header -->
            <div align="center" style="background-color: <%= theme.getHeaderColor()%>; width: 950px; height: 50px; margin: auto; border-bottom: 1px solid <%= theme.getBorderColorHeader()%>; border-left: 1px solid <%= theme.getBorderColorHeader()%>; border-right: 1px solid <%= theme.getBorderColorHeader()%>;">

                <div id="logo">
                    <h1>
                        <a href="javascript:jGrowTimeMessages('<%= theme.getApplicationName()%> <br> <%= theme.getProjecName()%>',2000);">
                            <b>
                                <%= theme.getApplicationName()%>
                            </b>
                        </a>
                    </h1>
                    <%= theme.getProjecName()%>
                </div>

                <div style="color:#fff; font-size: 17px; vertical-align: top; position: absolute; margin-top: 13px;margin-left: 145px; display: inline">
                        <center>
                            <b>Global Controller</b>
                        </center>
                    </div>

                <img src="images/logo.png" alt="" style="margin-left: 380px; margin-top: 2px">

            </div> <!-- END header -->


            <!-- option bar -->
            <div align="left" style="float: right; width: 810px; height: 30px ; margin-bottom: 5px; margin-top: 5px">

                <form name="formSelects" id="formSelects" action="" style="padding: 0 0 0 0; margin: 0 0 0 0; display: inline;">


                    <%@include  file="Scripts/selectCollector.jsp" %>
                    

                    <select name="selectMeasure" id="selectMeasure" onchange="javascript:changeMeasure(this.value);">
                        <option value="Bytes">Bytes</option>
                        <option value="KiloBytes">KiloBytes</option>
                        <option value="MegaBytes">MegaBytes</option>
                        <option value="GigaBytes">GigaBytes</option>
                    </select>


                    <select name="selectDates" id="selectDates" onchange="javascript:changeDates(this.value);">
                        <option value="HOY">hoy</option>
                        <option value="ULTIMA HORA">ultima hora</option>
                        <option value="ULTIMAS DOS HORAS">ultimas 2 horas</option>
                        <option value="AYER">ayer</option>
                        <option value="7 DIAS">7 dias</option>
                        <option value="15 DIAS">15 dias</option>
                        <option value="PERSONALIZADO" onclick="javascript:changeDates(this.value);">personalizado</option>
                    </select>


                    <select name="selectOptions" id="selectOptions" onchange="javascript:changeOption(this.value);">
                        <option value="GLOBAL">Global</option>
                        <option value="TCP">TCP</option>
                        <option value="UDP">UDP</option>
                        <option value="PAM">PAM</option>
                        <option value="HTTP">HTTP</option>
                    </select>

                    <input type="button" value="aplicar" id="aplicar" name="aplicar" onclick="javascript:changeSelects();">

                    <input type="button" value="salir" id="salir" name="salir" onclick="javascript:location.href='index.jsp'">

                </form>

            </div> <!-- END option bar -->

            <!-- principal -->
            <div  align="center" style="width: 810px; float: right; clear: right; height: 520px; overflow: auto">
                <div id="contenedor1"></div>
                &nbsp;
                <br>
            </div><!-- END principal -->


            <!-- menu -->
            <div align="left" style="width: 135px; height: 555px; vertical-align: top; float: left; position: absolute; margin-top: 5px">
                <a href="javascript:tipo('RECOLECTORES')" onclick="jGrowMessages('<b>Seccion</b> <br> Recolectores');" class="button"><span class="list">Recolectores</span></a>
                <a href="javascript:tipo('VOLUMEN')" onclick="jGrowMessages('<b>Seccion</b> <br> Volumen');" class="button"><span class="add">Volumen</span></a>
                <a href="javascript:tipo('PUERTOS')" onclick="jGrowMessages('<b>Seccion</b> <br> Puertos');" class="button"><span class="ports">Puertos</span></a>
                <a href="javascript:tipo('IPS')" onclick="jGrowMessages('<b>Seccion</b> <br> Direcciones IP');" class="button"><span class="host">IP's</span></a>
                <a href="javascript:validateNavegacion();tipo('NAVEGACION')" onclick="jGrowMessages('<b>Seccion</b> <br> Navegacion Web');" class="button"><span class="navigation">Navegación</span></a>
                <a href="javascript:tipo('RENDIMIENTO')" onclick="jGrowMessages('<b>Seccion</b> <br> Througput');" class="button"><span class="download">Throughput</span></a>
                <!--<a href="javascript:tipo('E2E')" onclick="jGrowMessages('<b>Seccion</b> <br> End to End');" class="button"><span class="e2e">End to End</span></a>-->
                <a href="javascript:tipo('APLICACIONES')" onclick="jGrowMessages('<b>Seccion</b> <br> Monitoreo de Aplicaciones');" class="button"><span class="app">Aplicaciones</span></a>
                <a href="javascript:tipo('SEGMENTOS')" onclick="jGrowMessages('<b>Seccion</b> <br> Segmentos de red');" class="button"><span class="segments">Segmentos</span></a>
                <a href="javascript:tipo('CONEXIONES')" onclick="jGrowMessages('<b>Seccion</b> <br> Conexiones');" class="button"><span class="conections">Conexiones</span></a>
                <a href="javascript:validateConversaciones();tipo('CONVERSACIONES')" onclick="jGrowMessages('<b>Seccion</b> <br> Conversaciones');" class="button"><span class="conversations">Conversaciones</span></a>
                <a href="javascript:tipo('ALARMAS')" onclick="jGrowMessages('<b>Seccion</b> <br> Alarmas');" class="button"><span class="alarm">Alarmas</span></a>
                <!--<a href="javascript:tipo('SERVIDORES')" onclick="jGrowMessages('<b>Seccion</b> <br> Servidores Monitoreados');" class="button"><span class="server">Servidores</span></a>-->
                <a href="javascript:tipo('INDICADORES')" onclick="jGrowMessages('<b>Seccion</b> <br> Indicadores');" class="button"><span class="indicators">Indicadores</span></a>
                <!--<a href="javascript:tipo('FILTRADO')" onclick="jGrowMessages('<b>Seccion</b> <br> Filtrado');" class="button"><span class="filter">Filtrado</span></a>
                <a href="javascript:tipo('BLOQUEO HOST')" onclick="jGrowMessages('<b>Seccion</b> <br> Bloqueo de host');" class="button"><span class="filter">Bloqueo</span></a> -->
                <!--<a href="javascript:tipo('REPORTE')" onclick="jGrowMessages('<b>Seccion</b> <br> Reportes');" class="button"><span class="filter">Reporte</span></a>-->
                <!--<a href="http://192.168.252.72/end2end/" onclick="jGrowMessages('<b>Seccion</b> <br> End to End');" class="button"><span class="e2e">End to End</span></a>-->
            </div> <!-- END menu -->

            <!-- estado -->
            <div id="estado" align="center" style="clear: both; float: inherit;margin-bottom: auto;margin-left: auto;margin-right: auto; background-color:<%= theme.getColorStatusBar()%>;  border:1px solid <%= theme.getBorderColorStatusBar()%>;">
                tipo [ <b><span id="barraTipoGrafica"></span></b> ]
                tiempo [ <b><span id="barraTiempoGrafica"></span></b> ]
                opcion [ <b><span id="barraOpcionGrafica"></span></b> ]
                medida [ <b><span id="barraNombreUnidadMedida"></span></b> ]
                inicio [ <b><span id="barraFechaInicial"></span></b> ]
                fin [ <b><span id="barraFechaFinal"></span></b> ]                
            </div><!-- END estado -->

            <!-- footer -->
            <div align="center" style="clear: both; float: inherit;margin-bottom: auto;margin-left: auto;margin-right: auto; background-color: <%= theme.getFooterColor()%>;  border:1px solid <%= theme.getBorderFooterColor()%>; margin-top: 5px;">
                <b><%= new com.websniffer.Theme(short_context).getProjecName()%></b>
            </div><!-- END footer -->

            <div style="float: inherit; margin-top: 5px;">
                <%= theme.getCopyright()%>
            </div>

        </div> <!-- END container -->

    </body>
</html>
