<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.Fechas" %>
<%

            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");

            int tam = 0;
            int i = 0;
            String context = new com.websniffer.Context(request.getContextPath()).getShortContext();

            double[] data = null;
            String[] labels = null;

            String sql = null;
            ResultSet r = null;

            //sql = "SELECT COUNT(*)campo1, CONCAT(\"Nivel \" ,alarma_nivel)campo2 FROM alarma_min WHERE (id_alarma_min >= " + new Fechas().fechaId(request.getParameter("fecha_inicial")) + " AND id_alarma_min <= " + new Fechas().fechaId(request.getParameter("fecha_final")) + ") AND alarma_nivel <> 1 GROUP BY alarma_nivel;";
            sql = "SELECT COUNT(*)campo1, CONCAT(\"Nivel \" ,alarma_throughput_nivel)campo2 FROM alarma_throughput_min WHERE (id_alarma_throughput_min >= " + new Fechas().fechaId(request.getParameter("fecha_inicial")) + " AND id_alarma_throughput_min <= " + new Fechas().fechaId(request.getParameter("fecha_final")) + ") AND alarma_throughput_nivel <> 1 GROUP BY alarma_throughput_nivel;";

            r = new ConnectCollector(context).select(sql, request.getParameter("ip_remoto"));

            tam = (int) new ConnectPool(context).getNumFilas(r);


            if (tam > 0) {

                r.next();

                data = new GraficaDatos(context).getData(r, "campo1", 1L);

                labels = new GraficaDatos(context).getLabels(r, "campo2");

            } else {

                data = new double[1];

                labels = new String[1];

                data[0] = 0;

                labels[0] = "no hay datos";

            }

            //int[] colors = {0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333};


            // Create a XYChart object of size 600 x 360 pixels
            XYChart c = new XYChart(380, 190, 0xF1F1F2, 0x000000, 0);
            c.setRoundedFrame();

            // Set the plot area at (50, 20) and of size 200 x 130 pixels
            c.setPlotArea(45, 58, 320, 110, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            c.addText(655, 40, "(c) Copyright SisPro", "arial.ttf");

            // Add a title to the chart using 8 pts Arial Bold font
            int colorHeader = Integer.parseInt(new com.websniffer.Theme(context).getTitleChartColor().substring(2), 16);
            c.addTitle("ALARMAS", "Arial Bold", 14).setBackground(colorHeader, 0x000000, Chart.glassEffect());

            // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
            // font, with transparent background.
            //c.addLegend(80, 28, false, "Arial Bold", 10).setBackground(Chart.Transparent);
            // Add a legend box where the bottom-center is anchored to the 15 pixels above the
            // bottom-center of the chart. Use horizontal layout and 8 points Arial font.
            //LegendBox legendBox = c.addLegend(c.getWidth() / 2, c.getHeight() - 15, false,"Arial", 8);
            LegendBox legendBox = c.addLegend(120, 68, false, "Arial", 8);
            legendBox.setAlignment(Chart.BottomCenter);

            // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
            // (445566)
            legendBox.setBackground(0xe8f0f8, 0x445566);
            legendBox.setBackground(0xDADADA, 0x445566);

            // Use rounded corners of 5 pixel radius for the legend box
            legendBox.setRoundedCorners(3);

            // Use line style legend key
            legendBox.setLineStyleKey();


            // Set the x axis labels
            c.xAxis().setLabels(labels);


            // Draw the ticks between label positions (instead of at label positions)
            c.xAxis().setTickOffset(0.5);

            // Set axis label style to 8pts Arial Bold
            //c.xAxis().setLabelStyle("Arial Bold", 8);
            //c.yAxis().setLabelStyle("Arial Bold", 8);
            c.xAxis().setLabelStyle("Arial", 7, 0x006699, 0);

            // Set axis line width to 2 pixels
            c.xAxis().setWidth(2);
            //c.yAxis().setWidth(2);

            // Add axis title
            c.yAxis().setTitle("");

            // Add a multi-bar layer with 3 data sets
            BarLayer layer = c.addBarLayer2(Chart.Side);
            layer.addDataSet(data, 0x000000, "Número de alarmas");

            // Set bar border to transparent. Use glass lighting effect with light direction from
            // left.
            layer.setBorderColor(Chart.Transparent, Chart.glassEffect(Chart.NormalGlare,
                    Chart.Left));

            // Configure the bars within a group to touch each others (no gap)
            layer.setBarGap(0.2, Chart.TouchBar);


            // Output the chart
            String chartBarrasConversaciones = c.makeSession(request, "chart1");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText = "onmouseover='' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText = "onmouseout='' ";

            // "title" attribute to show tool tip
            String toolTip = "title='Alarmas:{value|0}'+nombreUnidadMedida";

            // Create an image map for the chart
            String imageMap1 = c.getHTMLImageMap("", "", showText + hideText + toolTip);

%>
