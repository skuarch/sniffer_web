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
 * @author root
 */
public class ConectaBDRemoto {

    static final Logger logger = Logger.getLogger(ConectaBDRemoto.class);
    
    Connection conexion = null;
    Statement statement=null;


    /**
     * Realiza la conexion a la Base de Datos y regresa un Statement.
     * @param host el host donde se encuentra la Base de Datos
     * @param BD nombre de la Base de Datos
     * @param user usuario de la Base de Datos
     * @param pass password para la Base de Datos
     * @param cadena_jdbc string con la cadena jdbc   *
     */
    public Statement AbreConexionMysql(String host, String BD, String user, String pass, String cadena_jdbc) {

        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(cadena_jdbc + BD, user, pass);

            try {
                statement = conexion.createStatement();
            } catch (SQLException s) {
                logger.error("Error al tratar de conectarse a Mysql en AbreConexionMysql: " + s);
            }
        } catch (Exception e) {
            logger.error("Error en la conexion a la BD " + e);
        }
        return statement;
    }


    

    /**
     * Cierra la conexi�n a la Base de Datos.
     */
    public void CierraConexionMysql(Statement st) {
//        Connection conexion;
        try {
            conexion.close();
            st.close();
        } catch (SQLException e) {
            logger.error("Error tratando de cerrar la conexion a MySQL" + e);
        }
    }



    /**
     * Ejecuta un query que no regresa datos.
     */
    public void update(Statement statement,String query) {
        try {
            statement.executeUpdate(query);
        } catch (SQLException e) {
            logger.error("Error al realizar el query en update: " + e);
        }
    }





        /**
     * regresa un solo valor de un query, debe ser de tipo long.
     * @param query
     * @return resultado
     */
    public ResultSet select(Statement statement, String query) {
        ResultSet rs = null;
        
        try {
            statement.executeQuery(query);
            rs = statement.getResultSet();
            
        } catch (SQLException e) {
            logger.error("Error en el query select: " + e);
        }
        return rs;
    }


}
