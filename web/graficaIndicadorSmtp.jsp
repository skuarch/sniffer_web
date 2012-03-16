<%@page import="ChartDirector.*,com.websniffer.ConnectCollector,com.websniffer.Fechas,java.sql.ResultSet" %>
<%

            String sqlSmtp = "SELECT SUM(ind_min_vol_tot_gral)campo1,SUM(ind_min_bytes_Smtp)campo2 FROM indicadores_min WHERE (ind_min_id >= " + new Fechas().fechaId(request.getParameter("fecha_inicial")) + " AND ind_min_id <= " + new Fechas().fechaId(request.getParameter("fecha_final")) + ");";


            ResultSet rSmtp = new ConnectCollector(new com.websniffer.Context(request.getContextPath()).getShortContext()).select(sqlSmtp, request.getParameter("ip_remoto"));
            double valueSmtp = 0;

            try {
                rSmtp.next();
                valueSmtp = rSmtp.getDouble("campo2") * 100 / rSmtp.getLong("campo1");
            } catch (Exception e) {
                System.err.println(e);
            }


            // Create an AngularMeter object of size 200 x 115 pixels, with silver background
            // color, black border, 2 pixel 3D border border and rounded corners
            AngularMeter mSmtp = new AngularMeter(200, 110, Chart.silverColor(), 0x000000, 1);
            mSmtp.setRoundedFrame();

            // Set the meter center at (100, 100), with radius 85 pixels, and span from -90 to
            // +90 degress (semi-circle)
            mSmtp.setMeter(100, 100, 85, -90, 90);

            // Meter scale is 0 - 100, with major tick every 20 units, minor tick every 10 units,
            // and micro tick every 5 units
            mSmtp.setScale(0, 100, 20, 10, 5);

            // Set 0 - 60 as green (66FF66) zone
            mSmtp.addZone(0, 20, 0, 85, 0x66ff66);
            // Set 60 - 80 as yellow (FFFF33) zone
            mSmtp.addZone(20, 30, 0, 85, 0xffff33);
            // Set 80 - 100 as red (FF6666) zone
            mSmtp.addZone(30, 100, 0, 85, 0xff6666);

            // Add a text label centered at (100, 60) with 12 pts Arial Bold font
            mSmtp.addText(100, 60, "Smtp", "Arial Bold", 12, Chart.TextColor, Chart.Center);

            // Add a text box at the top right corner of the meter showing the value formatted to
            // 2 decimal places, using white text on a black background, and with 1 pixel 3D
            // depressed border
            mSmtp.addText(10, 5, mSmtp.formatValue(valueSmtp, "0"), "Arial", 7, 0x000000).setBackground(0xCDCDCD, 0, 0);
            mSmtp.addText(30, 10, "Porciento", "Arial Bold", 7, Chart.TextColor, Chart.Left);


            // Add a semi-transparent blue (40666699) pointer with black border at the specified
            // value
            mSmtp.addPointer(valueSmtp, 0x40666699, 0x000000);

            // Output the chart
            String chart1URLSmtp = mSmtp.makeSession(request, "chart6");

            //liberando memoria
            try {
                rSmtp.close();
                sqlSmtp = null;
                valueSmtp = 0;
            } finally {
                rSmtp = null;
            }

%>

