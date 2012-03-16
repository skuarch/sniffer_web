package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlAplicaciones {

    //==========================================================================
    /**
     * Constructor
     */
    public SqlAplicaciones() {
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
    public String getSqlAplicaciones(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

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


        } catch (Exception e) {

            System.out.println("error:" + e);

        }

        return "SELECT (vol_min_aplicacion_aplicacion)campo1, (vol_min_aplicacion_bytes_in)campo2, (vol_min_aplicacion_bytes_out)campo3 FROM vol_min_aplicacion WHERE (id_vol_min_aplicacion >= " + id1 + " AND id_vol_min_aplicacion <= " + id2 + " )GROUP BY campo1 order BY vol_min_aplicacion_bytes_tot DESC " + limit;

    }//getSqlAplicaciones




    //==========================================================================
    public String getDetalleAplicaciones(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2, String app,String replace){

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


        } catch (Exception e) {

            System.out.println("error:" + e);

        }

        return "SELECT (detalle_app_min_fecha)campo0, REPLACE(detalle_app_min_ip_src,',','<br>')campo1, REPLACE(detalle_app_min_ip_aplicacion,',','<br>')campo2, REPLACE(detalle_app_min_puerto_aplicacion,',','<br>')campo3, REPLACE(detalle_app_min_bytes_in,',','<br>')campo4, REPLACE(detalle_app_min_bytes_out,',','<br>')campo5, REPLACE(detalle_app_min_bytes_tot,',','<br>')campo6, REPLACE(detalle_app_min_aplicacion,',','<br>')campo7 FROM detalle_app_min WHERE (id_detalle_app_min >= " +id1+ " AND id_detalle_app_min <= "+id2+") AND detalle_app_min_aplicacion = '"+app+"' GROUP BY detalle_app_min_aplicacion, detalle_app_min_puerto_aplicacion, detalle_app_min_puerto_aplicacion  ORDER BY campo6 " + limit;

        
    } // end getDetalleAplicaciones

}//fin class

