/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websniffer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author root
 */
class MatrizSumalizacion {

    static final Logger logger = Logger.getLogger(MatrizSumalizacion.class);

    public int[] ObtieneDatosQuery(ResultSet rs) {
        int[] arrayDeEnteros = null;

        try {
            rs.last();
            int elementosTabla = rs.getRow();
            rs.beforeFirst();

            arrayDeEnteros = new int[elementosTabla + 1];

            int i = 0;

            // ciclo para obtener los valores de las filas
            while (rs.next()) {
                arrayDeEnteros[i] = rs.getInt(1);
                i++;
            }
         
        } catch (SQLException e) {
            logger.error("Error en el query:" + e);
        }
        return arrayDeEnteros;
    }




    /**
     * Este método regresa una matriz de Strings.
     * @query : query a realizar
     * @valores : numero de columnas que regresa el query
     * @return valoresMatriz
     */
    public String[][] ObtieneMatrizQuery(ResultSet rs, int valores) {
        
        String[][] valoresMatriz = null;

        try {
            rs.last();
            int elementosTabla = rs.getRow();
            rs.beforeFirst();            
            
            valoresMatriz = new String[elementosTabla][valores];


            int i = 0; //filas
            // ciclo para obtener los valores de las filas
            while (rs.next()) { //columnas
                for (int j = 0; j < valores; j++) {
                    valoresMatriz[i][j] = rs.getString(1 + j);                    
                }
                i++;
            }


        } catch (SQLException e) {
            logger.error("Error en el método ObtieneMatrizQuery(): " + e);
        }

        return valoresMatriz;
    }




    /**
     * Obtiene un arreglo con el resultado del query.
     * @return arrayDeCadenas
     */
    public String[] ObtieneCadenasQuery(ResultSet rs) {
        
        String[] arrayDeCadenas = null;

        try {
            //para obtener el número de filas
            //rs.last();
            //int elementosTabla = rs.getRow();
            //rs.beforeFirst();
            int elementosTabla = getNumRows(rs);

            arrayDeCadenas = new String[elementosTabla + 1];

            int i = 0;
            // ciclo para obtener los valores de las filas
            while (rs.next()) {
                arrayDeCadenas[i] = rs.getString(1);
                i++;
            }
            
        } catch (SQLException e) {
            logger.error("Error en ObtieneCadenasQuery: " + e);
        }
        return arrayDeCadenas;
    }



    /**
     * regresa un solo valor de un query, debe ser de tipo long.
     * @param query
     * @return resultado
     */
    public long RegresaDatosQuery(ResultSet rs) {

        long resultado = 0;

        try {
            int i = 0;
            // ciclo para obtener los valores de las filas
            while (rs.next()) {
                resultado = rs.getInt(1);
                i++;
            }
         
        } catch (SQLException e) {
            logger.error("Error en RegresaDatosQuery: " + e);
        }
        return resultado;
    }




        /**
     * Obtiene una matriz de doubles.
     * @return
     */
    public double[][] ObtieneMatrizQuery(ResultSet rs) {

        double[][] matriz = null;

        try {
            int elementosTabla = 0;


            rs.last();
            elementosTabla = rs.getRow();
            rs.beforeFirst();

            matriz = new double[elementosTabla + 1][2];

            int i = 0;
            // ciclo para obtener los valores de las filas
            while (rs.next()) {
                matriz[i][0] = rs.getDouble(1);
                matriz[i][1] = rs.getDouble(2);
                i++;
            }

        } catch (SQLException e) {
            logger.error("Error en ObtieneMatrizQuery: " + e);
        }
        return matriz;
    }


    
    public int getNumRows(ResultSet rs) {

        if (rs == null) {
            logger.error("ERROR: MatrizSumalizacion().getNumRows().rs is null ");
        }

        int numRows = 0;

        try {

            rs.last();
            numRows = rs.getRow();
            rs.beforeFirst();

        } catch (Exception e) {
            logger.error("ERROR: MatrizSumalizacion().getNumRows() " + e);
        }
        return numRows;
    }    

}
