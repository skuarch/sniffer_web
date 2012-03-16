<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.SqlVolumen,com.websniffer.sqlVolTotal,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.CriticLevel" %>
<%@include file="catchVariables.jsp" %>

<%

    String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
    ResultSet rsVol = null;    
    String sqlVol = new sqlVolTotal().getSqlVolTotal(opcionGrafica, fecha_inicial, fecha_final);
    rsVol = new ConnectCollector(shortContext).select(sqlVol, ip_remoto);
    rsVol.next();

    double[] volIn = new GraficaDatos(shortContext).getData(rsVol, "campo1", unidadMedidaLong);
    double[] volOut = new GraficaDatos(shortContext).getData(rsVol, "campo2", unidadMedidaLong);
    double[] volTot = new GraficaDatos(shortContext).getData(rsVol, "campo3", unidadMedidaLong);

%>

<div align="right" class="barVolumen">

    volumen en <%=nombreUnidadMedida%>, entrada: <%= new com.websniffer.Redondear().redondear(volIn[0],2)%> salida: <%= new com.websniffer.Redondear().redondear(volOut[0],2)%> total: <%= new com.websniffer.Redondear().redondear(volTot[0],2)%>

</div>

<%
            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");

            
            int tam = 0;
            double[] data0 = null;
            double[] data1 = null;
            double[] data2 = null;
            String[] labels = null;
            String sql = null;
            ResultSet r = null;

            sql = new SqlVolumen().getSqlVolumen(opcionGrafica, fecha_inicial, fecha_final, "0", "0");

            r = new ConnectCollector(shortContext).select(sql, ip_remoto);

            tam = (int) new ConnectPool(shortContext).getNumFilas(r);

            if (tam > 0) {

                r.next();

                data0 = new GraficaDatos(shortContext).getData(r, "campo1", unidadMedidaLong);
                data1 = new GraficaDatos(shortContext).getData(r, "campo2", unidadMedidaLong);
                data2 = new GraficaDatos(shortContext).getData(r, "campo3", unidadMedidaLong);
                labels = new GraficaDatos(shortContext).getLabelsFechas(r, "campo4");

            } else {

                data0 = new double[1];
                data1 = new double[1];
                data2 = new double[1];
                labels = new String[1];

                data0[0] = 0;
                data1[0] = 0;
                data2[0] = 0;
                labels[0] = "no hay datos";

            }

            // Create an XYChart object of size 600 x 300 pixels, with a light blue (EEEEFF)
            // background, black border, 1 pxiel 3D border effect and rounded corners


            XYChart c = new XYChart(789, 389, 0xF1F1F2, 0x000000, 0);
            c.setRoundedFrame();

            // Set the plotarea at (55, 58) and of size 520 x 195 pixels, with white background.
            // Turn on both horizontal and vertical grid lines with light grey color (0xcccccc)
            c.setPlotArea(85, 58, 680, 245, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            c.addText(645, 40, "(c) Copyright SisPro", "arial.ttf");

            // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 9 pts
            // Arial Bold font. Set the background and border color to Transparent.
            //c.addLegend(90, 27, false, "Arial Bold", 9).setBackground(Chart.Transparent);

            // Add a legend box where the bottom-center is anchored to the 15 pixels above the
            // bottom-center of the chart. Use horizontal layout and 8 points Arial font.
            //LegendBox legendBox = c.addLegend(c.getWidth() / 2, c.getHeight() - 15, false,"Arial", 8);
            LegendBox legendBox = c.addLegend(300, 68, false, "Arial", 8);
            legendBox.setAlignment(Chart.BottomCenter);

            // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
            // (445566)
            legendBox.setBackground(0xe8f0f8, 0x445566);
            legendBox.setBackground(0xDADADA, 0x445566);

            // Use rounded corners of 5 pixel radius for the legend box
            legendBox.setRoundedCorners(3);

            // Use line style legend key
            legendBox.setLineStyleKey();

            // Add a title box to the chart using 15 pts Times Bold Italic font, on a light blue
            // (CCCCFF) background with glass effect. white (0xffffff) on a dark red (0x800000)
            // background, with a 1 pixel 3D border.
            int colorHeader = Integer.parseInt(new com.websniffer.Theme(shortContext).getTitleChartColor().substring(2), 16);
            c.addTitle("VOLUMEN " + opcionGrafica + " [ " + ip_remoto + " ]", "Arial Bold", 14).setBackground(colorHeader, 0x000000, Chart.glassEffect());


            // Add a title to the y axis
            c.yAxis().setTitle(request.getParameter("nombreUnidadMedida"));

            // Use 8 points Arial rotated by 90 degrees as the x-axis label font
            c.xAxis().setLabelStyle("Arial", 8, Chart.TextColor, 50);

            // Add a horizontal mark line to the chart at y = 40
            //double marca = intUmb / unidadMedidaLong;
            //Mark mark = c.yAxis().addMark(new CriticLevel(ip_remoto, shortContext).getLevelVol() / unidadMedidaLong, -1, " ");
            //mark.setLineWidth(1);

            // Set the mark line to purple (880088) dash line. Use white (ffffff) for the mark
            // label.
            //mark.setMarkColor(c.dashLineColor(0x880088), 0x000000);

            // Put the mark label at the left side of the mark, with a purple (880088)
            // background.
            //mark.setAlignment(Chart.Center);
            //mark.setBackground(0x880088);
            //mark.setBackground(Chart.Transparent);

            // Set the labels on the x axis.
            c.xAxis().setLabels(labels);

            // Display 1 out of 3 labels on the x-axis.
            if (tiempoGrafica.equalsIgnoreCase("30 DIAS") || tiempoGrafica.equalsIgnoreCase("7 DIAS") || tiempoGrafica.equalsIgnoreCase("30 DIAS") || tiempoGrafica.equalsIgnoreCase("PERSONALIZADO")) {
                clic = false;

            }
            c.xAxis().setLabelStep(tam / 30 + 1);

            // Add a title to the x axis
            c.xAxis().setTitle(" ");

            // Add a line layer to the chart
            LineLayer layer = c.addLineLayer2();

            // Set the default line width to 2 pixels
            layer.setLineWidth(1);

            // Add the three data sets to the line layer. For demo purpose, we use a dash line
            // color for the last line
            layer.addDataSet(data0, 0xff0000, "Volumen de salida");
            layer.addDataSet(data1, 0x008800, "Volumen de entrada");
            layer.addDataSet(data2, 0x3333ff, "Volumen total");
            //layer.addDataSet(data2, c.dashLineColor(0x3333ff, Chart.DashLine), "Server #3");

            // Create the image and save it in a temporary location
            String chart1URL = c.makeSession(request, "chart1");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText = "onmouseover='muestraInfoGrafica(\"Fecha: {xLabel} {dataSetName} {value} \" );' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText = "onmouseout='noMuestraInfoGrafica();' ";

            // "title" attribute to show tool tip
            String toolTip = "title='{xLabel} Vol:{value|0} " + nombreUnidadMedida + "'";

            // Create an image map for the chart            
            String imageMap1 = c.getHTMLImageMap("javascript:openWindow('detalleMinuto.jsp?minuto={xLabel}", "',600,600,true,'&')", showText + hideText + toolTip);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>


        <%
                    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
                    response.setDateHeader("Expires", 0); //prevent caching at the proxy server
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache; charset=UTF-8">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="expires" content="0">

        <title></title>

    </head>

    <body style="margin:5px 0px 0px 5px; width: 789px; height: 389px">

        <img src='<%=response.encodeURL("getchart.jsp?" + chart1URL)%>' usemap="#map1" border="0" alt="">

        <div align="center">            

            <br>

            <div class="buttons" align="right">

                <!--
                <div class="buttons" align="right">
                    <a href="javascript:openWindow('levelVolumen.jsp',400,270,true,'?');">
                        <img src="images/cog.png" alt=""/>
                        Configurar
                    </a>
                </div>
                -->

                <a href="javascript:openWindow('Scripts/xlsVolumenChart.jsp',400,270,true,'?');">
                    <img src="images/excel.png" alt=""/>
                    Excel
                </a>

                <a href="javascript:clicks()" onclick="javascript:jGrowMessages('<b>Creando Grafica interactiva</b>');">
                    <img src="images/hand.png" alt=""/>
                    Clic
                </a>

                <a href="javascript:handler();" onclick="javascript:jGrowMessages('<b>Refrescando Grafica</b>');">
                    <img src="images/refresh.png" alt=""/>
                    Refrescar
                </a>                

            </div>            

            <div id="detalleInfo">

            </div>

        </div>

        <map name="map1">
            <% if (clic) {%>
            <%=imageMap1%>
            <% }%>            
        </map>

    </body>

</html>

<%

            try {
                opcionGrafica = null;
                tiempoGrafica = null;
                fecha_inicial = null;
                fecha_final = null;
                refrescar = null;
                nombreUnidadMedida = null;
                unidadMedida = null;
                sql = null;
                unidadMedidaLong = 0;
                data0 = null;
                data1 = null;
                data2 = null;
                labels = null;
                tam = 0;
                r.close();
                c = null;
                chart1URL = null;
                rsVol.close();
            } finally {
                r = null;
                rsVol = null;
            }


            System.gc();


%>

