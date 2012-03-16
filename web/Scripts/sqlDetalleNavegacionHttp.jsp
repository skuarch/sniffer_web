<%@page contentType="text/html" pageEncoding="UTF-8" import="com.websniffer.Fechas, java.sql.ResultSet" %>
<%


     String sqlNaveHttp = null;
     String label = request.getParameter("label");
     String fecha_inicial = request.getParameter("fecha_inicial");
     String fecha_final = request.getParameter("fecha_final");



     //sqlNaveHttp = "SELECT * FROM (SELECT (nav_ips)campo1, SUM(nav_ip_vol_tot)campo2 FROM nav_url_min WHERE (nav_url = '"+label+"') AND (id_nav_ip_min >= "+new Fechas().fechaId(fecha_inicial)+" AND id_nav_ip_min <="+new Fechas().fechaId(fecha_final)+") GROUP BY campo1) xx GROUP BY campo1 order BY campo2 DESC ";
     
     sqlNaveHttp = "SELECT (nav_ips)campo1, (nav_ip_vol_tot)campo2,(nav_ip_fecha)campo3, (nav_ip_avg_tiempo_respuesta)campo4 FROM nav_url_min WHERE (nav_url like '%"+label+"%') AND (id_nav_ip_min >= "+new Fechas().fechaId(fecha_inicial)+" AND id_nav_ip_min <= "+new Fechas().fechaId(fecha_final)+" ) order by campo2 desc limit 25;";

     //out.println("SELECT * FROM (SELECT (nav_ips)campo1, SUM(nav_ip_vol_tot)campo2 FROM nav_url_min WHERE (nav_url = '"+label+"') AND (id_nav_ip_min >= "+new Fechas().fechaId(fecha_inicial)+" AND id_nav_ip_min <="+new Fechas().fechaId(fecha_final)+") GROUP BY campo1) xx GROUP BY campo1order BY campo2 DESC ");

%>