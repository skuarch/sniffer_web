package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlVolumen {

    //==========================================================================
    /**
     * Constructor.
     */
    public SqlVolumen() {
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
    public String getSqlVolumen(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

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


            if (opcionGrafica.equalsIgnoreCase("TCP")) {
                sql = "select (vol_tcp_min_in)campo1,(vol_tcp_min_out)campo2,(vol_tcp_min_tot)campo3,(vol_tcp_min_fecha)campo4 from vol_tcp_min where id_vol_tcp_min >= " + id1 + " and id_vol_tcp_min <= " + id2 + " order by id_vol_tcp_min asc " + limit;
            }


            if (opcionGrafica.equalsIgnoreCase("UDP")) {
                sql = "select (vol_udp_min_in)campo1,(vol_udp_min_out)campo2,(vol_udp_min_tot)campo3,(vol_udp_min_fecha)campo4 from vol_udp_min where id_vol_udp_min >= " + id1 + " and id_vol_udp_min <= " + id2 + " order by id_vol_udp_min asc " + limit;
            }


            if (opcionGrafica.equalsIgnoreCase("PAM")) {
                sql = "select (vol_pam_min_in)campo1,(vol_pam_min_out)campo2,(vol_pam_min_tot)campo3,(vol_pam_min_fecha)campo4 from vol_pam_min where id_vol_pam_min >= " + id1 + " and id_vol_pam_min <= " + id2 + " order by id_vol_pam_min asc " + limit;
            }


            if (opcionGrafica.equalsIgnoreCase("HTTP")) {
                sql = "select (vol_http_min_in)campo1,(vol_http_min_out)campo2,(vol_http_min_tot)campo3,(vol_http_min_fecha)campo4 from vol_http_min where id_vol_http_min >= " + id1 + " and id_vol_http_min <= " + id2 + " order by id_vol_http_min asc " + limit;
            }


            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "select (vol_min_in)campo1,(vol_min_out)campo2,(vol_min_tot)campo3,(vol_min_fecha)campo4 from vol_min where id_vol_min >= " + id1 + " and id_vol_min <= " + id2 + " order by id_vol_min asc " + limit;
            }

        } catch (Exception e) {
        }//fin try catch

        return sql;

    }//getSqlVolumen
}//fin class

