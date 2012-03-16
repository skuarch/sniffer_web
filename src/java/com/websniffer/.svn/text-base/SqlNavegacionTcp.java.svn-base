package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlNavegacionTcp {

    //==========================================================================
    /**
     * Constructor
     */
    public SqlNavegacionTcp() {
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
    public String getSqlNavegacionTcp(String opcionGrafica,String fecha_inicial, String fecha_final, String limit1, String limit2) {

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
                sql = "SELECT (nav_ip)campo1, (SUM(nav_ip_vol_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2, COUNT(*)campo3 FROM nav_ip_min WHERE (id_nav_ip_min >= "+id1+" AND id_nav_ip_min <=  "+id2+" ) GROUP BY campo1 ORDER BY campo2 DESC "+limit;       
            }

        } catch (Exception e) {
        }//fin try catch

        return sql;

    }//getSqlVolumen
}//fin class

