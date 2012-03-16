package com.websniffer;

import java.sql.ResultSet;

/**
 * Esta clase se conecta a la base de datos del ws<br>
 * y regresa el usuario y password para conectarse a la base de los remotos<br>
 * utiliza la clase ConectPool
 * @author skuarch
 */
public class ParametrosConexionRemoto {

    private String context;

    //=================================
    /**
     * Constructor
     */
    public ParametrosConexionRemoto(String context) {

        try {
            this.context = context;
        } catch (Exception e) {

            System.out.println("Error Constructor parametrosConexion" + e);

        }

    }//fin constructor

    //=================================
    /**
     * Este metodo remplaza los puntos por " _ " de una ip que le envias por parametro     
     * @return String
     */
    public String ReplaceDot(String ipRemoto) {

        try {

            ipRemoto = ipRemoto.replaceAll(".", "_");

        } catch (Exception e) {

            System.out.println("Error ReplaceDot" + e);

        }

        return ipRemoto;
    }//replaceDot

    //=================================
    public String getDBRemoto(String ipRemoto) {

        String DBRemoto = null;


        try {

            DBRemoto = "wsweb_" + ReplaceDot(ipRemoto);

        } catch (Exception e) {

            System.out.println("Error getDBRemoto" + e);

        }

        ipRemoto = null;
        return DBRemoto;
    }//fin getDBRemoto

    //=================================
    public String getUserDB(String ipRemoto) {

        String sql = null;
        String userDb = null;
        ResultSet rs = null;

        try {

            sql = "SELECT * FROM remoto_ip WHERE id_ip_remoto = '" + ipRemoto + "'";

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            userDb = rs.getString("remoto_bd_usuario");


            rs.close();
            rs = null;
            sql = null;
            ipRemoto = null;
        } catch (Exception e) {
            System.out.println("Error getUserDB " + e);
        }


        return userDb;

    }//fin getUserDb

    //=================================
    public String getPassDB(String ipRemoto) {

        String sql = null;
        String passDb = null;
        ResultSet rs = null;

        try {

            sql = "SELECT * FROM remoto_ip WHERE id_ip_remoto = '" + ipRemoto + "'";

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            passDb = rs.getString("remoto_bd_password");


            rs.close();
            rs = null;
            sql = null;
            ipRemoto = null;
        } catch (Exception e) {
            System.out.println("Error getUserDB " + e);
        }


        return passDb;

    }//fin getPassDb

    //=================================
    /**
     * Este metodo regresa el cadena jdbc<br>
     *
     * @param ipRemoto ip del dispositivo remoto (ws-remoto)
     * @param ipServerWS ip del servidor web donde esta el sitio
     * @return String
     */
    public String getCadenaJdbcRemoto(String ipRemoto, String ipServerWS) {

        String cadenaJdbc = null;

        try {

            cadenaJdbc = "jdbc:mysql://" + ipServerWS + ":3306/" + getDBRemoto(ipRemoto);

        } catch (Exception e) {

            System.out.println("error cadena jdbc " + e);

        }


        return cadenaJdbc;
    }//fin getCadenaJdbcRemoto

    //=================================
    /**
     * Destructor
     */
    public void destructor() {

        try {
        } catch (Exception e) {

            System.out.println("Error Destructor ParametrosConexion" + e);

        }

    }//fin destructor
}//fin class

