package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String.
 * @author skuarch
 */
public class SqlPuertos {

    //==========================================================================
    /**
     * Constructor.
     */
    public SqlPuertos() {
    }//fin constructor

    //==========================================================================
    /**
     * Metodo encargado de crear el sql para el volumen<br>.
     * si se le envia limi1 = 0 y limit2 = 0 no se creara ningun limite
     * @param opcionGrafica String
     * @param fecha_inicial String
     * @param fecha_final String
     * @param limit1 String
     * @param limit2 String
     * @return String con el sql
     */
    public String getSqlPuertos(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

        String sql = null;
        String limit = null;
        long id1 = new Fechas().fechaId(fecha_inicial);
        long id2 = new Fechas().fechaId(fecha_final);

        try {

            //checando el limit, esto debe de ser adaptable para las tablas
            if (limit1.equalsIgnoreCase("0") && limit2.equalsIgnoreCase("0")) {
                limit = " ";
            } else {
                limit = "limit " + limit1 + "," + limit2;
            }

            opcionGrafica = opcionGrafica.toLowerCase();

            //global
            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "SELECT (puerto_puerto)campo1, (SUM(puerto_bytes_in) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2, (SUM(puerto_bytes_out) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3, 	(SUM(puerto_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo4 FROM puerto_min  WHERE (id_puerto_min >= " + id1 + " AND id_puerto_min <= " + id2 + ")  GROUP BY puerto_puerto ORDER BY campo4 DESC " + limit;
            } else {
                sql = "SELECT (puerto_" + opcionGrafica + "_puerto)campo1, (SUM(puerto_" + opcionGrafica + "_bytes_in) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2, (SUM(puerto_" + opcionGrafica + "_bytes_out) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3, 	(SUM(puerto_" + opcionGrafica + "_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo4 FROM puerto_" + opcionGrafica + "_min  WHERE (id_puerto_" + opcionGrafica + "_min >= " + id1 + " AND id_puerto_" + opcionGrafica + "_min <= " + id2 + ")  GROUP BY puerto_" + opcionGrafica + "_puerto ORDER BY campo4 DESC " + limit;
            }

        } catch (Exception e) {
        } //fin try catch
        
        return sql;

    } //getSqlPuertos

    //==========================================================================
    public String getSqlDetallePuertos1(int puerto, String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

        String sql = null;
        String limit = null;
        long id1 = new Fechas().fechaId(fecha_inicial);
        long id2 = new Fechas().fechaId(fecha_final);

        try {

            //checando el limit, esto debe de ser adaptable para las tablas
            if (limit1.equalsIgnoreCase("0") && limit2.equalsIgnoreCase("0")) {
                limit = " ";
            } else {
                limit = "limit " + limit1 + "," + limit2;
            }

            opcionGrafica = opcionGrafica.toLowerCase();


            if (opcionGrafica.equalsIgnoreCase("UDP")) {
                
                //sql = "SELECT (udp_min_IP_src)campo1, (udp_min_Port_src)campo2, (udp_min_IP_dst)campo3, (udp_min_Port_dst)campo4, SUM(udp_min_bytes_src)campo5, SUM(udp_min_bytes_dst)campo6, SUM(udp_min_bytes_tot)campo7, (SUM(udp_min_bytes_tot) * 100) / (SELECT SUM(vol_udp_min_tot)FROM vol_udp_min WHERE id_vol_udp_min >= " + id1 + " AND id_vol_udp_min <= " + id2 + ")campo8 FROM udp_min WHERE (udp_min_Port_src = " + puerto + " OR udp_min_Port_dst = " + puerto + ") AND (id_udp_min >= " + id1 + " AND id_udp_min <= " + id2 + ") GROUP BY udp_min_IP_src, udp_min_IP_dst ORDER BY campo7 DESC  LIMIT 1000";
                sql = "SELECT (udp_min_IP_src)campo1, (udp_min_Port_src)campo2, (udp_min_IP_dst)campo3, (udp_min_Port_dst)campo4, SUM(udp_min_bytes_src)campo5, SUM(udp_min_bytes_dst)campo6, SUM(udp_min_bytes_tot)campo7, (SUM(udp_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo8 FROM udp_min WHERE (udp_min_Port_src = " + puerto + " OR udp_min_Port_dst = " + puerto + ") AND (id_udp_min >= " + id1 + " AND id_udp_min <= " + id2 + ") GROUP BY udp_min_IP_src, udp_min_IP_dst ORDER BY campo7 DESC  LIMIT 1000";
            }

            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "SELECT (global_min_IP_src)campo1, (global_min_Port_src)campo2, (global_min_IP_dst)campo3, (global_min_Port_dst)campo4, SUM(global_min_bytes_src)campo5, SUM(global_min_bytes_dst)campo6, SUM(global_min_bytes_tot)campo7, (SUM(global_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo8 FROM global_min WHERE (global_min_Port_src = " + puerto + " OR global_min_Port_dst = " + puerto + ") AND (id_global_min >= " + id1 + " AND id_global_min <= " + id2 + ") GROUP BY global_min_IP_src, global_min_IP_dst ORDER BY campo7 DESC  LIMIT 1000";
            }

            if (!opcionGrafica.equalsIgnoreCase("GLOBAL") && !opcionGrafica.equalsIgnoreCase("UDP")) {
                //sql = "SELECT (tcp_min_IP_src)campo1, (tcp_min_Port_src)campo2, (tcp_min_IP_dst)campo3, (tcp_min_Port_dst)campo4, SUM(tcp_min_bytes_src)campo5, SUM(tcp_min_bytes_dst)campo6, SUM(tcp_min_bytes_tot)campo7, (SUM(tcp_min_bytes_tot) * 100) / (SELECT SUM(vol_tcp_min_tot) FROM vol_tcp_min WHERE id_vol_tcp_min >= " + id1 + " AND id_vol_tcp_min <= " + id2 + ")campo8 FROM tcp_min WHERE (tcp_min_Port_src = " + puerto + " OR tcp_min_Port_dst = " + puerto + ") AND (id_tcp_min >= " + id1 + " AND id_tcp_min <= " + id2 + ") GROUP BY tcp_min_IP_src, tcp_min_IP_dst ORDER BY campo7 DESC  LIMIT 1000";
                sql = "SELECT (tcp_min_IP_src)campo1, (tcp_min_Port_src)campo2, (tcp_min_IP_dst)campo3, (tcp_min_Port_dst)campo4, SUM(tcp_min_bytes_src)campo5, SUM(tcp_min_bytes_dst)campo6, SUM(tcp_min_bytes_tot)campo7, (SUM(tcp_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo8 FROM tcp_min WHERE (tcp_min_Port_src = " + puerto + " OR tcp_min_Port_dst = " + puerto + ") AND (id_tcp_min >= " + id1 + " AND id_tcp_min <= " + id2 + ") GROUP BY tcp_min_IP_src, tcp_min_IP_dst ORDER BY campo7 DESC  LIMIT 1000";
            }

        } catch (Exception e) {
        } //fin try catch

        return sql;

    } //getSqlDetallePuertos1

    //==========================================================================
    public String getSqlLevel1(int puerto, String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

        String sql = null;
        String limit = null;
        long id1 = new Fechas().fechaId(fecha_inicial);
        long id2 = new Fechas().fechaId(fecha_final);

        try {

            //checando el limit, esto debe de ser adaptable para las tablas
            if (limit1.equalsIgnoreCase("0") && limit2.equalsIgnoreCase("0")) {
                limit = " ";
            } else {
                limit = "limit " + limit1 + "," + limit2;
            }

            opcionGrafica = opcionGrafica.toLowerCase();


            //if (opcionGrafica.equalsIgnoreCase("UDP")) {
            //sql = "SELECT (udp_min_IP_src)campo1, round(udp_min_Port_src,2)campo2, (udp_min_IP_dst)campo3, (udp_min_Port_dst)campo4, SUM(udp_min_bytes_src)campo5, SUM(udp_min_bytes_dst)campo6, SUM(udp_min_bytes_tot)campo7, (SUM(udp_min_bytes_tot) * 100) / (SELECT SUM(vol_udp_min_tot)FROM vol_udp_min WHERE id_vol_udp_min >= " + id1 + " AND id_vol_udp_min <= " + id2 + ")campo8 FROM udp_min WHERE (udp_min_Port_src = " + puerto + " OR udp_min_Port_dst = " + puerto + ") AND (id_udp_min >= " + id1 + " AND id_udp_min <= " + id2 + ") GROUP BY udp_min_IP_src, udp_min_IP_dst ORDER BY campo7 DESC  LIMIT 1000";
            //}

            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "SELECT  IF(global_min_Port_src=" + puerto + ",global_min_IP_src,global_min_IP_dst)campo1, SUM(global_min_bytes_tot)campo2, (SUM(global_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3 FROM global_min WHERE (global_min_Port_src = " + puerto + " OR global_min_Port_dst = " + puerto + ") AND (id_global_min >=" + id1 + " AND id_global_min <= " + id2 + ") GROUP BY campo1 ORDER BY campo3 DESC LIMIT 25;";
            } else if (opcionGrafica.equalsIgnoreCase("TCP") || opcionGrafica.equalsIgnoreCase("PAM") || opcionGrafica.equalsIgnoreCase("HTTP")) {
                sql = "SELECT  IF(tcp_min_Port_src=" + puerto + ",tcp_min_IP_src,tcp_min_IP_dst)campo1, SUM(tcp_min_bytes_tot)campo2, (SUM(tcp_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3 FROM tcp_min WHERE (tcp_min_Port_src = " + puerto + " OR tcp_min_Port_dst = " + puerto + ") AND (id_tcp_min >=" + id1 + " AND id_tcp_min <= " + id2 + ") GROUP BY campo1 ORDER BY campo3 DESC LIMIT 25;";
            } else {
                sql = "SELECT  IF(udp_min_Port_src=" + puerto + ",udp_min_IP_src,udp_min_IP_dst)campo1, SUM(udp_min_bytes_tot)campo2, (SUM(udp_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3 FROM udp_min WHERE (udp_min_Port_src = " + puerto + " OR udp_min_Port_dst = " + puerto + ") AND (id_udp_min >=" + id1 + " AND id_udp_min <= " + id2 + ") GROUP BY campo1 ORDER BY campo3 DESC LIMIT 25;";
            }

            

        } catch (Exception e) {
        } //fin try catch

        return sql;

    } //getSqlDetallePuertos1
} //fin class

