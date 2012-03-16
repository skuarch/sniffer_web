/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.websniffer;

import java.sql.SQLException;
import java.sql.Statement;
import org.apache.log4j.Logger;

/**
 *
 * @author Puebla
 */
class LoadTxtBD {

static final Logger logger = Logger.getLogger(LoadTxtBD.class);

    void cargaTxts(Statement st,  String PathArchZip, String nombArchsTXT_tmp, String minutoTabla) {
            if (new CheckFile().exists(PathArchZip + "HTTP" + nombArchsTXT_tmp + ".txt")) {
                try {
                    st.execute("LOAD DATA LOCAL INFILE '" + PathArchZip + "HTTP" + nombArchsTXT_tmp + ".txt" + "' INTO TABLE http_min_" + minutoTabla + " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n'");
                } catch (SQLException ex) {
                    logger.error("Error al cargar archivo a la BD" + ex);
                }
            } else {
                logger.error("No existe el archivo: " + PathArchZip + "HTTP" + nombArchsTXT_tmp + ".txt");
            }
            if (new CheckFile().exists(PathArchZip + "HTTP_TR_" + nombArchsTXT_tmp + ".txt")) {
                try {
                    st.execute("LOAD DATA LOCAL INFILE '" + PathArchZip + "HTTP_TR_" + nombArchsTXT_tmp + ".txt" + "' INTO TABLE http_tr_min_" + minutoTabla + " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n'");
                } catch (SQLException ex) {
                    logger.error("Error al cargar archivo a la BD" + ex);
                }
            } else {
                logger.error("No existe el archivo: " + PathArchZip + "HTTP_TR_" + nombArchsTXT_tmp + ".txt");
            }
            if (new CheckFile().exists(PathArchZip + "TCP" + nombArchsTXT_tmp + ".txt")) {
                try {
                    st.execute("LOAD DATA LOCAL INFILE '" + PathArchZip + "TCP" + nombArchsTXT_tmp + ".txt" + "' INTO TABLE tcp_min_" + minutoTabla + " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n'");
                } catch (SQLException ex) {
                    logger.error("Error al cargar archivo a la BD" + ex);
                }
            } else {
                logger.error("No existe el archivo: " + PathArchZip + "TCP" + nombArchsTXT_tmp + ".txt");
            }
            if (new CheckFile().exists(PathArchZip + "TR" + nombArchsTXT_tmp + ".txt")) {
                try {
                    st.execute("LOAD DATA LOCAL INFILE '" + PathArchZip + "TR" + nombArchsTXT_tmp + ".txt" + "' INTO TABLE tr_min_" + minutoTabla + " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n'");
                } catch (SQLException ex) {
                    logger.error("Error al cargar archivo a la BD" + ex);
                }
            } else {
                logger.error("No existe el archivo: " + PathArchZip + "TR" + nombArchsTXT_tmp + ".txt");
            }
            if (new CheckFile().exists(PathArchZip + "UDP" + nombArchsTXT_tmp + ".txt")) {
                try {
                    st.execute("LOAD DATA LOCAL INFILE '" + PathArchZip + "UDP" + nombArchsTXT_tmp + ".txt" + "' INTO TABLE udp_min_" + minutoTabla + " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n'");
                } catch (SQLException ex) {
                    logger.error("Error al cargar archivo a la BD" + ex);
                }
            } else {
                logger.error("No existe el archivo: " + PathArchZip + "UDP" + nombArchsTXT_tmp + ".txt");
            }
            if (new CheckFile().exists(PathArchZip + "Indicadores" + nombArchsTXT_tmp + ".txt")) {
                try {
                    st.execute("LOAD DATA LOCAL INFILE '" + PathArchZip + "Indicadores" + nombArchsTXT_tmp + ".txt" + "' INTO TABLE indicadores_min_" + minutoTabla + " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n'");
                } catch (SQLException ex) {
                    logger.error("Error al cargar archivo a la BD" + ex);
                }
            } else {
                logger.error("No existe el archivo: " + PathArchZip + "Indicadores" + nombArchsTXT_tmp + ".txt");
            }
           
            PathArchZip = null;
            nombArchsTXT_tmp = null;
            minutoTabla = null;
    }
}
