/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websniffer;

import org.apache.log4j.Logger;

/**
 *
 * @author puebla
 */
class UpdateRemoto {

    static final Logger logger = Logger.getLogger(UpdateRemoto.class);

    void update(String context,String IP_remoto_tmp, String nomb_BD, String usuarioBD) {
        ConnectPool cp = new ConnectPool(context);

        try {
            String proyecto = context.substring(1, context.length());
            cp.update("insert ignore into collectors (collector_ip, collector_hostname,collector_database_ip, "
                    + "collector_database_user,collector_database_password, collector_pool, collector_site,collector_description) values ('"
                    + IP_remoto_tmp.replace("_", ".") + "','" + IP_remoto_tmp.replace("_", ".") + "','localhost'," + "'root','vitalnoc','jdbc/"
                    + nomb_BD + "_pool','" + IP_remoto_tmp.replace("_", ".") + "', '" + proyecto + "')");

//            cp.update("UPDATE collectors SET collector_database_user = (SELECT CONCAT('" + proyecto + "_" + "',proyectoID)  FROM (SELECT collector_id proyectoID  FROM collectors WHERE collector_description LIKE '" + proyecto + "' AND collector_ip LIKE '" + IP_remoto_tmp.replace("_", ".") + "')xx) WHERE collector_description LIKE '" + proyecto + "' AND collector_ip LIKE '" + IP_remoto_tmp.replace("_", ".") + "'");
//
//            ResultSet rsUsuario = cp.select("SELECT collector_database_user FROM collectors WHERE collector_ip LIKE '" + IP_remoto_tmp.replace("_", ".") + "' AND collector_description LIKE '" + proyecto + "'");
//            rsUsuario.next();
//            usuarioBD = rsUsuario.getString(1);
//            rsUsuario.close();
//            rsUsuario = null;
//
//            cp.update("CREATE USER " + usuarioBD + " IDENTIFIED BY 'vitalnoc'");
//            cp.update("GRANT ALL ON *.* TO " + usuarioBD);
            cp = null;
            proyecto = null;
        } catch (Exception e) {
            cp = null;
            logger.error("Error al dar de alta el remoto: " + e);
        }
    }
}
