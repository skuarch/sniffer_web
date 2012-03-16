<%@page import="com.websniffer.*,ChartDirector.*, java.io.BufferedWriter,java.io.File, java.io.PrintWriter, javax.xml.parsers.DocumentBuilder,  javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NamedNodeMap,org.w3c.dom.Node,org.w3c.dom.NodeList, java.io.FileWriter" %>
<%
/*
            String origen = request.getParameter("origen");
            String destino = request.getParameter("destino");

            DocumentBuilderFactory factory = null;
            Document documento = null;
            DocumentBuilder builder = null;
            Node nodoRaiz = null;
            NodeList listaNodos = null;
            NodeList listaNodosStep = null;
            int numNodos = 0;
            Node nodo = null;
            Node nodo2 = null;
            NamedNodeMap nombreNodo = null;
            NamedNodeMap nombreNodoStep = null;
            Node nodoStep = null;
            String completed = null;
            Node unAtributo = null;
            Node unNodoHijo = null;
            String index[] = null;
            String failed = null;
            String message = null;
            String hostname[] = null;
            String labels[] = null;
            double data1[] = null;
            int sumData = 0;


            try { // Call Web Service Operation

                //guardamos el resultado en una variable
                com.gdc.e2e.server.TracerouteService service = new com.gdc.e2e.server.TracerouteService();
                com.gdc.e2e.server.Traceroute port = service.getTraceroutePort();
                // TODO initialize WS operation arguments here
                java.lang.String source = origen;
                java.lang.String target = destino;
                // TODO process result here
                java.lang.String result = port.traceroute(source, target);


                out.println(result);

                //creamos el archivo
                FileWriter fw = new FileWriter("xml.xml");
                BufferedWriter bw = new BufferedWriter(fw);
                PrintWriter salida = new PrintWriter(bw);
                salida.println(result);
                salida.close();
                File f = new File("xml.xml");

                factory = DocumentBuilderFactory.newInstance();
                builder = factory.newDocumentBuilder();
                documento = builder.parse(f);


                nodoRaiz = documento.getFirstChild();
                listaNodos = nodoRaiz.getChildNodes();
                numNodos = listaNodos.getLength();

                System.out.println("iniciando web service");


                //result
                //for (int i = 0; i <= numNodos; i++) {

                unNodoHijo = listaNodos.item(0);
                nodo = listaNodos.item(0);
                nombreNodo = nodo.getAttributes();
                unAtributo = nombreNodo.getNamedItem("failed");
                failed = unAtributo.getNodeValue();
                System.out.println("failed: " + failed);

                unAtributo = nombreNodo.getNamedItem("completed");
                completed = unAtributo.getNodeValue();

                System.out.println("completed: " + completed);

                unAtributo = nombreNodo.getNamedItem("message");
                message = unAtributo.getNodeValue();

                System.out.println("message: " + message);

                nodoStep = unNodoHijo.getNextSibling();


                listaNodosStep = nodoStep.getChildNodes();
                numNodos = listaNodosStep.getLength();

                if (numNodos >= 0) {

                    index = new String[numNodos];
                    hostname = new String[numNodos];
                    labels = new String[numNodos];
                    data1 = new double[numNodos];
                    sumData = 0;

                }

                //step
                for (int e = 0; e < numNodos; e++) {

                    nodo2 = listaNodosStep.item(e);
                    nombreNodoStep = nodo2.getAttributes();

                    unAtributo = nombreNodoStep.getNamedItem("index");
                    index[e] = unAtributo.getNodeValue();                    


                    unAtributo = nombreNodoStep.getNamedItem("hostname");
                    hostname[e] = unAtributo.getNodeValue();                    


                    unAtributo = nombreNodoStep.getNamedItem("ip");
                    labels[e] = unAtributo.getNodeValue();                    


                    unAtributo = nombreNodoStep.getNamedItem("time");
                    data1[e] = Double.parseDouble(unAtributo.getNodeValue());
                    sumData += data1[e];                    

                }

                //}


                fw.close();
                f.delete();

            } catch (Exception ex) {
                System.out.println(ex);
            }

            //fin web service
//======================================================================================================================


// Create a XYChart object of size 450 x 250 pixels, with a pale yellow (0xffffc0)
// background, a black border, and 1 pixel 3D border effect.
            XYChart c = new XYChart(690, 290, 0xF1F1F2, 0x000000, 0);
            c.setRoundedFrame();

//Set search path to current JSP directory for loading icon images
            c.setSearchPath(getServletConfig().getServletContext(), request);

// Set the plotarea at (60, 45) and of size 360 x 170 pixels, using white (0xffffff)
// as the plot area background color. Turn on both horizontal and vertical grid lines
// with light grey color (0xc0c0c0)
            c.setPlotArea(65, 58, 610, 145, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

// Add a legend box at (60, 20) (top of the chart) with horizontal layout. Use 8 pts
// Arial Bold font. Set the background and border color to Transparent.
            c.addLegend(60, 25, false, "Arial Bold", 8).setBackground(Chart.Transparent);

// Add a title to the chart using 12 pts Arial Bold/white font. Use a 1 x 2 bitmap
// pattern as the background.
            c.addTitle("End to End", "Arial Bold", 14).setBackground(0xC3D9E1, 0x000000, Chart.glassEffect());

// Set the labels on the x axis
            c.xAxis().setLabels(labels);

            c.xAxis().setLabelStyle("Arial", 8, Chart.TextColor, 50);

// Reserve 8 pixels margins at both side of the x axis to avoid the first and last
// symbols drawing outside of the plot area
            c.xAxis().setMargin(8, 8);

// Add a title to the y axis
            c.yAxis().setTitle("Tiempo (milisegundos)");

// Add a line layer to the chart
            LineLayer layer = c.addLineLayer2();

// Add the first line using small_user.png as the symbol.
//layer.addDataSet(data0, 0xcf4040, "Users").setDataSymbol2("/images/small_user.png");

// Add the first line using small_computer.png as the symbol.
            layer.addDataSet(data1, 0x40cf40, "Hosts").setDataSymbol2("/images/small_computer.png");

// Set the line width to 3 pixels
            layer.setLineWidth(1);

// Output the chart
            String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
            String imageMap1 = c.getHTMLImageMap("", "", "title='host:{xLabel} milisegundos: {value}'");
%>
<html>
    <head>
        <title></title>

    </head>

    <body style="margin:5px 0px 0px 5px">

        <img src='<%=response.encodeURL("getchart.jsp?" + chart1URL)%>' usemap="#map1" border="0" alt="">

        <br>        

        Completado: <b><%=completed%></b> Failed: <b><%=failed%></b> Message: <b><%=message%></b>

        <br>
        

        End 2 End origen: [ <b><%=origen%></b> ] destino: [ <b><%=destino%></b> ] Echo:[ <b><%= new Tools().hostIsALive(destino) %></b> ] Total de tiempo: <b><%= sumData%></b> milisegundos

        <br>
        

        <div style="width:725px; height:150px; overflow:auto">

            <table border="0" width="650" class="filterable" id="tabla">
                <thead>
                    <tr>
                        <th bgcolor="#E9E9E9" class="bordes"></th>
                        <th bgcolor="#E9E9E9" class="bordes">Tiempo (milisegundos)</th>
                        <th bgcolor="#E9E9E9" class="bordes">Host</th>
                    </tr>
                </thead>

                <tbody>

                    <% for (int i = 0; i < data1.length; i++) {%>

                    <tr>
                        <td align="center" class="bordes"><%= i%></td>
                        <td align="center" class="bordes"><%= data1[i]%> </td>
                        <td align="center" class="bordes"><%= labels[i]%> </td>
                    </tr>

                    <% }%>

                </tbody>
            </table>

        </div>

        <map name="map1">
            <%=imageMap1%>
            <div></div>
        </map>

    </body>
</html>

<% */ %>