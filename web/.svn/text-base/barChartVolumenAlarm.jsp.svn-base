<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.Fechas" %>

<%

            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");

            String unidadMedida = request.getParameter("unidadMedida");
            long unidadMedidaLong = Long.valueOf(unidadMedida).longValue();
            String nombreUnidadMedida = request.getParameter("nombreUnidadMedida");
            int tam0 = 0;
            double[] data2 = null;
            String[] labels0 = null;

            String sql0 = null;
            ResultSet r0 = null;

            //segun julio dice que el thoughput no se acumula
            sql0 = "SELECT SUM(throughput_min_tot)campo1,('throughput total')campo2 FROM throughput_min WHERE ( id_throughput_min >= " + new Fechas().fechaId(request.getParameter("fecha_inicial")) + "  AND id_throughput_min <= " + new Fechas().fechaId(request.getParameter("fecha_final")) + " )UNION ALL (SELECT SUM(alarma_throughput_sobrepaso)campo1,('throughput sobrepaso')campo2 FROM alarma_throughput_min WHERE ( id_alarma_throughput_min >= " + new Fechas().fechaId(request.getParameter("fecha_inicial")) + "  AND id_alarma_throughput_min <= " + new Fechas().fechaId(request.getParameter("fecha_final")) + " ));";
            

            r0 = new ConnectCollector(new com.websniffer.Context(request.getContextPath()).getShortContext()).select(sql0, request.getParameter("ip_remoto"));

            tam0 = (int) new ConnectPool(new com.websniffer.Context(request.getContextPath()).getShortContext()).getNumFilas(r0);


            if (tam0 > 0) {

                r0.next();

                data2 = new GraficaDatos(new com.websniffer.Context(request.getContextPath()).getShortContext()).getData(r0, "campo1", unidadMedidaLong);

                labels0 = new GraficaDatos(new com.websniffer.Context(request.getContextPath()).getShortContext()).getLabels(r0, "campo2");

            } else {

                data2 = new double[1];

                labels0 = new String[1];

                data2[0] = 0;

                labels0[0] = "no hay datos";

            }

            //int[] colors = {0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333, 0x333333};


            // Create a XYChart object of size 600 x 360 pixels
            XYChart c0 = new XYChart(380, 190, 0xF1F1F2, 0x000000, 0);
            c0.setRoundedFrame();

            // Set the plot area at (50, 20) and of size 200 x 130 pixels
            c0.setPlotArea(45, 58, 320, 110, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            c0.addText(655, 40, "(c) Copyright SisPro", "arial.ttf");

            // Add a title to the chart using 8 pts Arial Bold font
            int colorHeader0 = Integer.parseInt(new com.websniffer.Theme(new com.websniffer.Context(request.getContextPath()).getShortContext()).getTitleChartColor().substring(2), 16);
            c0.addTitle("THROUGHPUT", "Arial Bold", 14).setBackground(colorHeader0, 0x000000, Chart.glassEffect());

            // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
            // font, with transparent background.
            //c.addLegend(80, 28, false, "Arial Bold", 10).setBackground(Chart.Transparent);
            // Add a legend box where the bottom-center is anchored to the 15 pixels above the
            // bottom-center of the chart. Use horizontal layout and 8 points Arial font.
            //LegendBox legendBox = c.addLegend(c.getWidth() / 2, c.getHeight() - 15, false,"Arial", 8);
            LegendBox legendBox0 = c0.addLegend(120, 68, false, "Arial", 8);
            legendBox0.setAlignment(Chart.BottomCenter);

            // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
            // (445566)
            legendBox0.setBackground(0xe8f0f8, 0x445566);
            legendBox0.setBackground(0xDADADA, 0x445566);

            // Use rounded corners of 5 pixel radius for the legend box
            legendBox0.setRoundedCorners(3);

            // Use line style legend key
            legendBox0.setLineStyleKey();


            // Set the x axis labels
            c0.xAxis().setLabels(labels0);


            // Draw the ticks between label positions (instead of at label positions)
            c0.xAxis().setTickOffset(0.5);

            // Set axis label style to 8pts Arial Bold
            //c.xAxis().setLabelStyle("Arial Bold", 8);
            //c.yAxis().setLabelStyle("Arial Bold", 8);
            c0.xAxis().setLabelStyle("Arial", 7, 0x006699, 0);

            // Set axis line width to 2 pixels
            c0.xAxis().setWidth(2);
            //c.yAxis().setWidth(2);

            // Add axis title
            c0.yAxis().setTitle("");

            // Add a multi-bar layer with 3 data sets
            BarLayer layer0 = c0.addBarLayer2(Chart.Side);
            layer0.addDataSet(data2, 0xff66cc, "Throughput " + nombreUnidadMedida);

            // Set bar border to transparent. Use glass lighting effect with light direction from
            // left.
            layer0.setBorderColor(Chart.Transparent, Chart.glassEffect(Chart.NormalGlare,
                    Chart.Left));

            // Configure the bars within a group to touch each others (no gap)
            layer0.setBarGap(0.2, Chart.TouchBar);


            // Output the chart
            String chartBarrasConversaciones2 = c0.makeSession(request, "chart2");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText0 = "onmouseover='' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText0 = "onmouseout='' ";

            // "title" attribute to show tool tip
            String toolTip0 = "title='Throughput:{value|0}'+nombreUnidadMedida";

            // Create an image map for the chart
            String imageMap0 = c0.getHTMLImageMap("", "", showText0 + hideText0 + toolTip0);

%>
