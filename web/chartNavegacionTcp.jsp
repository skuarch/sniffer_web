<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.SqlNavegacionTcp,com.websniffer.sqlVolTotal,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet" %>
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
<%

            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");

            int tam = 0;
            int i = 0;

            double[] data0 = null;
            String[] labels = null;
            double[] data1 = null;
            String sql = null;
            ResultSet r = null;

            sql = new SqlNavegacionTcp().getSqlNavegacionTcp(opcionGrafica, fecha_inicial, fecha_final, "0", "24");

            r = new ConnectCollector(shortContext).select(sql, ip_remoto);

            tam = new ConnectPool(shortContext).getNumFilas(r);

            if (tam > 0) {

                r.next();

                data0 = new GraficaDatos(shortContext).getData(r, "campo2", 1L);
                data1 = new GraficaDatos(shortContext).getData(r, "campo3", 1L);
                labels = new GraficaDatos(shortContext).getLabels(r, "campo1");

                /*double sum2 = 0;
                for (int e = 0; e < data0.length - 1; e++) {
                    //sum0 +=data0[e];
                    //sum1 +=data1[e];
                    sum2 += data0[e];
                }

                sum2 = (int) sum2;
                int num = data0.length - 1;
                labels[num] = "otros";
                data0[num] = (int) 100 - sum2;*/

            } else {

                data0 = new double[1];
                data1 = new double[1];
                labels = new String[1];

                data0[0] = 0;
                data1[0] = 0;
                labels[0] = "no hay datos";

            }

            int[] colors = {0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600, 0xcc6600};


            // Create a XYChart object of size 600 x 360 pixels
            XYChart c = new XYChart(790, 390, 0xF1F1F2, 0x000000, 0);
            c.setRoundedFrame();

            // Set the plot area at (50, 20) and of size 200 x 130 pixels
            c.setPlotArea(80, 58, 645, 260, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            c.addText(580, 40, "(c) Copyright SisPro", "arial.ttf");

            // Add a title to the chart using 8 pts Arial Bold font
            int colorHeader = Integer.parseInt(new com.websniffer.Theme(shortContext).getTitleChartColor().substring(2), 16);
            c.addTitle("NAVEGACIÓN " + opcionGrafica + " [ " + ip_remoto + " ]", "Arial Bold", 14).setBackground(colorHeader, 0x000000, Chart.glassEffect());




            // Set the labels on the x axis.
            c.xAxis().setLabels(labels);

            // Add a title to the primary (left) y axis
            c.yAxis().setTitle("Conexiones");

            // Set the axis, label and title colors for the primary y axis to red (0xc00000) to
            // match the first data set
            c.yAxis().setColors(0x000000, 0x000000, 0x000000);

            // Add a title to the secondary (right) y axis
            c.yAxis2().setTitle("Porcentaje");

            // set the axis, label and title colors for the primary y axis to green (0x008000) to
            // match the second data set
            c.yAxis2().setColors(0xc00000, 0xc00000, 0xc00000);

            // Add a line layer to for the first data set using red (0xc00000) color with a line
            // width to 3 pixels
            LineLayer lineLayer = c.addLineLayer(data1, 0xff0000);
            lineLayer.setLineWidth(1);

            //diamantes en la linea
            lineLayer.addDataSet(data1, 0xeecc00, "Union").setDataSymbol(Chart.DiamondSymbol, 11);


            // tool tip for the line layer
            lineLayer.setHTMLImageMap("", "", "title='ip: {xLabel} Conexiones: {value}'");


            // Add a legend box where the bottom-center is anchored to the 15 pixels above the
            // bottom-center of the chart. Use horizontal layout and 8 points Arial font.
            LegendBox legendBox = c.addLegend(300, 68, false, "Arial", 8);
            legendBox.setAlignment(Chart.BottomCenter);

            // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
            // (445566)
            //legendBox.setBackground(0xe8f0f8, 0x445566);
            legendBox.setBackground(0xDADADA, 0x445566);

            // Use rounded corners of 5 pixel radius for the legend box
            legendBox.setRoundedCorners(3);

            // Use line style legend key
            legendBox.setLineStyleKey();

            // Add the legend key for the mark line
            legendBox.addKey("Conexiones", 0xff0000, 1);
            legendBox.addKey("% Volumen", 0xcc6600, 7);


            // Add a horizontal mark line to the chart at y = 40
            //double marca = intUmb / unidadMedidaLong;
            //Mark mark =c.yAxis2().addMark(marca, -1, "");
            //mark.setLineWidth(1);

            // Set the mark line to purple (880088) dash line. Use white (ffffff) for the mark
            // label.
            //mark.setMarkColor(c.dashLineColor(0x880088), 0x880088);

            // Put the mark label at the left side of the mark, with a purple (880088)
            // background.
            //mark.setAlignment(Chart.Center);
            //mark.setBackground(0x880088);
            //mark.setBackground(Chart.Transparent);


            // Add a bar layer to for the second data set using green (0x00C000) color. Bind the
            // second data set to the secondary (right) y axis
            //BarLayer barLayer = c.addBarLayer(data1, 0x333333);
            BarLayer barLayer = c.addBarLayer3(data0, colors);
            barLayer.setBorderColor(Chart.Transparent, Chart.glassEffect(Chart.NormalGlare, Chart.Left));

            barLayer.setUseYAxis2();

            // Use 8 points Arial rotated by 90 degrees as the x-axis label font
            c.xAxis().setLabelStyle("Arial", 7, Chart.TextColor, 45);

            // tool tip for the bar layer
            barLayer.setHTMLImageMap("", "", "title='ip {xLabel}:  |  {value}%'" + nombreUnidadMedida);

            // Output the chart
            String chartBarrasPuertos = c.makeSession(request, "chart1");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText = "onmouseover='muestraInfoGrafica(\"ip: {value} \" );' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText = "onmouseout='noMuestraInfoGrafica();' ";

            // "title" attribute to show tool tip
            String toolTip = "title='ip:{value|0}'";

            String variables = "paginaGrafica=&dataSet={dataSetName}&tipoGrafica=" + tipoGrafica + "&opcionGrafica=" + opcionGrafica + "&tiempoGrafica=" + tiempoGrafica + "&fecha_inicial=" + fecha_inicial + "&fecha_final=" + fecha_final + "&unidadMedida=" + unidadMedida + "&nombreUnidadMedida=" + nombreUnidadMedida + "&ip_remoto=" + ip_remoto + "&label={xLabel} ',500,600)";

            // Create an image map for the chart
            String imageMap1 = c.getHTMLImageMap("javascript:openWindow('detalleNavegacionTcp.jsp?label={xLabel}", "',750,450,true,'')", showText + hideText + toolTip);
%>
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

    <body>

        <div align="right" class="barVolumen">

            volumen en <%=nombreUnidadMedida%>, entrada: <%= new com.websniffer.Redondear().redondear(volIn[0], 2)%> salida: <%= new com.websniffer.Redondear().redondear(volOut[0], 2)%> total: <%= new com.websniffer.Redondear().redondear(volTot[0], 2)%>

        </div>

        <img src='<%=response.encodeURL("getchart.jsp?" + chartBarrasPuertos)%>' usemap="#map1" border="0" alt="">

        <map name="map1">
            <%=imageMap1%>
            <h1></h1>
        </map>


        <div align="center">

            <br>

            <div class="buttons" align="right">

                <a href="javascript:openWindow('Scripts/xlsNavegacionChartTcp.jsp',400,270,true,'?');">
                    <img src="images/excel.png" alt=""/>
                    Excel
                </a>

                <a href="#">
                    <img src="images/hand.png" alt=""/>
                    Clic
                </a>

                <a href="javascript:handler();" onclick="javascript:jGrowMessages('<b>Refrescando Grafica</b>');">
                    <img src="images/refresh.png" alt=""/>
                    Refrescar
                </a>

            </div>            

        </div>


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
                labels = null;
                tam = 0;
                variables = null;
                r.close();

            } finally {

                c = null;

            }

            System.gc();
%>
