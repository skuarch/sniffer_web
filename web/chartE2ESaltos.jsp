<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.Fechas" %>
<%

            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");

            int tam2 = 0;
            int i2 = 0;
            String context2 = new com.websniffer.Context(request.getContextPath()).getShortContext();

            double[] data2 = null;
            String[] labels2 = null;

            String sql2 = null;
            ResultSet r2 = null;

            sql2 = "SELECT (trace_destino)campo1, MAX(trace_num_saltos)campo2 FROM traceroute WHERE (trace_fecha >= '"+ request.getParameter("fecha_inicial") +"' AND trace_fecha <= '"+ request.getParameter("fecha_final") +"') GROUP BY campo1 ORDER BY campo2 DESC;";

            r2 = new ConnectCollector(context2).select(sql2, request.getParameter("ip_remoto"));

            tam2 = (int) new ConnectPool(context2).getNumFilas(r2);

            if (tam2 > 0) {

                r2.next();

                data2 = new GraficaDatos(context2).getData(r2, "campo2", 1L);

                labels2 = new GraficaDatos(context2).getLabels(r2, "campo1");

            } else {

                data2 = new double[1];

                labels2 = new String[1];

                data2[0] = 0;

                labels2[0] = "no hay datos";

            }

            //int[] colors = {0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333};


            // Create a XYChart object of size 600 x 360 pixels
            XYChart c2 = new XYChart(750, 190, 0xF1F1F2, 0x000000, 0);
            c2.setRoundedFrame();

            // Set the plot area at (50, 20) and of size 200 x 130 pixels
            c2.setPlotArea(55, 58, 665, 110, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            c2.addText(605, 40, "(c) Copyright SisPro", "arial.ttf");

            // Add a title to the chart using 8 pts Arial Bold font
            int colorHeader2 = Integer.parseInt(new com.websniffer.Theme(context2).getTitleChartColor().substring(2), 16);
            c2.addTitle("SALTOS", "Arial Bold", 14).setBackground(colorHeader2, 0x000000, Chart.glassEffect());

            // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
            // font, with transparent background.
            //c.addLegend(80, 28, false, "Arial Bold", 10).setBackground(Chart.Transparent);
            // Add a legend box where the bottom-center is anchored to the 15 pixels above the
            // bottom-center of the chart. Use horizontal layout and 8 points Arial font.
            //LegendBox legendBox = c.addLegend(c.getWidth() / 2, c.getHeight() - 15, false,"Arial", 8);
            LegendBox legendBox2 = c2.addLegend(125, 68, false, "Arial", 8);
            legendBox2.setAlignment(Chart.BottomCenter);

            // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
            // (445566)
            legendBox2.setBackground(0xe8f0f8, 0x445566);
            legendBox2.setBackground(0xDADADA, 0x445566);

            // Use rounded corners of 5 pixel radius for the legend box
            legendBox2.setRoundedCorners(3);

            // Use line style legend key
            legendBox2.setLineStyleKey();


            // Set the x axis labels
            c2.xAxis().setLabels(labels2);


            // Draw the ticks between label positions (instead of at label positions)
            c2.xAxis().setTickOffset(0.5);

            // Set axis label style to 8pts Arial Bold
            //c.xAxis().setLabelStyle("Arial Bold", 8);
            //c.yAxis().setLabelStyle("Arial Bold", 8);
            c2.xAxis().setLabelStyle("Arial", 7, 0x006699, 0);

            // Set axis line width to 2 pixels
            c2.xAxis().setWidth(2);
            //c.yAxis().setWidth(2);

            // Add axis title
            c2.yAxis().setTitle("");

            // Add a multi-bar layer with 3 data sets
            BarLayer layer2 = c2.addBarLayer2(Chart.Side);
            layer2.addDataSet(data2, 0x000000, "Numero de saltos");

            // Set bar border to transparent. Use glass lighting effect with light direction from
            // left.
            layer2.setBorderColor(Chart.Transparent, Chart.glassEffect(Chart.NormalGlare,
                    Chart.Left));

            // Configure the bars within a group to touch each others (no gap)
            layer2.setBarGap(0.2, Chart.TouchBar);


            // Output the chart
            String chartSaltos = c2.makeSession(request, "chart2");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText2 = "onmouseover='' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText2 = "onmouseout='' ";

            // "title" attribute to show tool tip
            String toolTip2 = "title='Alarmas:{value|0}'+nombreUnidadMedida";

            // Create an image map for the chart
            String imageMap2 = c2.getHTMLImageMap("", "", showText2 + hideText2 + toolTip2);

%>
