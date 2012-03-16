package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class sqlVolTotal {

    //==========================================================================
    /**
     * Constructor.
     */
    public sqlVolTotal() {
    }//fin constructor

    //==========================================================================
    /**
     * Metodo encargado de crear el sql para el volumen<br>
     * si se le envia limi1 = 0 y limit2 = 0 no se creara ningun limite
     * @param opcionGrafica String
     * @param fecha_inicial String
     * @param fecha_final String
     * @return String con el sql
     */
    public String getSqlVolTotal(String opcionGrafica, String fecha_inicial, String fecha_final) {

        String sql = null;
        String limit = null;
        long id1 = new Fechas().fechaId(fecha_inicial);
        long id2 = new Fechas().fechaId(fecha_final);
        opcionGrafica = opcionGrafica.toLowerCase();

        try {

            if (opcionGrafica.equalsIgnoreCase("GLOBAL")) {
                sql = "SELECT SUM(vol_min_in)    campo1, SUM(vol_min_out)    campo2, SUM(vol_min_tot)    campo3 FROM vol_min WHERE (id_vol_min >= " + id1 + " AND id_vol_min <= " + id2 + ")";
            } else {
                sql = "SELECT SUM(vol_" + opcionGrafica + "_min_in)    campo1, SUM(vol_" + opcionGrafica + "_min_out)    campo2, SUM(vol_" + opcionGrafica + "_min_tot)    campo3 FROM vol_" + opcionGrafica + "_min WHERE (id_vol_" + opcionGrafica + "_min >= " + id1 + " AND id_vol_" + opcionGrafica + "_min <= " + id2 + ")";
            }

        } catch (Exception e) {
        } //fin try catch

        return sql;

    } //getSqlVolTotal
} //fin class

