<%@page import="ChartDirector.*,com.websniffer.ConnectCollector,com.websniffer.Fechas,com.websniffer.ConnectPool,java.sql.*,java.io.*" %>
<%@include file="../catchVariables.jsp" %>
<%
            Chart.setLicenseCode("DEVP-353Y-BPF3-395R-D4AA-C8C0");

            int tam = 0;
            String puerto = request.getParameter("label");
            String sql = null;
            double[] data0 = null;
            double[] data1 = null;
            double[] data2 = null;
            String[] labels = null;
            ResultSet r = null;
            int i = 0;

            if (puerto.equalsIgnoreCase("no hay datos")) {
                
                out.println("no hay datos");

                }else {

                if (opcionGrafica.contentEquals("TCP") || opcionGrafica.contentEquals("PAM") || opcionGrafica.contentEquals("HTTP") || opcionGrafica.contentEquals("GLOBAL")) {

                    //el sql

                    if (opcionGrafica.equalsIgnoreCase("TCP")) {

                        sql = "SELECT SUM(tr_tcp_min_miliseg)campo1, SUM(tr_tcp_avg_miliseg)campo2,SUM(tr_tcp_max_miliseg)campo3,(tr_tcp_fecha)campo4 FROM tr_tcp_min WHERE (id_tr_tcp >= " + new Fechas().fechaId(fecha_inicial) + " AND id_tr_tcp <= " + new Fechas().fechaId(fecha_final) + " ) AND tr_tcp_puerto = " + puerto + " GROUP BY campo4 order BY campo4 ASC";

                    }

                    //no hay latencia para udp

                    if (opcionGrafica.equalsIgnoreCase("PAM")) {

                        sql = "SELECT SUM(tr_pam_min_miliseg)campo1, SUM(tr_pam_avg_miliseg)campo2,SUM(tr_pam_max_miliseg)campo3,(tr_pam_fecha)campo4 FROM tr_pam_min WHERE (id_tr_pam >= " + new Fechas().fechaId(fecha_inicial) + " AND id_tr_pam <= " + new Fechas().fechaId(fecha_final) + " ) AND tr_pam_puerto = " + puerto + " GROUP BY campo4 order BY campo4 ASC";

                    }


                    if (opcionGrafica.equalsIgnoreCase("HTTP")) {

                        sql = "SELECT SUM(tr_http_min_miliseg)campo1, SUM(tr_http_avg_miliseg)campo2,SUM(tr_http_max_miliseg)campo3,(tr_http_fecha)campo4 FROM tr_http_min WHERE (id_tr_http >= " + new Fechas().fechaId(fecha_inicial) + " AND id_tr_http <= " + new Fechas().fechaId(fecha_final) + " ) AND tr_http_puerto = " + puerto + " GROUP BY campo4 order BY campo4 ASC";

                    }


                    if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {

                        sql = "SELECT SUM(tr_min_min_miliseg)campo1, SUM(tr_min_avg_miliseg)campo2, SUM(tr_min_max_miliseg)campo3, (tr_min_fecha)campo4  FROM tr_min WHERE (id_tr_min >= " + new Fechas().fechaId(fecha_inicial) + " AND id_tr_min <= " + new Fechas().fechaId(fecha_final) + ") AND tr_min_puerto = " + puerto + " GROUP BY campo4 order BY campo4 ASC  ";

                    }

                    System.out.println(sql);

                    r = new ConnectCollector(short_context).select(sql, ip_remoto);

                    tam = new ConnectPool(short_context).getNumFilas(r);

                    if (tam > 0) {

                        data0 = new double[tam];
                        data1 = new double[tam];
                        data2 = new double[tam];
                        labels = new String[tam];

                        while (r.next()) {

                            data0[i] = r.getDouble("campo1");
                            data1[i] = r.getDouble("campo2");
                            data2[i] = r.getDouble("campo3");
                            labels[i] = r.getDate("campo4") + " " + r.getTime("campo4");
                            labels[i] = labels[i].substring(2, 16);

                            i++;
                        }

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
                    XYChart c = new XYChart(690, 390, 0xF1F1F2, 0x000000, 0);
                    c.setRoundedFrame();

                    // Set the plotarea at (55, 58) and of size 520 x 195 pixels, with white background.
                    // Turn on both horizontal and vertical grid lines with light grey color (0xcccccc)
                    c.setPlotArea(85, 58, 580, 245, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

                    c.addText(545, 40, "(c) Copyright SisPro", "arial.ttf");

                    // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 9 pts
                    // Arial Bold font. Set the background and border color to Transparent.
                    c.addLegend(90, 27, false, "Arial Bold", 9).setBackground(Chart.Transparent);

                    // Add a title box to the chart using 15 pts Times Bold Italic font, on a light blue
                    // (CCCCFF) background with glass effect. white (0xffffff) on a dark red (0x800000)
                    // background, with a 1 pixel 3D border.
                    c.addTitle("LATENCIA PUERTO", "Arial Bold", 14).setBackground(0xC3D9E1, 0x000000, Chart.glassEffect());


                    // Add a title to the y axis
                    c.yAxis().setTitle("milisegundos");

                    // Use 8 points Arial rotated by 90 degrees as the x-axis label font
                    c.xAxis().setLabelStyle("Arial", 8, Chart.TextColor, 50);

                    // Set the labels on the x axis.
                    c.xAxis().setLabels(labels);

                    // Display 1 out of 3 labels on the x-axis.
                    if (tiempoGrafica.equalsIgnoreCase("30 DIAS") || tiempoGrafica.equalsIgnoreCase("7 DIAS") || tiempoGrafica.equalsIgnoreCase("30 DIAS") || tiempoGrafica.equalsIgnoreCase("PERSONALIZADO")) {
                        clic = false;

                    }
                    c.xAxis().setLabelStep(tam / 30 + 1);

                    // Add a title to the x axis
                    c.xAxis().setTitle("Fechas");

                    // Add a line layer to the chart
                    LineLayer layer = c.addLineLayer2();

                    // Set the default line width to 2 pixels
                    layer.setLineWidth(1);

                    // Add the three data sets to the line layer. For demo purpose, we use a dash line
                    // color for the last line
                    layer.addDataSet(data0, 0xff0000, "Latencia minima");
                    layer.addDataSet(data1, 0x008800, "Latencia promedio");
                    layer.addDataSet(data2, 0x3333ff, "Latencia maxima");
                    //layer.addDataSet(data2, c.dashLineColor(0x3333ff, Chart.DashLine), "Server #3");

                    // Create the image and save it in a temporary location
                    String chart1URL = c.makeSession(request, "chart1");

                    // Client side Javascript to show detail information "onmouseover"
                    //String showText ="onmouseover='muestraInfo(\"{xLabel}\", {value}, {field0}, {field1});' ";
                    String showText = "onmouseover='muestraInfoGrafica(\"Fecha: {xLabel} {dataSetName} {value} \" );' ";

                    // Client side Javascript to hide detail information "onmouseout"
                    String hideText = "onmouseout='noMuestraInfoGrafica();' ";

                    // "title" attribute to show tool tip
                    String toolTip = "title='{xLabel} Vol:{value|0}'+nombreUnidadMedida";

                    String variables = "minuto={xLabel}&dataSet={dataSetName}&tipoGrafica=" + tipoGrafica + "&opcionGrafica=" + opcionGrafica + "&tiempoGrafica=" + tiempoGrafica + "&fecha_inicial=" + fecha_inicial + "&fecha_final=" + fecha_final + "&unidadMedida=" + unidadMedida + "&nombreUnidadMedida=" + nombreUnidadMedida + "&remoto=" + remoto + "&ip_remoto= " + ip_remoto + "',400,600)";

                    // Create an image map for the chart
                    //String imageMap1 = c.getHTMLImageMap("javascript:abrirVentanaSinParametros('detalleMinuto.jsp", "" + variables + "", showText + hideText + toolTip);

                    r.close();

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
        <title>JSP Page</title>

    </head>

    <body>
        <div align="center">

            <img src='<%=response.encodeURL("getchart.jsp?" + chart1URL)%>' usemap="#map1" border="0" alt="">            

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
                        data2 = null;
                        labels = null;
                        tam = 0;
                        variables = null;
                        r.close();
                        c = null;
                        chart1URL = null;

                    } finally {
                        r = null;
                    }


                } else {
                    out.println("No existe latencia de UDP");
                }
            }

%>
