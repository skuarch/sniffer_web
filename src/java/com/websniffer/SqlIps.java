package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlIps {

    //==========================================================================
    /**
     * Constructor
     */
    public SqlIps() {
    }//fin constructor

    //==========================================================================
    /**
     * Metodo encargado de crear el sql para el volumen<br>
     * si se le envia limi1 = 0 y limit2 = 0 no se creara ningun limite
     * @param opcionGrafica String
     * @param fecha_inicial String
     * @param fecha_final String
     * @param limit1 String
     * @param limit2 String
     * @return String con el sql
     */
    public String getSqlIps(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

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
                sql = "SELECT (host_host)    campo1, (SUM(host_bytes_in) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2,  (SUM(host_bytes_out) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3,  (SUM(host_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo4  FROM host_min WHERE (id_host_min >= " + id1 + " AND id_host_min <= " + id2 + ") GROUP BY campo1 ORDER BY campo4 DESC " + limit;
            } else {
                sql = "SELECT (host_" + opcionGrafica + "_host)    campo1, (SUM(host_" + opcionGrafica + "_bytes_in) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2,  (SUM(host_" + opcionGrafica + "_bytes_out) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3,  (SUM(host_" + opcionGrafica + "_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo4  FROM host_" + opcionGrafica + "_min WHERE (id_host_" + opcionGrafica + "_min >= " + id1 + " AND id_host_" + opcionGrafica + "_min <= " + id2 + ") GROUP BY campo1 ORDER BY campo4 DESC " + limit;
            }

        } catch (Exception e) {
        }//fin try catch

        return sql;

    }//getSqlVolumen

    //==========================================================================
    public String getSqlDetalleIps1(String ip, String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

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
                sql = "SELECT (udp_min_IP_src)campo1, (udp_min_Port_src)campo2, (udp_min_IP_dst)campo3, (udp_min_Port_dst)campo4, SUM(udp_min_bytes_src)campo5, SUM(udp_min_bytes_dst)campo6, SUM(udp_min_bytes_tot)campo7,  (SUM(udp_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo8  FROM udp_min  WHERE (udp_min_IP_src = '" + ip + "' OR udp_min_IP_dst = '" + ip + "')  AND (id_udp_min >= " + id1 + " AND id_udp_min <= " + id2 + ")  GROUP BY udp_min_IP_src, udp_min_IP_dst  ORDER BY campo8 DESC   LIMIT 25";
            }

            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "SELECT (global_min_IP_src)campo1, (global_min_Port_src)campo2, (global_min_IP_dst)campo3, (global_min_Port_dst)campo4, SUM(global_min_bytes_src)campo5, SUM(global_min_bytes_dst)campo6, SUM(global_min_bytes_tot)campo7,  (SUM(global_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo8  FROM global_min  WHERE (global_min_IP_src = '" + ip + "' OR global_min_IP_dst = '" + ip + "')  AND (id_global_min >= " + id1 + " AND id_global_min <= " + id2 + ")  GROUP BY global_min_IP_src, global_min_IP_dst  ORDER BY campo8 DESC   LIMIT 25";
            }

            if (!opcionGrafica.equalsIgnoreCase("GLOBAL") && !opcionGrafica.equalsIgnoreCase("UDP")) {
                sql = "SELECT (tcp_min_IP_src)campo1, (tcp_min_Port_src)campo2, (tcp_min_IP_dst)campo3, (tcp_min_Port_dst)campo4, SUM(tcp_min_bytes_src)campo5, SUM(tcp_min_bytes_dst)campo6, SUM(tcp_min_bytes_tot)campo7,  (SUM(tcp_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo8  FROM tcp_min  WHERE (tcp_min_IP_src = '" + ip + "' OR tcp_min_IP_dst = '" + ip + "')  AND (id_tcp_min >= " + id1 + " AND id_tcp_min <= " + id2 + ")  GROUP BY tcp_min_IP_src, tcp_min_IP_dst  ORDER BY campo8 DESC   LIMIT 25";
            }

        } catch (Exception e) {
        } //fin try catch

        System.out.println(sql);

        return sql;

    } //getSqlDetalleIps
}//fin class

