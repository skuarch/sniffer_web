<%-- 
    Document   : index
    Created on : 11/03/2010, 11:08:44 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.servlet.http.HttpSession"%>
<%@page session="true" %>

<%
    //HttpSession ses = request.getSession();
    //ses.invalidate();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>
    <head>

        <link rel="icon" type="image/png" href="images/ico.png" />
        <link href="css/index.css" rel="stylesheet" type="text/css">

        <script language="javascript" type="text/javascript" src="Scripts/focoCampo.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validaLogin.js"></script>
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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>[ WebSniffer ] </title>
    </head>
    <body onload="javascript:focoCampo('usuario');">

        <log:info category="index.jsp"> started app web </log:info>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <center>


            <div class="login">

                <br />

                <form action="Authenticate" method="post" name="form" id="form">
                    <table width="157" border="0" cellspacing="1" cellpadding="1" class="tablaLogin">
                        <tr>
                            <td align="left">
                                Usuario
                            </td>
                            <td>
                                <input name="usuario" type="text" id="usuario" value="" size="15" maxlength="10" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                Password
                            </td>
                            <td>
                                <input name="password" type="password" id="password" value="" size="15" maxlength="10" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                <input type="button" name="Submit" id="button" value="ingresar"  onclick="javascript:validaLogin()"/>
                            </td>
                        </tr>
                    </table>
                    <div id="errorLogin" class="errorLogin">

                        <%
                                    
                                    if (request.getParameter("error") != null && request.getParameter("error").equals("1")) {
                                        out.println("usuario o contraseña son incorrectos");
                                   }

                                    if (request.getParameter("error") != null && request.getParameter("error").equals("2")) {
                                        out.println("sin sesion iniciada");
                                   }
                        %>

                    </div>
                </form>
            </div>

            <div class="indexFooter">
                Todos los derechos reservados de autor SisPro®©
                <br />
                General DataComm de Mexico
                <br />
                Analisis de trafico de red
                <br />
                <br />
                Este sitio web esta validado por
                <br />
                <img src="images/valid1.gif" alt="validacion W3C" width="88" height="31" />
                <img src="images/valida2.gif" alt="validacion W3C" width="88" height="31" />
            </div>

        </center>


    </body>
</html>
