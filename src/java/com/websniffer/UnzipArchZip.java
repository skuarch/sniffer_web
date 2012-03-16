/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.websniffer;

import java.io.File;
import org.apache.log4j.Logger;

/**
 *
 * @author Puebla
 */
class UnzipArchZip {

    static final Logger logger = Logger.getLogger(UnzipArchZip.class);

    public void unzipArchZip(String nombArchzip, String rutaZIP) {
        File archZip = new File(rutaZIP + nombArchzip);
        if (archZip.exists()) {
            try {
                Process pr = Runtime.getRuntime().exec("unzip -o -j "
                       + rutaZIP + nombArchzip + " -d " + rutaZIP);
                archZip = null;
            } catch (Exception ex) {
                archZip = null;
                logger.error("Error al descomprimir. Error: " + ex);
            }
        }
        else {
                    archZip = null;
                   logger.error("Error: no se encuentra el archivo " + rutaZIP + nombArchzip);
        }
        archZip = null;
    }//fin de unzipArchZip

    void borraArchZip(String nombArchzip, String rutaZIP) {        
        File archZip = new File(rutaZIP + nombArchzip);
        if (archZip.exists()) {
            try {
                if (!(archZip.delete())) {
                    archZip = null;
                    logger.error("Error al borrar el archivo " + nombArchzip);
                }
            } catch (Exception ex) {
                archZip = null;
                logger.error("Error borrando archivo zip: " + ex);
            }
        }else {
            archZip = null;
            logger.error("Error: no se encuentra el archivo " + rutaZIP + nombArchzip);
        }
        archZip = null;
    }//fin de borraArchZip
}
