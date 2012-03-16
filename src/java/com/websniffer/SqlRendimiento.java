package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlRendimiento {

    //==========================================================================
    /**
     * Constructor
     */
    public SqlRendimiento() {
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
    public String getSqlRendimiento(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

        String sql = null;
        String limit = null;
        String tabla = null;
        long id1 = new Fechas().fechaId(fecha_inicial);
        long id2 = new Fechas().fechaId(fecha_final);

        try {


            //checando el limit, esto debe de ser adaptable para las tablas
            if (limit1.equalsIgnoreCase("0") && limit2.equalsIgnoreCase("0")) {
                limit = " ";
            } else {
                limit = "limit " + limit1 + "," + limit2;
            }


            //tcp
            if (opcionGrafica.equalsIgnoreCase("TCP")) {                
                sql = "SELECT (throughput_tcp_min_fecha)campo1, (throughput_tcp_min_in)campo2, (throughput_tcp_min_out)campo3, (throughput_tcp_min_tot)campo4 FROM throughput_tcp_min WHERE (id_throughput_tcp_min >= " + id1 + " AND id_throughput_tcp_min <= " + id2 + ")ORDER BY throughput_tcp_min_fecha asc " + limit;
            }

            //udp
            if (opcionGrafica.equalsIgnoreCase("UDP")) {                
                sql = "SELECT (throughput_udp_min_fecha)campo1, (throughput_udp_min_in)campo2, (throughput_udp_min_out)campo3, (throughput_udp_min_tot)campo4 FROM throughput_udp_min WHERE (id_throughput_udp_min >= " + id1 + " AND id_throughput_udp_min <= " + id2 + ")ORDER BY throughput_udp_min_fecha asc " + limit;
            }

            //pam
            if (opcionGrafica.equalsIgnoreCase("PAM")) {                
                sql = "SELECT (throughput_pam_min_fecha)campo1, (throughput_pam_min_in)campo2, (throughput_pam_min_out)campo3, (throughput_pam_min_tot)campo4 FROM throughput_pam_min WHERE (id_throughput_pam_min >= " + id1 + " AND id_throughput_pam_min <= " + id2 + ")ORDER BY throughput_pam_min_fecha asc " + limit;
            }


            //http
            if (opcionGrafica.equalsIgnoreCase("HTTP")) {                
                sql = "SELECT (throughput_http_min_fecha)campo1, (throughput_http_min_in)campo2, (throughput_http_min_out)campo3, (throughput_http_min_tot)campo4 FROM throughput_http_min WHERE (id_throughput_http_min >= " + id1 + " AND id_throughput_http_min <= " + id2 + ")ORDER BY throughput_http_min_fecha asc " + limit;
            }


            //global
            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {                
                sql = "SELECT (throughput_min_fecha)campo1, (throughput_min_in)campo2, (throughput_min_out)campo3, (throughput_min_tot)campo4 FROM throughput_min WHERE (id_throughput_min >= " + id1 + " AND id_throughput_min <= " + id2 + ")ORDER BY throughput_min_fecha asc " + limit;

            }

        } catch (Exception e) {
        }//fin try catch

        return sql;

    }//getSqlVolumen
}//fin class

