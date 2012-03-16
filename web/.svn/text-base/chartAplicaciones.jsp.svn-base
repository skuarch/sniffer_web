<%@page import="ChartDirector.*,com.websniffer.*,java.sql.ResultSet" %>
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

            double[] data0 = null;
            double[] data1 = null;
            String[] labels = null;
            String sql = null;
            ResultSet r = null;

            sql = new SqlAplicaciones().getSqlAplicaciones(opcionGrafica, fecha_inicial, fecha_final, "0", "25");

            r = new ConnectCollector(short_context).select(sql, ip_remoto);

            tam = new ConnectPool(short_context).getNumFilas(r);

            if (tam > 0) {
                r.next();

                data0 = new GraficaDatos(short_context).getData(r, "campo2", unidadMedidaLong);
                data1 = new GraficaDatos(short_context).getData(r, "campo3", unidadMedidaLong);
                labels = new GraficaDatos(short_context).getLabels(r, "campo1");

            } else {

                data0 = new double[1];
                data1 = new double[1];
                labels = new String[1];

                data0[0] = 0;
                data1[0] = 0;
                labels[0] = "no hay datos";

            }

            //int[] colors = {0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333};

            // Create a XYChart object of size 600 x 360 pixels
            XYChart c = new XYChart(790, 390, 0xF1F1F2, 0x000000, 0);
            c.setRoundedFrame();

            // Set the plot area at (50, 20) and of size 200 x 130 pixels
            c.setPlotArea(75, 58, 700, 215, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            c.addText(655, 40, "(c) Copyright SisPro", "arial.ttf");


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


            // Add a title to the chart using 8 pts Arial Bold font
            if (remoto.isEmpty()) {
                //c.addTitle("PUERTOS " + opcionGrafica, "Arial Bold", 14).setBackground(0x54E434, 0x000000, Chart.glassEffect());
                c.addTitle("APLICACIONES " + opcionGrafica, "Arial Bold", 14).setBackground(0xC3D9E1, 0x000000, Chart.glassEffect());
            } else {
                c.addTitle("APLICACIONES " + opcionGrafica + " [ " + ip_remoto + " ]", "Arial Bold", 14).setBackground(0xC3D9E1, 0x000000, Chart.glassEffect());
            }

            // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
            // font, with transparent background.
           // c.addLegend(80, 28, false, "Arial Bold", 10).setBackground(Chart.Transparent);

            // Set the x axis labels
            c.xAxis().setLabels(labels);



            // Draw the ticks between label positions (instead of at label positions)
            c.xAxis().setTickOffset(0.5);

            // Set axis label style to 8pts Arial Bold
            //c.xAxis().setLabelStyle("Arial Bold", 8);
            //c.yAxis().setLabelStyle("Arial Bold", 8);
            c.xAxis().setLabelStyle("Arial", 8, 0x006699, 30);

            // Set axis line width to 2 pixels
            c.xAxis().setWidth(2);
            //c.yAxis().setWidth(2);

            // Add axis title
            c.yAxis().setTitle(nombreUnidadMedida);

            // Add a multi-bar layer with 3 data sets
            BarLayer layer = c.addBarLayer2(Chart.Side);
            layer.addDataSet(data0, 0xff6f6f, "Volumen salida");
            layer.addDataSet(data1, 0x6ad83a, "Volumen entrada");
            //layer.addDataSet(data2, 0xff8800, "Volumen total");

            // Set bar border to transparent. Use glass lighting effect with light direction from
            // left.
            layer.setBorderColor(Chart.Transparent, Chart.glassEffect(Chart.NormalGlare,
                    Chart.Left));

            // Configure the bars within a group to touch each others (no gap)
            layer.setBarGap(0.2, Chart.TouchBar);


            // Output the chart
            String chartBarrasAplicaciones = c.makeSession(request, "chart1");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText = "onmouseover='muestraInfoGrafica(\"{dataSetName}: {value} \" );' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText = "onmouseout='noMuestraInfoGrafica();' ";

            // "title" attribute to show tool tip
            String toolTip = "title='Volumen:{value|0}'+nombreUnidadMedida";

            //String variables = "paginaGrafica=" + paginaGrafica + "&dataSet={dataSetName}&tipoGrafica=" + tipoGrafica + "&opcionGrafica=" + opcionGrafica + "&tiempoGrafica=" + tiempoGrafica + "&fecha_inicial=" + fecha_inicial + "&fecha_final=" + fecha_final + "&unidadMedida=" + unidadMedida + "&nombreUnidadMedida=" + nombreUnidadMedida + "&label={xLabel}',400,600)";

            // Create an image map for the chart
            //String imageMap1 = c.getHTMLImageMap("", "", showText + hideText + toolTip);
            String imageMap1 = c.getHTMLImageMap("javascript:openWindow('detalleAplicaciones.jsp?label={xLabel}", "',750,450,true,'&')", showText + hideText + toolTip);

%>
<html>

    <head>
        <title></title>

        <%
                    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
                    response.setDateHeader("Expires", 0); //prevent caching at the proxy server
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="expires" content="0">
    </head>

    <body>

        <div align="right" class="barVolumen">
            
            volumen en <%=nombreUnidadMedida%>, entrada: <%= new com.websniffer.Redondear().redondear(volIn[0],2)%> salida: <%= new com.websniffer.Redondear().redondear(volOut[0],2)%> total: <%= new com.websniffer.Redondear().redondear(volTot[0],2)%>

        </div>

        <img src='<%=response.encodeURL("getchart.jsp?" + chartBarrasAplicaciones)%>' usemap="#map1" border="0" alt="">

        <map name="map1">
            <%=imageMap1%>
            <h1></h1>
        </map>        

            <div class="buttons" align="right">
                <a href="javascript:openWindow('Scripts/xlsAplicacionesChart.jsp',400,270,true,'?');">
                    <img src="images/excel.png" alt=""/>
                    Excel
                </a>

                <a href="#" onclick="javascript:jGrowMessages('<b>Creando Grafica interactiva</b>');">
                    <img src="images/hand.png" alt=""/>
                    Clic
                </a>
            </div>


            
            

            <div id="detalleInfo"></div>

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
                r.close();
                rsVol.close();
            } finally {
                c = null;
                rsVol = null;
            }
            System.gc();


%>


