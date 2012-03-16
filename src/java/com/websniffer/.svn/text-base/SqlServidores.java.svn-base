package com.websniffer;

/**
 * Clase que crea el sql para el volumen, los metodos solo regresan String
 * @author skuarch
 */
public class SqlServidores {

    //==========================================================================
    /**
     * Constructor
     */
    public SqlServidores() {
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
    public String getSqlServidores(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2, String ip_servidor, String puerto_servidor) {

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

            System.out.println("error:"+e);

        }

        return "SELECT  (servidor_min_fecha)campo0,(servidor_min_ip)campo1,(servidor_min_port)campo2,SUM(servidor_min_vol_in)campo3,SUM(servidor_min_vol_out)campo4,SUM(servidor_min_vol_tot)campo5,SUM(servidor_min_conex_tot)campo6,SUM(servidor_min_throughput_tot)campo7,MAX(servidor_min_tr)campo8,MIN(servidor_min_tr)campo9,AVG(servidor_min_tr)campo10 FROM servidor_min WHERE (id_servidor_min >= " + id1 + " AND id_servidor_min <= " + id2 + " ) AND (servidor_min_ip ='" + ip_servidor + "')  AND (servidor_min_port =" + puerto_servidor + ") GROUP BY servidor_min_ip,servidor_min_port,servidor_min_fecha ORDER BY servidor_min_vol_tot " + limit;

    }//getSqlVolumen

    /**
     * Regresa todos los registros
     * @param opcionGrafica     
     * @param fecha_inicial
     * @param fecha_final
     * @param limit1
     * @param limit2
     * @return String with sql
     */
    public String getSqlServidores(String opcionGrafica, String fecha_inicial, String fecha_final, String limit1, String limit2) {

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


        } catch (Exception e) {
        }

        return "SELECT (servidor_min_ip)campo1,(servidor_min_port)campo2,SUM(servidor_min_vol_in)campo3,SUM(servidor_min_vol_out)campo4,SUM(servidor_min_vol_tot)campo5,SUM(servidor_min_conex_tot)campo6,SUM(servidor_min_throughput_tot)campo7,MAX(servidor_min_tr)campo8,MIN(servidor_min_tr)campo9,AVG(servidor_min_tr)campo10 FROM servidor_min WHERE (id_servidor_min >= " + new Fechas().fechaId(fecha_inicial) + " AND id_servidor_min <= " + new Fechas().fechaId(fecha_final) + " ) GROUP BY servidor_min_ip,servidor_min_port ORDER BY servidor_min_vol_tot " + limit;

    }//getSqlVolumen
}//fin class

