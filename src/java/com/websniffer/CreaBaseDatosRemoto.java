/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websniffer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.log4j.Logger;

/**
 *
 * @author Puebla
 */
class CreaBaseDatosRemoto {

    static final Logger logger = Logger.getLogger(CreaBaseDatosRemoto.class);

    /**
     * Este método crea la Base de Datos del Remoto si no existe.
     * @throws SQLException
     *
     */
    public void CreaBD(String user, String pass, String BD_name) {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/", user, pass);
            Statement st = con.createStatement();

            st.executeUpdate("CREATE DATABASE IF NOT EXISTS " + BD_name);
            st.close();
            con.close();

        } catch (Exception e) {
            logger.error("Error al crear la BD del remoto: " + e);
        }
    }



    //*********************************************************************************

    public boolean dbExists(String user, String pass,String ipBD, String BD_name) {
        ResultSet rs = null;
        Connection con = null;
        boolean existe = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ipBD + "/", user, pass);
            Statement st = con.createStatement();

            rs = st.executeQuery("SHOW DATABASES");

            while (rs.next()) {
                if (rs.getString(1).equalsIgnoreCase(BD_name)) {
                    existe = true;
                    continue;
                }
            }


            st.close();
            con.close();

        } catch (Exception e) {
            logger.error("ERROR CreaBaseDatosRemoto().dbExists(): " + e);
        }

        return existe;
    }
}
