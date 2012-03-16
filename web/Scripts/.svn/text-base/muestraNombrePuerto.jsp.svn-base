<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.ConnectPool,com.websniffer.ConnectCollector, java.sql.ResultSet"%>
<% String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext();%>

<%
            ResultSet r = new ConnectCollector(short_context).select("SELECT * FROM nombre_puertos WHERE portNum = " + request.getParameter("puerto") + ";", request.getParameter("ip_remoto"));

            int tam = new ConnectPool(short_context).getNumFilas(r);

            if (tam > 0) {

                r.next();
                out.println(r.getString("protocolo").toString().trim());


            } else {

                out.println("protocolo desconocido");

            }

            try {
                r.close();
            } finally {
                r = null;
            }


%>
