<%@page import="ChartDirector.*,com.websniffer.ConnectCollector,com.websniffer.Fechas,java.sql.ResultSet" %>
<%

            String sqlIcmp = "SELECT SUM(ind_min_vol_tot_gral)campo1,SUM(ind_min_bytes_icmp)campo2 FROM indicadores_min WHERE (ind_min_id >= " + new Fechas().fechaId(request.getParameter("fecha_inicial")) + " AND ind_min_id <= " + new Fechas().fechaId(request.getParameter("fecha_final")) + ");";


            ResultSet rIcmp = new ConnectCollector(new com.websniffer.Context(request.getContextPath()).getShortContext()).select(sqlIcmp, request.getParameter("ip_remoto"));
            double valueIcmp = 0;

            try {
                rIcmp.next();
                valueIcmp = rIcmp.getDouble("campo2") * 100 / rIcmp.getLong("campo1");
            } catch (Exception e) {
                System.err.println(e);
            }


            // Create an AngularMeter object of size 200 x 115 pixels, with silver background
            // color, black border, 2 pixel 3D border border and rounded corners
            AngularMeter mIcmp = new AngularMeter(200, 110, Chart.silverColor(), 0x000000, 1);
            mIcmp.setRoundedFrame();

            // Set the meter center at (100, 100), with radius 85 pixels, and span from -90 to
            // +90 degress (semi-circle)
            mIcmp.setMeter(100, 100, 85, -90, 90);

            // Meter scale is 0 - 100, with major tick every 20 units, minor tick every 10 units,
            // and micro tick every 5 units
            mIcmp.setScale(0, 100, 20, 10, 5);

            // Set 0 - 60 as green (66FF66) zone
            mIcmp.addZone(0, 1, 0, 85, 0x66ff66);
            // Set 60 - 80 as yellow (FFFF33) zone
            mIcmp.addZone(1, 3, 0, 85, 0xffff33);
            // Set 80 - 100 as red (FF6666) zone
            mIcmp.addZone(3, 100, 0, 85, 0xff6666);

            // Add a text label centered at (100, 60) with 12 pts Arial Bold font
            mIcmp.addText(100, 60, "Icmp", "Arial Bold", 12, Chart.TextColor, Chart.Center);

            // Add a text box at the top right corner of the meter showing the value formatted to
            // 2 decimal places, using white text on a black background, and with 1 pixel 3D
            // depressed border
            mIcmp.addText(10, 5, mIcmp.formatValue(valueIcmp, "0"), "Arial", 7, 0x000000).setBackground(0xCDCDCD, 0, 0);
            mIcmp.addText(30, 10, "Porciento", "Arial Bold", 7, Chart.TextColor, Chart.Left);


            // Add a semi-transparent blue (40666699) pointer with black border at the specified
            // value
            mIcmp.addPointer(valueIcmp, 0x40666699, 0x000000);

            // Output the chart
            String chart1URLIcmp = mIcmp.makeSession(request, "chart3");

            //liberando memoria
            try {
                rIcmp.close();
                sqlIcmp = null;
                valueIcmp = 0;
            } finally {
                rIcmp = null;
            }

%>
