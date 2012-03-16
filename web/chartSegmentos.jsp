<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.SqlSegmentos,com.websniffer.sqlVolTotal,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet" %>
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
            //double[] data0 = null;
            //double[] data1 = null;
            double[] data2 = null;
            String[] labels = null;
            String sql = null;
            ResultSet r = null;

            sql = new SqlSegmentos().getSqlSegmentos(opcionGrafica, fecha_inicial, fecha_final, "0", "24");

            r = new ConnectCollector(shortContext).select(sql, ip_remoto);

            tam = (int) new ConnectPool(shortContext).getNumFilas(r);

            if (tam > 0) {

                r.next();

               // data0 = new GraficaDatos(shortContext).getData(r, "campo2", 1L);
                //data1 = new GraficaDatos(shortContext).getData(r, "campo3", 1L);
                data2 = new GraficaDatos(shortContext).getData(r, "campo4", 1L);
                labels = new GraficaDatos(shortContext).getLabels(r, "campo1");

                /*double sum2 = 0;
                for (int e = 0; e < data2.length - 1; e++) {
                    //sum0 +=data0[e];
                    //sum1 +=data1[e];
                    sum2 += data2[e];
                }

                sum2 = (int) sum2;
                int num = data2.length - 1;
                labels[num] = "otros";
                data2[num] = (int) 100 - sum2;*/


            } else {

               // data0 = new double[1];
               // data1 = new double[1];
                data2 = new double[1];
                labels = new String[1];

                //data0[0] = 0;
                //data1[0] = 0;
                data2[0] = 0;
                labels[0] = "no hay datos";

            }


            int[] colors = {0xcc33fa, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333};


            // Create a XYChart object of size 600 x 360 pixels
            XYChart c = new XYChart(790, 390, 0xF1F1F2, 0x000000, 0);
            c.setRoundedFrame();

            // Set the plot area at (50, 20) and of size 200 x 130 pixels
            c.setPlotArea(45, 58, 720, 270, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            c.addText(640, 40, "(c) Copyright SisPro", "arial.ttf");

            // Add a title to the chart using 8 pts Arial Bold font
            int colorHeader = Integer.parseInt(new com.websniffer.Theme(shortContext).getTitleChartColor().substring(2), 16);
            c.addTitle("SEGMENTOS " + opcionGrafica + " [ " + ip_remoto + " ] ", "Arial Bold", 14).setBackground(colorHeader, 0x000000, Chart.glassEffect());

            // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
            // font, with transparent background.
            //c.addLegend(80, 28, false, "Arial Bold", 10).setBackground(Chart.Transparent);
            LegendBox legendBox = c.addLegend(320, 68, false, "Arial", 8);
            legendBox.setAlignment(Chart.BottomCenter);

            // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
            // (445566)
            legendBox.setBackground(0xe8f0f8, 0x445566);
            legendBox.setBackground(0xDADADA, 0x445566);

            // Use rounded corners of 5 pixel radius for the legend box
            legendBox.setRoundedCorners(3);

            // Use line style legend key
            legendBox.setLineStyleKey();

            // Add the legend key for the mark line
            //legendBox.addKey("Conexiones", 0xff0000, 1);

            // Set the x axis labels
            c.xAxis().setLabels(labels);



            // Draw the ticks between label positions (instead of at label positions)
            c.xAxis().setTickOffset(0.5);

            // Set axis label style to 8pts Arial Bold
            //c.xAxis().setLabelStyle("Arial Bold", 8);
            //c.yAxis().setLabelStyle("Arial Bold", 8);
            c.xAxis().setLabelStyle("Arial", 8, Chart.TextColor, 30);

            // Set axis line width to 2 pixels
            c.xAxis().setWidth(2);
            //c.yAxis().setWidth(2);

            // Add axis title
            c.yAxis().setTitle("Porcentaje");

            // Add a multi-bar layer with 3 data sets
            BarLayer layer = c.addBarLayer2(Chart.Side);
            //layer.addDataSet(data0, 0x000000, "% Volmen entrada");
            //layer.addDataSet(data1, 0x00ff00, "% Volumen salida");
            layer.addDataSet(data2, 0xcc33fa, "% Volumen total");

            // Set bar border to transparent. Use glass lighting effect with light direction from
            // left.
            layer.setBorderColor(Chart.Transparent, Chart.glassEffect(Chart.NormalGlare,
                    Chart.Left));

            // Configure the bars within a group to touch each others (no gap)
            layer.setBarGap(0.2, Chart.TouchBar);


            // Output the chart
            String chartBarrasPuertos = c.makeSession(request, "chart1");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText = "onmouseover='muestraInfoGrafica(\"Volumen:{value} \" );' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText = "onmouseout='noMuestraInfoGrafica();' ";

            // "title" attribute to show tool tip
            String toolTip = "title='Porcentaje:{value|0}'+nombreUnidadMedida";

            String variables = "paginaGrafica=&dataSet={dataSetName}&tipoGrafica=" + tipoGrafica + "&opcionGrafica=" + opcionGrafica + "&tiempoGrafica=" + tiempoGrafica + "&fecha_inicial=" + fecha_inicial + "&fecha_final=" + fecha_final + "&unidadMedida=" + unidadMedida + "&nombreUnidadMedida=" + nombreUnidadMedida + "',400,600)";

            // Create an image map for the chart
            String imageMap1 = c.getHTMLImageMap("", "", showText + hideText + toolTip);
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

        <map name="map1">
            <%=imageMap1%>
            <h1></h1>
        </map>

        <div align="right" class="barVolumen">

            volumen en <%=nombreUnidadMedida%>, entrada: <%= new com.websniffer.Redondear().redondear(volIn[0],2)%> salida: <%= new com.websniffer.Redondear().redondear(volOut[0],2)%> total: <%= new com.websniffer.Redondear().redondear(volTot[0],2)%>

        </div>

        <img src='<%=response.encodeURL("getchart.jsp?" + chartBarrasPuertos)%>' usemap="#map1" border="0" alt="">

        <div align="center">


            <br>

            <div class="buttons" align="right">

                <a href="javascript:openWindow('Scripts/xlsSegmentosChart.jsp',400,270,true,'?');">
                    <img src="images/excel.png" alt=""/>
                    Excel
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
                //data0 = null;
                //data1 = null;
                data2 = null;
                labels = null;
                tam = 0;
                variables = null;
                r.close();
                rsVol.close();
            } finally {
                c = null;
                rsVol = null;
            }

            System.gc();

%>