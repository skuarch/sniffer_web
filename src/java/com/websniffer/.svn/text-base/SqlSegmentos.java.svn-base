package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlSegmentos {

    //==========================================================================
    /**
     * Constructor
     */
    public SqlSegmentos() {
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
    public String getSqlSegmentos(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

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

            opcionGrafica = opcionGrafica.toLowerCase();

            //global
            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "SELECT (segmentos_segmento)    campo1, (SUM(segmentos_bytes_in) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2,  (SUM(segmentos_bytes_out) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3, (SUM(segmentos_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo4  FROM segmentos_min WHERE (id_segmentos_min >= " + id1 + " AND id_segmentos_min <= " + id2 + ") GROUP BY segmentos_segmento ORDER BY campo4 DESC " + limit;
            } else {
                sql = "SELECT (segmentos_" + opcionGrafica + "_segmento)    campo1, (SUM(segmentos_" + opcionGrafica + "_bytes_in) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2,  (SUM(segmentos_" + opcionGrafica + "_bytes_out) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3, (SUM(segmentos_" + opcionGrafica + "_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo4  FROM segmentos_" + opcionGrafica + "_min WHERE (id_segmentos_" + opcionGrafica + "_min >= " + id1 + " AND id_segmentos_" + opcionGrafica + "_min <= " + id2 + ") GROUP BY segmentos_" + opcionGrafica + "_segmento ORDER BY campo4 DESC " + limit;
            }

        } catch (Exception e) {
        }//fin try catch        

        return sql;

    }//getSqlVolumen
}//fin class

