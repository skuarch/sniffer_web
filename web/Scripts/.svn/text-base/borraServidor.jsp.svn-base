<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.ConnectCollector,com.websniffer.ConnectPool,java.sql.ResultSet;"%>
<%
    String short_context = new com.websniffer.Context(request.getContextPath()).getShortContext();
    String ip_remoto = request.getParameter("ip_remoto");
    new ConnectCollector(short_context).update("delete from servidor_config where servidor_ip = '" + request.getParameter("ipServidor") + "' and servidor_puerto = " + request.getParameter("puertoServidor") + ";",ip_remoto);
    out.println("Los datos se han borrado");

%>


