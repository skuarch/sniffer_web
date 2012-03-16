<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.Fechas, java.sql.ResultSet" %>
<%


     String sqlIps = null;
     String sqlConexiones = null;
     String sqlPuertos = null;


     //IPS======================================================================
     //tcp
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("TCP")){
        sqlIps = "SELECT (host_tcp_host)campo1, SUM(host_tcp_bytes_in)campo2, SUM(host_tcp_bytes_out)campo3, SUM(host_tcp_bytes_tot) campo4 FROM host_tcp_min WHERE (id_host_tcp_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") GROUP BY host_tcp_host ORDER BY host_tcp_bytes_tot DESC" ;
     }
     //udp
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("UDP")){
        sqlIps = "SELECT (host_udp_host)campo1, SUM(host_udp_bytes_in)campo2, SUM(host_udp_bytes_out)campo3, SUM(host_udp_bytes_tot) campo4 FROM host_udp_min WHERE (id_host_udp_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") GROUP BY host_udp_host ORDER BY host_udp_bytes_tot DESC" ;
     }
     //pam
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("PAM")){
        sqlIps = "SELECT (host_pam_host)campo1, SUM(host_pam_bytes_in)campo2, SUM(host_pam_bytes_out)campo3, SUM(host_pam_bytes_tot) campo4 FROM host_pam_min WHERE (id_host_pam_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") GROUP BY host_pam_host ORDER BY host_pam_bytes_tot DESC" ;
     }
     //http
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("HTTP")){
        sqlIps = "SELECT (host_http_host)campo1, SUM(host_http_bytes_in)campo2, SUM(host_http_bytes_out)campo3, SUM(host_http_bytes_tot) campo4 FROM host_http_min WHERE (id_host_http_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") GROUP BY host_http_host ORDER BY host_http_bytes_tot DESC" ;
     }
     //global
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("GLOBAL")){
        sqlIps = "SELECT (host_host)campo1, SUM(host_bytes_in)campo2, SUM(host_bytes_out)campo3, SUM(host_bytes_tot) campo4 FROM host_min WHERE (id_host_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") GROUP BY host_host ORDER BY host_bytes_tot DESC" ;
     }



     //CONEXIONES===============================================================
     //tcp
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("TCP")){
        sqlConexiones = "SELECT (conex_tcp_host)campo1,(conex_tcp_conex)campo2,(conex_tcp_bytes_in)campo3,(conex_tcp_bytes_out)campo4,(conex_tcp_bytes_tot)campo5 FROM conex_tcp_min WHERE id_conex_tcp_min = "+new Fechas().fechaId(request.getParameter("minuto"))+" ORDER BY conex_tcp_bytes_tot DESC;";
     }
     //udp
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("UDP")){
        sqlConexiones = "SELECT (conex_udp_host)campo1,(conex_udp_conex)campo2,(conex_udp_bytes_in)campo3,(conex_udp_bytes_out)campo4,(conex_udp_bytes_tot)campo5 FROM conex_udp_min WHERE id_conex_udp_min = "+new Fechas().fechaId(request.getParameter("minuto"))+" ORDER BY conex_udp_bytes_tot DESC;";

     }
     //pam
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("PAM")){
        sqlConexiones = "SELECT (conex_pam_host)campo1,(conex_pam_conex)campo2,(conex_pam_bytes_in)campo3,(conex_pam_bytes_out)campo4,(conex_pam_bytes_tot)campo5 FROM conex_pam_min WHERE id_conex_pam_min = "+new Fechas().fechaId(request.getParameter("minuto"))+" ORDER BY conex_pam_bytes_tot DESC;";
     }
     //http
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("HTTP")){
        sqlConexiones = "SELECT (conex_http_host)campo1,(conex_http_conex)campo2,(conex_http_bytes_in)campo3,(conex_http_bytes_out)campo4,(conex_http_bytes_tot)campo5 FROM conex_http_min WHERE id_conex_http_min = "+new Fechas().fechaId(request.getParameter("minuto"))+" ORDER BY conex_http_bytes_tot DESC;";
     }
     //global
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("GLOBAL")){
        sqlConexiones = "SELECT (conex_host)campo1,(conex_conex)campo2,(conex_bytes_in)campo3,(conex_bytes_out)campo4,(conex_bytes_tot)campo5 FROM conex_min WHERE id_conex_min = "+new Fechas().fechaId(request.getParameter("minuto"))+" ORDER BY conex_bytes_tot DESC;";
     }




     //PUERTOS===============================================================
     //tcp
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("TCP")){
        sqlPuertos = "SELECT (p.puerto_tcp_puerto)campo1,(n.protocolo)campo2,(p.puerto_tcp_conex)campo3,(p.puerto_tcp_bytes_in)campo4,(p.puerto_tcp_bytes_out)campo5,(p.puerto_tcp_bytes_tot)campo6 FROM puerto_tcp_min p RIGHT JOIN nombre_puertos n ON (p.id_puerto_tcp_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") AND (p.puerto_tcp_puerto = n.portNum) WHERE p.puerto_tcp_puerto IS NOT NULL ORDER BY p.puerto_tcp_bytes_tot DESC;";
     }
     //udp
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("UDP")){
        sqlPuertos = "SELECT (p.puerto_udp_puerto)campo1,(n.protocolo)campo2,(p.puerto_udp_conex)campo3,(p.puerto_udp_bytes_in)campo4,(p.puerto_udp_bytes_out)campo5,(p.puerto_udp_bytes_tot)campo6 FROM puerto_udp_min p RIGHT JOIN nombre_puertos n ON (p.id_puerto_udp_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") AND (p.puerto_udp_puerto = n.portNum) WHERE p.puerto_udp_puerto IS NOT NULL ORDER BY p.puerto_udp_bytes_tot DESC;";
         
     }
     //pam
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("PAM")){
        sqlPuertos = "SELECT (p.puerto_pam_puerto)campo1,(n.protocolo)campo2,(p.puerto_pam_conex)campo3,(p.puerto_pam_bytes_in)campo4,(p.puerto_pam_bytes_out)campo5,(p.puerto_pam_bytes_tot)campo6 FROM puerto_pam_min p RIGHT JOIN nombre_puertos n ON (p.id_puerto_pam_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") AND (p.puerto_pam_puerto = n.portNum) WHERE p.puerto_pam_puerto IS NOT NULL ORDER BY p.puerto_pam_bytes_tot DESC;";
     }
     //http
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("HTTP")){
        sqlPuertos = "SELECT (p.puerto_http_puerto)campo1,(n.protocolo)campo2,(p.puerto_http_conex)campo3,(p.puerto_http_bytes_in)campo4,(p.puerto_http_bytes_out)campo5,(p.puerto_http_bytes_tot)campo6 FROM puerto_http_min p RIGHT JOIN nombre_puertos n ON (p.id_puerto_http_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") AND (p.puerto_http_puerto = n.portNum) WHERE p.puerto_http_puerto IS NOT NULL ORDER BY p.puerto_http_bytes_tot DESC;";
     }
     //global
     if(request.getParameter("opcionGrafica").equalsIgnoreCase("GLOBAL")){
        sqlPuertos = "SELECT (p.puerto_puerto)campo1,(n.protocolo)campo2,(p.puerto_conex)campo3,(p.puerto_bytes_in)campo4,(p.puerto_bytes_out)campo5,(p.puerto_bytes_tot)campo6 FROM puerto_min p RIGHT JOIN nombre_puertos n ON (p.id_puerto_min = "+new Fechas().fechaId(request.getParameter("minuto"))+") AND (p.puerto_puerto = n.portNum) WHERE p.puerto_puerto IS NOT NULL ORDER BY p.puerto_bytes_tot DESC;";
     }


%>