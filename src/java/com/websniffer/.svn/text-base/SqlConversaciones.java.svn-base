package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlConversaciones {

    //==========================================================================
    /**
     * Constructor.
     */
    public SqlConversaciones() {
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
    public String getSqlConversaciones(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2, String separador) {

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

            if (!opcionGrafica.equalsIgnoreCase("tcp")) {
                sql = "SELECT CONCAT(conv_dura_min_" + opcionGrafica + "_ip_src,'" + separador + "',conv_dura_min_" + opcionGrafica + "_ip_dst)    campo0, (SUM(conv_dura_min_" + opcionGrafica + "_bytes_in) * 100) / (SELECT SUM(vol_" + opcionGrafica + "_min_tot)  FROM vol_" + opcionGrafica + "_min WHERE id_vol_" + opcionGrafica + "_min >= " + id1 + " AND id_vol_" + opcionGrafica + "_min <= " + id2 + ")campo1, (SUM(conv_dura_min_" + opcionGrafica + "_bytes_out) * 100) / (SELECT SUM(vol_" + opcionGrafica + "_min_tot)  FROM vol_" + opcionGrafica + "_min WHERE id_vol_" + opcionGrafica + "_min >= " + id1 + " AND id_vol_" + opcionGrafica + "_min <= " + id2 + ")campo2, (SUM(conv_dura_min_" + opcionGrafica + "_bytes_tot) * 100) / (SELECT SUM(vol_" + opcionGrafica + "_min_tot)  FROM vol_" + opcionGrafica + "_min WHERE id_vol_" + opcionGrafica + "_min >= " + id1 + " AND id_vol_" + opcionGrafica + "_min <= " + id2 + ")campo3, SUM(conv_dura_min_" + opcionGrafica + "_segundos)    campo4 FROM conv_duracion_" + opcionGrafica + "_min WHERE (id_conv_dura_" + opcionGrafica + "_min >= " + id1 + " AND id_conv_dura_" + opcionGrafica + "_min <= " + id2 + ") GROUP BY conv_dura_min_" + opcionGrafica + "_ip_src,conv_dura_min_" + opcionGrafica + "_ip_dst ORDER BY campo3 DESC " +limit;
            } else {
                sql = "SELECT CONCAT(conv_dura_min_ip_src,'" + separador + "',conv_dura_min_ip_dst)    campo0, (SUM(conv_dura_min_bytes_in) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo1, (SUM(conv_dura_min_bytes_out) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo2, (SUM(conv_dura_min_bytes_tot) * 100) / (SELECT SUM(vol_min_tot)  FROM vol_min WHERE id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")campo3, SUM(conv_dura_min_segundos)    campo4 FROM conv_duracion_min WHERE (id_conv_dura_min >= " + id1 + " AND id_conv_dura_min <= " + id2 + ") GROUP BY conv_dura_min_ip_src,conv_dura_min_ip_dst ORDER BY campo3 DESC "+limit;
            }




        } catch (Exception e) {
        }//fin try catch

        return sql;

    }//getSqlVolumen
}//fin class

