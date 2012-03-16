<%@page import="ChartDirector.*,com.websniffer.ConnectPool,com.websniffer.SqlVolumen,com.websniffer.ConnectCollector,com.websniffer.GraficaDatos,java.sql.ResultSet,com.websniffer.Fechas" %>


<%
            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");
            
            int tam3 = 0;
            double[] data3 = null;
            String[] labels3 = null;
            String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext();
            String sql3 = null;
            ResultSet r3 = null;

            sql3 = "SELECT (alarma_throughput_fecha)campo1,(alarma_throughput_nivel)campo2 FROM alarma_throughput_min WHERE (id_alarma_throughput_min >= " + new Fechas().fechaId(request.getParameter("fecha_inicial")) + " AND id_alarma_throughput_min <= " + new Fechas().fechaId(request.getParameter("fecha_final")) + ") ORDER BY alarma_throughput_fecha ASC;";

            r3 = new ConnectCollector(short_context).select(sql3, request.getParameter("ip_remoto"));

            tam3 = (int) new ConnectPool(short_context).getNumFilas(r3);

            if (tam3 > 0) {

                r3.next();

                data3 = new GraficaDatos(short_context).getData(r3, "campo2", 1L);
                labels3 = new GraficaDatos(short_context).getLabelsFechas(r3, "campo1");

            } else {

                data3 = new double[1];
                labels3 = new String[1];

                data3[0] = 0;
                labels3[0] = "no hay datos";

            }

            // Create an XYChart object of size 600 x 300 pixels, with a light blue (EEEEFF)
            // background, black border, 1 pxiel 3D border effect and rounded corners
            XYChart c3 = new XYChart(763, 210, 0xF1F1F2, 0x000000, 0);
            c3.setRoundedFrame();

            // Set the plotarea at (55, 58) and of size 520 x 195 pixels, with white background.
            // Turn on both horizontal and vertical grid lines with light grey color (0xcccccc)
            c3.setPlotArea(85, 48, 650, 90, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

            

            // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 9 pts
            // Arial Bold font. Set the background and border color to Transparent.
            //c.addLegend(90, 27, false, "Arial Bold", 9).setBackground(Chart.Transparent);

            // Add a legend box where the bottom-center is anchored to the 15 pixels above the
            // bottom-center of the chart. Use horizontal layout and 8 points Arial font.
            //LegendBox legendBox = c.addLegend(c.getWidth() / 2, c.getHeight() - 15, false,"Arial", 8);
            LegendBox legendBox3 = c3.addLegend(150, 65, false, "Arial", 8);
            legendBox3.setAlignment(Chart.BottomCenter);

            // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
            // (445566)
            legendBox3.setBackground(0xe8f0f8, 0x445566);
            legendBox3.setBackground(0xDADADA, 0x445566);

            // Use rounded corners of 5 pixel radius for the legend box
            legendBox3.setRoundedCorners(3);

            // Use line style legend key
            legendBox3.setLineStyleKey();

            // Add a title box to the chart using 15 pts Times Bold Italic font, on a light blue
            // (CCCCFF) background with glass effect. white (0xffffff) on a dark red (0x800000)
            // background, with a 1 pixel 3D border.
            int colorHeader3 = Integer.parseInt(new com.websniffer.Theme(short_context).getTitleChartColor().substring(2),16);
            c3.addTitle("HISTOGRAMA DE ALARMAS", "Arial Bold", 14).setBackground(colorHeader3, 0x000000, Chart.glassEffect());


            // Add a title to the y axis
            c3.yAxis().setTitle("Nivel de alarma");

            // Use 8 points Arial rotated by 90 degrees as the x-axis label font
            c3.xAxis().setLabelStyle("Arial", 8, Chart.TextColor, 50);

            // Add a horizontal mark line to the chart at y = 40
            //double marca = intUmb / unidadMedidaLong;
            //Mark mark = c.yAxis().addMark(marca, -1, "Nivel Critico");
            //mark.setLineWidth(1);

            // Set the mark line to purple (880088) dash line. Use white (ffffff) for the mark
            // label.
            //mark.setMarkColor(c.dashLineColor(0x880088), 0xffffff);

            // Put the mark label at the left side of the mark, with a purple (880088)
            // background.
            //mark.setAlignment(Chart.Center);
            //mark.setBackground(0x880088);
            //mark.setBackground(Chart.Transparent);

            // Set the labels on the x axis.
            c3.xAxis().setLabels(labels3);

            // Display 1 out of 3 labels on the x-axis.
            
            c3.xAxis().setLabelStep(tam3 / 30 + 1);

            // Add a title to the x axis
            //c3.xAxis().setTitle("Fechas");

            // Add a line layer to the chart
            LineLayer layer3 = c3.addLineLayer2();

            // Set the default line width to 2 pixels
            layer3.setLineWidth(1);

            // Add the three data sets to the line layer. For demo purpose, we use a dash line
            // color for the last line
            layer3.addDataSet(data3, 0xff0000, "Nivel de alarma");
            
            //layer.addDataSet(data2, c.dashLineColor(0x3333ff, Chart.DashLine), "Server #3");

            // Create the image and save it in a temporary location
            String chart1URL3 = c3.makeSession(request, "chart3");

            // Client side Javascript to show detail information "onmouseover"
            //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
            String showText3 = "onmouseover='muestraInfoGrafica(\"Fecha: {xLabel} {dataSetName} {value} \" );' ";

            // Client side Javascript to hide detail information "onmouseout"
            String hideText3 = "onmouseout='noMuestraInfoGrafica();' ";

            // "title" attribute to show tool tip
            String toolTip3 = "title='{xLabel} Vol:{value|0}'";

            // Create an image map for the chart
            String imageMap3 = c3.getHTMLImageMap("", "", showText3 + hideText3 + toolTip3);

           

%>

