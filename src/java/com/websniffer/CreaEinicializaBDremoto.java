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
 * @author root
 */
class CreaEinicializaBDremoto {

    static final Logger logger = Logger.getLogger(CreaEinicializaBDremoto.class);

    void crea(String host, String nomb_BD, String usuarioBD, String password, String cadena_jdbc, String minutoTabla, String PathArchZip, String nombArchsTXT_tmp) {
        try {
            ConectaBDRemoto conBDremoto = new ConectaBDRemoto();
            Statement st = conBDremoto.AbreConexionMysql(host, nomb_BD, usuarioBD, password, cadena_jdbc);
            CreaTablasBDremoto creaTablas = new CreaTablasBDremoto();
            creaTablas.creaTablasRemoto(st);
            creaTablas = null;
            CreaTablasTmpRemoto cTtmpR = new CreaTablasTmpRemoto();
            //cTtmpR.creaTablasTemporalesRemoto(st, minutoTabla, pamConfigArray);
            cTtmpR.creaTablasTemporalesRemoto(st, minutoTabla);
            cTtmpR = null;
            InicializaBDremoto iniBD = new InicializaBDremoto();
            iniBD.InicializaBDremoto(st);
            iniBD = null;
            LoadTxtBD cargaTxtBD = new LoadTxtBD();
            cargaTxtBD.cargaTxts(st, PathArchZip, nombArchsTXT_tmp, minutoTabla);
            cargaTxtBD = null;
            conBDremoto.CierraConexionMysql(st);
            conBDremoto = null;
            st.close();
        } catch (SQLException ex) {
            logger.error("Error en CreaEinicializaBDremoto: ", ex);
        }
    }
}
