package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlConexiones {

    //==========================================================================
    /**
     * Constructor
     */
    public SqlConexiones() {
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
    public String getSqlConexiones(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

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


            //tcp
            if (opcionGrafica.equalsIgnoreCase("TCP")) {                
                sql = "SELECT (conex_tcp_host)campo1, SUM(conex_tcp_conex)campo2, SUM(conex_tcp_bytes_in)campo3, SUM(conex_tcp_bytes_out)campo4, SUM(conex_tcp_bytes_tot)campo5 FROM conex_tcp_min WHERE ( id_conex_tcp_min >= " + id1 + " AND id_conex_tcp_min <= " + id2 + " ) GROUP BY campo1 ORDER BY campo2 DESC  " + limit;
            }

            //udp
            if (opcionGrafica.equalsIgnoreCase("UDP")) {                
                sql = "SELECT (conex_udp_host)campo1, SUM(conex_udp_conex)campo2, SUM(conex_udp_bytes_in)campo3, SUM(conex_udp_bytes_out)campo4, SUM(conex_udp_bytes_tot)campo5 FROM conex_udp_min WHERE ( id_conex_udp_min >= " + id1 + " AND id_conex_udp_min <= " + id2 + " ) GROUP BY campo1 ORDER BY campo2 DESC  " + limit;
            }

            //pam
            if (opcionGrafica.equalsIgnoreCase("PAM")) {                
                sql = "SELECT (conex_pam_host)campo1, SUM(conex_pam_conex)campo2, SUM(conex_pam_bytes_in)campo3, SUM(conex_pam_bytes_out)campo4, SUM(conex_pam_bytes_tot)campo5 FROM conex_pam_min WHERE ( id_conex_pam_min >= " + id1 + " AND id_conex_pam_min <= " + id2 + " ) GROUP BY campo1 ORDER BY campo2 DESC  " + limit;
            }


            //http
            if (opcionGrafica.equalsIgnoreCase("HTTP")) {                
                sql = "SELECT (conex_http_host)campo1, SUM(conex_http_conex)campo2, SUM(conex_http_bytes_in)campo3, SUM(conex_http_bytes_out)campo4, SUM(conex_http_bytes_tot)campo5 FROM conex_http_min WHERE ( id_conex_http_min >= " + id1 + " AND id_conex_http_min <= " + id2 + " ) GROUP BY campo1 ORDER BY campo2 DESC  " + limit;
            }


            //global
            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "SELECT (conex_host)campo1, SUM(conex_conex)campo2, SUM(conex_bytes_in)campo3, SUM(conex_bytes_out)campo4, SUM(conex_bytes_tot)campo5 FROM conex_min WHERE ( id_conex_min >= " + id1 + " AND id_conex_min <= " + id2 + " ) GROUP BY campo1 ORDER BY campo2 DESC  " + limit;
            }

        } catch (Exception e) {
        }//fin try catch

        return sql;

    }//getSqlVolumen
}//fin class

