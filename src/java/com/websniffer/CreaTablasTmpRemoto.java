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
class CreaTablasTmpRemoto {
    static final Logger logger = Logger.getLogger(CreaTablasTmpRemoto.class);

    void creaTablasTemporalesRemoto(Statement st, String minutoTabla) {
        try {
            st.execute("CREATE TABLE IF NOT EXISTS aplicacion_min_" + minutoTabla + " (IP_src bigint(20) NOT NULL,  Port_src INT(11) NOT NULL,  IP_dst bigint(20) NOT NULL,  Port_dst INT(11) NOT NULL,  bytes_src DOUBLE DEFAULT NULL,  paquetes_src DOUBLE DEFAULT NULL,  bytes_dst DOUBLE DEFAULT NULL,  paquetes_dst DOUBLE DEFAULT NULL,  bytes_tot DOUBLE DEFAULT NULL,  paquetes_tot DOUBLE DEFAULT NULL,  inicia DOUBLE DEFAULT NULL,  milisegundos_inicia DOUBLE DEFAULT NULL,  fin DOUBLE DEFAULT NULL,  milisegundos_fin DOUBLE DEFAULT NULL,  aplicacion VARCHAR(200) DEFAULT NULL,  PRIMARY KEY (IP_src,Port_src,IP_dst,Port_dst)) ENGINE=MYISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS http_min_" + minutoTabla + " (`IP_src` varchar(50) NOT NULL,  `Port_src` smallint(6) unsigned DEFAULT NULL,  `IP_dst` varchar(50) NOT NULL,  `Port_dst` smallint(6) unsigned DEFAULT NULL,  `bytes_src` int(10) unsigned DEFAULT NULL, `paquetes_src` int(10) unsigned DEFAULT NULL,  `bytes_dst` int(10) unsigned DEFAULT NULL,  `paquetes_dst` int(10) unsigned DEFAULT NULL,  `bytes_tot` int(10) unsigned DEFAULT NULL,  `paquetes_tot` int(10) unsigned DEFAULT NULL, `inicia` int(10) unsigned DEFAULT NULL,  `miliseg_inicia` int(10) unsigned DEFAULT NULL,  `fin` int(10) unsigned DEFAULT NULL,  `miliseg_fin` int(10) unsigned DEFAULT NULL,  `url` char(150) DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS pam_min_" + minutoTabla + " (`IP_src` varchar(50) NOT NULL,  `Port_src` smallint(6) unsigned DEFAULT NULL,  `IP_dst` varchar(50) NOT NULL,  `Port_dst` smallint(6) unsigned DEFAULT NULL,  `bytes_src` int(10) unsigned DEFAULT NULL,  `paquetes_src` int(10) unsigned DEFAULT NULL,  `bytes_dst` int(10) unsigned DEFAULT NULL,  `paquetes_dst` int(10) unsigned DEFAULT NULL,  `bytes_tot` int(10) unsigned DEFAULT NULL,  `paquetes_tot` int(10) unsigned DEFAULT NULL, `inicia` int(10) unsigned DEFAULT NULL,  `miliseg_inicia` int(10) unsigned DEFAULT NULL,  `fin` int(10) unsigned DEFAULT NULL,  `miliseg_fin` int(10) unsigned DEFAULT NULL,  `cve_edif_a` int(10) unsigned DEFAULT NULL,  `cve_edif_b` int(10) unsigned DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS tcp_min_" + minutoTabla + " (`IP_src` varchar(50) NOT NULL,  `Port_src` smallint(6) unsigned DEFAULT NULL,  `IP_dst` varchar(50) NOT NULL,  `Port_dst` smallint(6) unsigned DEFAULT NULL,  `bytes_src` int(10) unsigned DEFAULT NULL,  `paquetes_src` int(10) unsigned DEFAULT NULL,  `bytes_dst` int(10) unsigned DEFAULT NULL,  `paquetes_dst` int(10) unsigned DEFAULT NULL,  `bytes_tot` int(10) unsigned DEFAULT NULL,  `paquetes_tot` int(10) unsigned DEFAULT NULL, `inicia` int(10) unsigned DEFAULT NULL,  `miliseg_inicia` int(10) unsigned DEFAULT NULL,  `fin` int(10) unsigned DEFAULT NULL,  `miliseg_fin` int(10) unsigned DEFAULT NULL,  `cve_edif_a` int(10) unsigned DEFAULT NULL,  `cve_edif_b` int(10) unsigned DEFAULT NULL,`numRSTs` int(10) DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS tr_min_" + minutoTabla + " ( `IP_src` varchar(50) NOT NULL,  `Port_src` int(10) unsigned DEFAULT NULL,  `IP_dst` varchar(50) NOT NULL, `Port_dst` int(10) unsigned DEFAULT NULL,  `segundos` int(5) unsigned DEFAULT NULL,  `milisegundos` int(10) unsigned DEFAULT NULL,  `inicia` int(10) unsigned DEFAULT NULL,  `bytes_src` int(10) unsigned DEFAULT NULL,  `bytes_dst` int(10) unsigned DEFAULT NULL,  `bytes_tot` int(10) unsigned DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS udp_min_" + minutoTabla + " (`IP_src` varchar(50) NOT NULL,  `Port_src` smallint(6) unsigned DEFAULT NULL,  `IP_dst` varchar(50) NOT NULL,  `Port_dst` smallint(6) unsigned DEFAULT NULL,  `bytes_src` int(10) unsigned DEFAULT NULL,  `paquetes_src` int(10) unsigned DEFAULT NULL,  `bytes_dst` int(10) unsigned DEFAULT NULL,  `paquetes_dst` int(10) unsigned DEFAULT NULL,  `bytes_tot` int(10) unsigned DEFAULT NULL,  `paquetes_tot` int(10) unsigned DEFAULT NULL, `inicia` int(10) unsigned DEFAULT NULL,  `miliseg_inicia` int(10) unsigned DEFAULT NULL,  `fin` int(10) unsigned DEFAULT NULL,  `miliseg_fin` int(10) unsigned DEFAULT NULL,  `cve_edif_a` int(10) unsigned DEFAULT NULL,  `cve_edif_b` int(10) unsigned DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS http_tr_min_" + minutoTabla + " (  IP_src varchar(15) DEFAULT NULL,  IP_dst varchar(15) DEFAULT NULL,  Port_dst int(11) DEFAULT NULL,  referer longtext,  uri longtext,  conection_time double DEFAULT NULL,  idle_time_0 double DEFAULT NULL,  request_time double DEFAULT NULL,  response_time double DEFAULT NULL,  idle_time_1 double DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS indicadores_min_" + minutoTabla + " (paquetesARP bigint(20) DEFAULT NULL,  bytesARP bigint(20) DEFAULT NULL,  paquetesIPV6 bigint(20) DEFAULT NULL,  bytesIPV6 bigint(20) DEFAULT NULL,  icmpPackets bigint(20) DEFAULT NULL,  icmpBytes bigint(20) DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            minutoTabla = null;
        } catch (SQLException ex) {
            logger.error("Error al crear Tablas tmp del remoto:  " + ex);
        }
    }
}
