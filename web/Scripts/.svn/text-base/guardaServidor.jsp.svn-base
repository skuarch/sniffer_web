<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.ConnectCollector,java.sql.ResultSet,com.websniffer.ConnectPool"%>

<%
            String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext();
            String ip_remoto = request.getParameter("ip_remoto");

            //checo si los datos ya estan
            String sql = "select * from servidor_config where servidor_ip = '" + request.getParameter("ipServidor") + "' and servidor_puerto = " + request.getParameter("puertoServidor") + ";";

            ResultSet rs = new ConnectCollector(short_context).select(sql, ip_remoto);
            int filas = new ConnectPool(short_context).getNumFilas(rs);

            if (filas > 0) {
                out.println("Los datos ya se encuentran en la base de datos");
            } else {
                new ConnectCollector(short_context).update("insert into servidor_config (servidor_ip,servidor_puerto) values ('" + request.getParameter("ipServidor") + "','" + request.getParameter("puertoServidor") + "');", ip_remoto);
                out.println("Los datos se guardaron correctamente");
            }

            try {
                rs.close();
            } finally {
                rs = null;
            }

%>

