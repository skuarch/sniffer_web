package com.websniffer;

/**
 *
 * @author skuarch
 */
public class SqlDetalleNavegacionTcp {

    public SqlDetalleNavegacionTcp() {
    }

    /**
     * 
     * @return String
     */
    public String getSqlDetalleNavegacionTcp(String fecha_inicial, String fecha_final, String limit1, String limit2, String label) {

        String sql = null;
        String limit = null;
        long id1 = new Fechas().fechaId(fecha_inicial);
        long id2 = new Fechas().fechaId(fecha_final);

        //checando el limit, esto debe de ser adaptable para las tablas
        if (limit1.equalsIgnoreCase("0") && limit2.equalsIgnoreCase("0")) {
            limit = " ";
        } else {
            limit = "limit " + limit1 + "," + limit2;
        }


        sql = "SELECT (nav_ip_navegacion)campo1, (nav_ip_vol_tot)campo2 FROM nav_ip_min WHERE (nav_ip = '" + label + "') AND id_nav_ip_min >= " + new Fechas().fechaId(fecha_inicial) + " AND (id_nav_ip_min <= " + new Fechas().fechaId(fecha_final) + " ) LIMIT 25;";

        return sql;

    }//fin getSqlDetalleNavegacionTcp
}//fin class

