package com.websniffer;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class GraficaDatos {

    static final Logger logger = Logger.getLogger(GraficaDatos.class);
    private double[] data0;
    private String[] data0S;
    private String[] labels;
    private int i;
    private String context;

    public GraficaDatos(String context) {
        data0 = null;
        labels = null;
        i = 0;
        this.context = context;
    } //fin constructor

    //==========================================================================
    /*
    public double[] getData(ResultSet r, String campo, Long unidadMedidaLong) {

        //el tamaño del arreglo es igual al numero de filas del resultset
        data0 = new double[new ConnectPool(this.context).getNumFilas(r)];

        try {
            i = 0;

            if (data0.length > 0) {

                while (r.next()) {

                    data0[i] = r.getDouble(campo) / unidadMedidaLong;

                    i++;

                } //fin while

                //r.beforeFirst();
                r = null;

            } else {

                data0[0] = 0;

            }

        } catch (SQLException e) {
            logger.error("ERROR: getData()\n", e);
        }
        unidadMedidaLong = (long) 0;
        return data0;
    } //fin getData
     *
     */

    public double[] getData(ResultSet r, String campo, Long unidadMedidaLong) {

        //el tamaño del arreglo es igual al numero de filas del resultset
        data0 = new double[new ConnectPool(this.context).getNumFilas(r)];

        try {
            i = 0;

            if (data0.length > 0) {

                while (r.next()) {

                    data0[i] = r.getDouble(campo) / unidadMedidaLong;

                    i++;

                } //fin while

                //r.beforeFirst();
                r = null;

            } else {

                data0[0] = 0;

            }

        } catch (SQLException e) {
            logger.error("ERROR: getData()\n", e);
        }
        unidadMedidaLong = (long) 0;
        return data0;
    } //fin getData

    //==========================================================================
    public double[] getData(ResultSet r, String campo) {

        //el tamaño del arreglo es igual al numero de filas del resultset
        data0 = new double[new ConnectPool(this.context).getNumFilas(r)];

        try {
            
            i = 0;

            while (r.next()) {

                data0[i] = r.getDouble(campo);

                i++;

            } //fin while


            //r.beforeFirst();
            r = null;

        } catch (SQLException e) {
            logger.error("ERROR: getData()\n", e);
        }

        return data0;
    } //fin getData

    //==========================================================================
    //si no se usa hay que borrarla
    public String[] getDataString(ResultSet r, String campo) {

        //el tamaño del arreglo es igual al numero de filas del resultset
        data0S = new String[new ConnectPool(this.context).getNumFilas(r)];

        try {
            i = 0;
            while (r.next()) {

                data0S[i] = r.getString(campo);

                i++;

            } //fin while

            //r.beforeFirst();
            r = null;

        } catch (SQLException e) {
            logger.error("ERROR: getDataString()\n", e);
        }
        return data0S;
    } //fin getData

    //==========================================================================
    public String[] getLabels(ResultSet r, String campo) {

        labels = new String[new ConnectPool(this.context).getNumFilas(r)];

        try {
            i = 0;
            while (r.next()) {

                labels[i] = r.getString(campo);
                labels[i] =labels[i].replace("http://", "");
                labels[i] =labels[i].replace("www.", "");

                i++;

            } //fin while

            //r.beforeFirst();
            r = null;

        } catch (SQLException e) {
            logger.error("ERROR: getLabels()\n", e);
        }

        return labels;
    } //fin get labels

    //==========================================================================
    public String[] getLabelsFechas(ResultSet r, String campo) {

        labels = new String[new ConnectPool(this.context).getNumFilas(r)];

        try {
            i = 0;
            while (r.next()) {

                labels[i] = r.getString(campo).substring(2, 16);
                i++;

            } //fin while

            //r.beforeFirst();
            r = null;

        } catch (SQLException e) {
            logger.error("ERROR: getLabelsFecha()\n", e);
        }

        return labels;
    } //fin get fechas labels
} //fin class

