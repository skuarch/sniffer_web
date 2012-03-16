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
class CreaTablasBDremoto {

    static final Logger logger = Logger.getLogger(CreaTablasBDremoto.class);

    public void creaTablasRemoto(Statement st) {        
        try {
            st.execute("CREATE TABLE IF NOT EXISTS pam_config (`puerto` int(5) DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS alarma_min (`id_alarma_min` bigint(20) NOT NULL,  `alarma_nivel` int(1) default NULL,  `alarma_descripcion` varchar(100) default NULL, `alarma_sobrepaso` bigint(20) DEFAULT NULL, `alarma_fecha` datetime default NULL,  `alarma_tipo` int(1) default NULL COMMENT '0 entrada 1 salida',  `alarma_correo` int(1) default NULL COMMENT '0 no enviado 1 si enviado',  PRIMARY KEY  (`id_alarma_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS alarma_throughput_min (id_alarma_throughput_min bigint(20) NOT NULL,  alarma_throughput_nivel int(1) DEFAULT NULL,  alarma_throughput_descripcion varchar(100) DEFAULT NULL,  alarma_throughput_sobrepaso bigint(20) DEFAULT NULL,  alarma_throughput_fecha datetime DEFAULT NULL,  alarma_throughput_tipo int(1) DEFAULT NULL COMMENT '0 entrada 1 salida',  alarma_throughput_correo int(1) DEFAULT NULL COMMENT '0 no enviado 1 si enviado',  PRIMARY KEY (id_alarma_throughput_min)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS aplicaciones_sam (id_sam INT(11) NOT NULL AUTO_INCREMENT,  ip_sam VARCHAR(16) NOT NULL,  aplicacion_sam VARCHAR(200) NOT NULL,  PRIMARY KEY (id_sam,ip_sam,aplicacion_sam),  UNIQUE KEY id_sam (id_sam)) ENGINE=MYISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS conex_http_min (`id_conex_http_min` bigint(10) NOT NULL DEFAULT '0',  `conex_http_host` varchar(50) NOT NULL DEFAULT '',  `conex_http_conex` int(10) DEFAULT NULL,  `conex_http_bytes_in` int(10) DEFAULT NULL,  `conex_http_bytes_out` int(10) DEFAULT NULL,  `conex_http_bytes_tot` int(10) DEFAULT NULL,  `conex_http_host_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `conex_http_host_b` tinyint(1) NOT NULL DEFAULT '0',  `conex_http_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conex_http_min`,`conex_http_host`,`conex_http_host_a`,`conex_http_host_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS conex_min (`id_conex_min` bigint(10) NOT NULL DEFAULT '0',  `conex_host` varchar(50) NOT NULL DEFAULT '',  `conex_conex` int(10) DEFAULT NULL,  `conex_bytes_in` int(10) DEFAULT NULL,  `conex_bytes_out` int(10) DEFAULT NULL,  `conex_bytes_tot` int(10) DEFAULT NULL,  `conex_tipo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=tcp, 0=udp',  `conex_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conex_min`,`conex_host`,`conex_tipo`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS conex_pam_min (`id_conex_pam_min` bigint(10) NOT NULL DEFAULT '0',  `conex_pam_host` varchar(50) NOT NULL DEFAULT '',  `conex_pam_conex` int(10) DEFAULT NULL,  `conex_pam_bytes_in` int(10) DEFAULT NULL,  `conex_pam_bytes_out` int(10) DEFAULT NULL,  `conex_pam_bytes_tot` int(10) DEFAULT NULL,  `conex_pam_host_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `conex_pam_host_b` tinyint(1) NOT NULL DEFAULT '0',  `conex_pam_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conex_pam_min`,`conex_pam_host`,`conex_pam_host_a`,`conex_pam_host_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS conex_tcp_min (`id_conex_tcp_min` bigint(10) NOT NULL DEFAULT '0',  `conex_tcp_host` varchar(50) NOT NULL DEFAULT '',  `conex_tcp_conex` int(10) DEFAULT NULL,  `conex_tcp_bytes_in` int(10) DEFAULT NULL,  `conex_tcp_bytes_out` int(10) DEFAULT NULL,  `conex_tcp_bytes_tot` int(10) DEFAULT NULL,  `conex_tcp_host_a` tinyint(1) DEFAULT NULL COMMENT '1= src, 0= dst',  `conex_tcp_host_b` tinyint(1) DEFAULT NULL,  `conex_tcp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conex_tcp_min`,`conex_tcp_host`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS conex_udp_min (`id_conex_udp_min` bigint(10) NOT NULL DEFAULT '0',  `conex_udp_host` varchar(50) NOT NULL DEFAULT '',  `conex_udp_conex` int(10) DEFAULT NULL,  `conex_udp_bytes_in` int(10) DEFAULT NULL,  `conex_udp_bytes_out` int(10) DEFAULT NULL,  `conex_udp_bytes_tot` int(10) DEFAULT NULL,  `conex_udp_host_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `conex_udp_host_b` tinyint(1) NOT NULL DEFAULT '0',  `conex_udp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conex_udp_min`,`conex_udp_host`,`conex_udp_host_a`,`conex_udp_host_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS config_sam (completa tinyint(1) DEFAULT NULL, nivelDetalle int(11) DEFAULT NULL ) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin");
           // st.execute("CREATE TABLE IF NOT EXISTS configuracion (`id_configuracion` int(11) NOT NULL AUTO_INCREMENT,  `config_nivel_critico_vol` bigint(20) DEFAULT NULL COMMENT 'en bytes',  `config_nivel_critico_throughput` bigint(20) DEFAULT NULL COMMENT 'en bytes',  `config_tasa_transferencia_download` bigint(20) DEFAULT NULL,  PRIMARY KEY (`id_configuracion`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            
            st.execute("CREATE TABLE IF NOT EXISTS global_completa_min (id_global_min BIGINT(10) NOT NULL,global_min_IP_src VARCHAR(16) NOT NULL,global_min_Port_src INT(11) NOT NULL,global_min_IP_dst VARCHAR(16) NOT NULL,global_min_Port_dst INT(11) NOT NULL,global_min_bytes_src INT(11) DEFAULT NULL,global_min_bytes_dst INT(11) DEFAULT NULL,global_min_bytes_tot INT(11) DEFAULT NULL,`global_min_tipo` TINYINT(4) DEFAULT NULL COMMENT '0= tcp, 1 = udp',PRIMARY KEY (id_global_min,global_min_IP_src,global_min_Port_src,global_min_IP_dst,global_min_Port_dst)) ENGINE=MYISAM DEFAULT CHARSET=latin1");

            st.execute("CREATE TABLE IF NOT EXISTS `configuracion` (  `id_configuracion` int(11) NOT NULL AUTO_INCREMENT,  `config_nivel_critico_vol` bigint(20) DEFAULT NULL COMMENT 'en bytes',  `config_nivel_critico_throughput` bigint(20) DEFAULT NULL COMMENT 'en bytes',  `config_tasa_transferencia_download` bigint(20) DEFAULT NULL,  `config_tracert_ips` longtext,  PRIMARY KEY (`id_configuracion`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_duracion_http_min` (`id_conv_dura_http_min` bigint(20) NOT NULL,  `conv_dura_min_http_ip_src` varchar(50) NOT NULL,  `conv_dura_min_http_puerto_src` int(10) NOT NULL,  `conv_dura_min_http_ip_dst` varchar(50) NOT NULL,  `conv_dura_min_http_puerto_dst` int(10) NOT NULL,  `conv_dura_min_http_url` varchar(100) DEFAULT NULL,  `conv_dura_min_http_bytes_in` bigint(20) DEFAULT NULL,  `conv_dura_min_http_bytes_out` bigint(20) DEFAULT NULL,  `conv_dura_min_http_bytes_tot` bigint(20) DEFAULT NULL,  `conv_dura_min_http_segundos` bigint(20) DEFAULT NULL,  `conv_dura_min_http_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conv_dura_http_min`,`conv_dura_min_http_ip_src`,`conv_dura_min_http_puerto_src`,`conv_dura_min_http_ip_dst`,`conv_dura_min_http_puerto_dst`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_duracion_min` (`id_conv_dura_min` bigint(20) NOT NULL,  `conv_dura_min_ip_src` varchar(50) NOT NULL,  `conv_dura_min_puerto_src` int(10) NOT NULL,  `conv_dura_min_ip_dst` varchar(50) NOT NULL,  `conv_dura_min_puerto_dst` int(10) NOT NULL,  `conv_dura_min_bytes_in` bigint(20) DEFAULT NULL,  `conv_dura_min_bytes_out` bigint(20) DEFAULT NULL,  `conv_dura_min_bytes_tot` bigint(20) DEFAULT NULL,  `conv_dura_min_segundos` bigint(20) DEFAULT NULL,  `conv_dura_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conv_dura_min`,`conv_dura_min_ip_src`,`conv_dura_min_puerto_src`,`conv_dura_min_ip_dst`,`conv_dura_min_puerto_dst`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_duracion_pam_min` (`id_conv_dura_pam_min` bigint(20) NOT NULL,  `conv_dura_min_pam_ip_src` varchar(50) NOT NULL,  `conv_dura_min_pam_puerto_src` int(10) NOT NULL,  `conv_dura_min_pam_ip_dst` varchar(50) NOT NULL,  `conv_dura_min_pam_puerto_dst` int(10) NOT NULL,  `conv_dura_min_pam_bytes_in` bigint(20) DEFAULT NULL,  `conv_dura_min_pam_bytes_out` bigint(20) DEFAULT NULL,  `conv_dura_min_pam_bytes_tot` bigint(20) DEFAULT NULL,  `conv_dura_min_pam_segundos` bigint(20) DEFAULT NULL,  `conv_dura_min_pam_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_conv_dura_pam_min`,`conv_dura_min_pam_ip_src`,`conv_dura_min_pam_puerto_src`,`conv_dura_min_pam_ip_dst`,`conv_dura_min_pam_puerto_dst`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_http_min` (`id_conv_http_min` bigint(12) unsigned NOT NULL,  `conv_http_ip` varchar(50) NOT NULL,  `conv_http_ips` longtext,  `conv_http_vol` longtext,  `conv_http_fecha` datetime DEFAULT NULL,  `conv_http_otros` bigint(20) unsigned DEFAULT NULL,  PRIMARY KEY (`id_conv_http_min`,`conv_http_ip`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_min` (`id_conv_min` bigint(20) unsigned NOT NULL,  `conv_ip` varchar(50) NOT NULL,  `conv_ips` longtext,  `conv_vol` longtext,  `conv_fecha` datetime DEFAULT NULL,  `conv_otros` bigint(30) unsigned DEFAULT NULL,  PRIMARY KEY (`id_conv_min`,`conv_ip`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_pam_min` (`id_conv_pam_min` bigint(12) unsigned NOT NULL,  `conv_pam_ip` varchar(50) NOT NULL,  `conv_pam_ips` longtext,  `conv_pam_vol` longtext,  `conv_pam_fecha` datetime DEFAULT NULL,  `conv_pam_otros` bigint(20) unsigned DEFAULT NULL,  PRIMARY KEY (`id_conv_pam_min`,`conv_pam_ip`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_tcp_min` (`id_conv_tcp_min` bigint(12) unsigned NOT NULL,  `conv_tcp_ip` varchar(50) NOT NULL,  `conv_tcp_ips` longtext,  `conv_tcp_vol` longtext,  `conv_tcp_fecha` datetime DEFAULT NULL,  `conv_tcp_otros` bigint(20) unsigned DEFAULT NULL,  PRIMARY KEY (`id_conv_tcp_min`,`conv_tcp_ip`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `conv_udp_min` (`id_conv_udp_min` bigint(12) unsigned NOT NULL,  `conv_udp_ip` varchar(50) NOT NULL,  `conv_udp_ips` longtext,  `conv_udp_vol` longtext,  `conv_udp_fecha` datetime DEFAULT NULL,  `conv_udp_otros` bigint(20) unsigned DEFAULT NULL,  PRIMARY KEY (`id_conv_udp_min`,`conv_udp_ip`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS detalle_app_min (id_detalle_app_min BIGINT(20) NOT NULL,  detalle_app_min_ip_src VARCHAR(250) DEFAULT NULL,  detalle_app_min_ip_aplicacion VARCHAR(250) DEFAULT NULL,  detalle_app_min_puerto_aplicacion VARCHAR(250) DEFAULT NULL,  detalle_app_min_bytes_in VARCHAR(250) DEFAULT NULL,  detalle_app_min_bytes_out VARCHAR(250) DEFAULT NULL,  detalle_app_min_bytes_tot VARCHAR(250) DEFAULT NULL,  detalle_app_min_aplicacion VARCHAR(250) NOT NULL,  detalle_app_min_fecha DATETIME DEFAULT NULL,  PRIMARY KEY  (id_detalle_app_min,detalle_app_min_aplicacion)) ENGINE=MYISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS global_min (id_global_min bigint(10) NOT NULL,global_min_IP_src varchar(16) NOT NULL,global_min_Port_src int(11) NOT NULL,global_min_IP_dst varchar(16) NOT NULL,global_min_Port_dst int(11) NOT NULL,global_min_bytes_src int(11) DEFAULT NULL,global_min_bytes_dst int(11) DEFAULT NULL,global_min_bytes_tot int(11) DEFAULT NULL,  PRIMARY KEY (id_global_min,global_min_IP_src,global_min_Port_src,global_min_IP_dst,global_min_Port_dst)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `host_http_min` (`id_host_http_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `host_http_host` varchar(50) NOT NULL DEFAULT '',  `host_http_bytes_in` int(10) unsigned DEFAULT NULL,  `host_http_bytes_out` int(10) unsigned DEFAULT NULL,  `host_http_bytes_tot` int(10) unsigned DEFAULT NULL,  `host_http_otros` int(10) unsigned DEFAULT NULL,  `host_http_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `host_http_b` tinyint(1) NOT NULL DEFAULT '0',  `host_http_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_host_http_min`,`host_http_host`,`host_http_a`,`host_http_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `host_min` (`id_host_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `host_host` varchar(50) NOT NULL DEFAULT '',  `host_bytes_in` int(10) unsigned DEFAULT NULL,  `host_bytes_out` int(10) unsigned DEFAULT NULL,  `host_bytes_tot` int(10) unsigned DEFAULT NULL,  `host_min_otros` int(10) unsigned DEFAULT NULL,  `host_tipo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= tcp, 0= udp',  `host_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_host_min`,`host_host`,`host_tipo`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `host_pam_min` (`id_host_pam_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `host_pam_host` varchar(50) NOT NULL DEFAULT '',  `host_pam_bytes_in` int(10) unsigned DEFAULT NULL,  `host_pam_bytes_out` int(10) unsigned DEFAULT NULL,  `host_pam_bytes_tot` int(10) unsigned DEFAULT NULL,  `host_pam_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `host_pam_b` tinyint(1) NOT NULL DEFAULT '0',  `host_pam_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_host_pam_min`,`host_pam_host`,`host_pam_a`,`host_pam_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `host_tcp_min` (`id_host_tcp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `host_tcp_host` varchar(50) NOT NULL DEFAULT '',  `host_tcp_bytes_in` int(10) unsigned DEFAULT NULL,  `host_tcp_bytes_out` int(10) unsigned DEFAULT NULL,  `host_tcp_bytes_tot` int(10) unsigned DEFAULT NULL,  `host_tcp_tcp_otros` int(10) unsigned DEFAULT NULL,  `host_tcp_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `host_tcp_b` tinyint(1) NOT NULL DEFAULT '0',  `host_tcp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_host_tcp_min`,`host_tcp_host`,`host_tcp_a`,`host_tcp_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `host_udp_min` (`id_host_udp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `host_udp_host` varchar(50) NOT NULL DEFAULT '',  `host_udp_bytes_in` int(10) unsigned DEFAULT NULL,  `host_udp_bytes_out` int(10) unsigned DEFAULT NULL,  `host_udp_bytes_tot` int(10) unsigned DEFAULT NULL,  `host_udp_otros` int(10) unsigned DEFAULT NULL,  `host_udp_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `host_udp_b` tinyint(1) NOT NULL DEFAULT '0',  `host_udp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_host_udp_min`,`host_udp_host`,`host_udp_a`,`host_udp_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `indicadores_min` ( `ind_min_id` bigint(20) NOT NULL,  `ind_min_vol_tot_gral` bigint(20) DEFAULT NULL,  `ind_min_vol_tot_tcp` bigint(20) DEFAULT NULL,  `ind_min_vol_tot_udp` bigint(20) DEFAULT NULL,  `ind_min_vol_tot_http` bigint(20) DEFAULT NULL,  `ind_min_vol_tot_pam` bigint(20) DEFAULT NULL,  `ind_min_throughput_gral` double DEFAULT NULL,  `ind_min_throughput_tcp` double DEFAULT NULL,  `ind_min_throughput_udp` double DEFAULT NULL,  `ind_min_throughput_http` double DEFAULT NULL,  `ind_min_throughput_pam` double DEFAULT NULL,`ind_min_paquetes_tot_gral` bigint(20) DEFAULT NULL,  `ind_min_paquetes_tot_tcp` bigint(20) DEFAULT NULL,  `ind_min_paquetes_tot_udp` bigint(20) DEFAULT NULL,  `ind_min_paquetes_tot_http` bigint(20) DEFAULT NULL,  `ind_min_paquetes_tot_pam` bigint(20) DEFAULT NULL,`ind_min_rst` int(10) DEFAULT NULL, `ind_min_paquetes_ip_v4` bigint(20) DEFAULT NULL, `ind_min_bytes_ip_v4` bigint(20) DEFAULT NULL, `ind_min_paquetes_ip_v6` bigint(20) DEFAULT NULL, `ind_min_bytes_ip_v6` bigint(20) DEFAULT NULL, `ind_min_paquetes_arp` bigint(20) DEFAULT NULL, `ind_min_bytes_arp` bigint(20) DEFAULT NULL, `ind_min_paquetes_ftp` bigint(20) DEFAULT NULL, `ind_min_bytes_ftp` bigint(20) DEFAULT NULL, `ind_min_paquetes_pop3` bigint(20) DEFAULT NULL, `ind_min_bytes_pop3` bigint(20) DEFAULT NULL, `ind_min_paquetes_smtp` bigint(20) DEFAULT NULL, `ind_min_bytes_smtp` bigint(20) DEFAULT NULL, `ind_min_paquetes_ssh` bigint(20) DEFAULT NULL, `ind_min_bytes_ssh` bigint(20) DEFAULT NULL, `ind_min_paquetes_telnet` bigint(20) DEFAULT NULL,`ind_min_bytes_telnet` bigint(20) DEFAULT NULL,`ind_min_paquetes_snmp` bigint(20) DEFAULT NULL, `ind_min_bytes_snmp` bigint(20) DEFAULT NULL, `ind_min_paquetes_icmp` bigint(20) DEFAULT NULL, `ind_min_bytes_icmp` bigint(20) DEFAULT NULL, `ind_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`ind_min_id`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `ipam` (  `ipam_id` bigint(20) NOT NULL AUTO_INCREMENT,  `ipam_IP_inicia` varchar(16) NOT NULL,  `ipam_IP_termina` varchar(16) NOT NULL,  `ipam_descripcion` varchar(100) DEFAULT NULL,  PRIMARY KEY (`ipam_id`,`ipam_IP_inicia`,`ipam_IP_termina`)) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `nav_ip_min` (`id_nav_ip_min` bigint(20) unsigned NOT NULL,  `nav_ip` varchar(15) NOT NULL,  `nav_ip_navegacion` longtext,  `nav_ip_vol_in` bigint(20) unsigned DEFAULT NULL,  `nav_ip_vol_out` bigint(20) unsigned DEFAULT NULL,  `nav_ip_vol_tot` bigint(20) unsigned DEFAULT NULL,  `nav_ip_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_nav_ip_min`,`nav_ip`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS nav_url_min (  id_nav_ip_min bigint(20) unsigned NOT NULL,  nav_url varchar(200) NOT NULL,  nav_ips longtext,  nav_ip_vol_in bigint(20) unsigned DEFAULT NULL,  nav_ip_vol_out bigint(20) unsigned DEFAULT NULL,  nav_ip_vol_tot bigint(20) unsigned DEFAULT NULL,  nav_ip_tiempo_conex double DEFAULT NULL,  nav_ip_con_estab_a_ini_solicitud double DEFAULT NULL,  nav_ip_tiempo_solicitud double DEFAULT NULL,  nav_ip_avg_tiempo_respuesta double DEFAULT NULL,  nav_ip_min_tiempo_respuesta double DEFAULT NULL,  nav_ip_max_tiempo_respuesta double DEFAULT NULL,  ult_resp_a_sig_solicitud double DEFAULT NULL,  nav_ip_fecha datetime DEFAULT NULL,  PRIMARY KEY (id_nav_ip_min,nav_url)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `nombre_puertos` (`idPort` int(6) NOT NULL AUTO_INCREMENT,  `portNum` int(6) DEFAULT NULL,  `protocolo` varchar(100) DEFAULT NULL,  `descripcion` varchar(250) DEFAULT NULL,  PRIMARY KEY (`idPort`),  KEY `portNum` (`portNum`)) ENGINE=MyISAM AUTO_INCREMENT=4707 DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `num_octetos` (`num_octetos` int(1) NOT NULL DEFAULT '0',  PRIMARY KEY (`num_octetos`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `puerto_http_min` (  `id_puerto_http_min` bigint(10) NOT NULL DEFAULT '0',  `puerto_http_puerto` int(5) NOT NULL DEFAULT '0',  `puerto_http_conex` int(10) DEFAULT NULL,  `puerto_http_bytes_in` int(10) DEFAULT NULL,  `puerto_http_bytes_out` int(10) DEFAULT NULL,  `puerto_http_bytes_tot` int(10) DEFAULT NULL,  `puerto_http_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_puerto_http_min`,`puerto_http_puerto`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `puerto_min` (  `id_puerto_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `puerto_puerto` int(10) unsigned NOT NULL DEFAULT '0',  `puerto_conex` int(10) DEFAULT NULL,  `puerto_bytes_in` int(10) unsigned DEFAULT NULL,  `puerto_bytes_out` int(10) unsigned DEFAULT NULL,  `puerto_bytes_tot` int(10) unsigned DEFAULT NULL,  `puerto_otros` int(10) unsigned DEFAULT NULL,  `puerto_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_puerto_min`,`puerto_puerto`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `puerto_pam_min` ( `id_puerto_pam_min` bigint(10) NOT NULL DEFAULT '0',  `puerto_pam_puerto` int(5) NOT NULL DEFAULT '0',  `puerto_pam_conex` int(10) DEFAULT NULL,  `puerto_pam_bytes_in` int(10) DEFAULT NULL,  `puerto_pam_bytes_out` int(10) DEFAULT NULL,  `puerto_pam_bytes_tot` int(10) DEFAULT NULL,  `puerto_pam_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_puerto_pam_min`,`puerto_pam_puerto`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `puerto_tcp_min` (  `id_puerto_tcp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `puerto_tcp_puerto` int(10) unsigned NOT NULL DEFAULT '0',  `puerto_tcp_conex` int(10) DEFAULT NULL,  `puerto_tcp_bytes_in` int(10) unsigned DEFAULT NULL,  `puerto_tcp_bytes_out` int(10) unsigned DEFAULT NULL,  `puerto_tcp_bytes_tot` int(10) unsigned DEFAULT NULL,  `puerto_tcp_otros` int(10) unsigned DEFAULT NULL,  `puerto_tcp_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `puerto_tcp_b` tinyint(1) NOT NULL DEFAULT '0',  `puerto_tcp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_puerto_tcp_min`,`puerto_tcp_puerto`,`puerto_tcp_a`,`puerto_tcp_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `puerto_udp_min` (  `id_puerto_udp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `puerto_udp_puerto` int(10) unsigned NOT NULL DEFAULT '0',  `puerto_udp_conex` int(10) DEFAULT NULL,  `puerto_udp_bytes_in` int(10) unsigned DEFAULT NULL,  `puerto_udp_bytes_out` int(10) unsigned DEFAULT NULL,  `puerto_udp_bytes_tot` int(10) unsigned DEFAULT NULL,  `puerto_udp_otros` int(10) unsigned DEFAULT NULL,  `puerto_udp_a` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1= src, 0= dst',  `puerto_udp_b` tinyint(1) NOT NULL DEFAULT '0',  `puerto_udp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_puerto_udp_min`,`puerto_udp_puerto`,`puerto_udp_a`,`puerto_udp_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `segmentos_http_min` (  `id_segmentos_http_min` bigint(10) NOT NULL DEFAULT '0',  `segmentos_http_segmento` varchar(15) NOT NULL DEFAULT '',  `segmentos_http_bytes_in` int(10) DEFAULT NULL,  `segmentos_http_bytes_out` int(10) DEFAULT NULL,  `segmentos_http_bytes_tot` int(10) DEFAULT NULL,  `segmentos_http_otros` int(10) unsigned DEFAULT NULL,  `segmentos_http_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_segmentos_http_min`,`segmentos_http_segmento`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `segmentos_min` (  `id_segmentos_min` bigint(10) NOT NULL DEFAULT '0',  `segmentos_segmento` varchar(50) NOT NULL DEFAULT '',  `segmentos_bytes_in` int(10) DEFAULT NULL,  `segmentos_bytes_out` int(10) DEFAULT NULL,  `segmentos_bytes_tot` int(10) DEFAULT NULL,  `segmentos_min_otros` int(10) unsigned DEFAULT NULL,  `segmentos_tipo` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'tipo 1= tcp, tipo 0= udp',  `segmentos_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_segmentos_min`,`segmentos_segmento`,`segmentos_tipo`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `segmentos_pam_min` (  `id_segmentos_pam_min` bigint(10) NOT NULL DEFAULT '0',  `segmentos_pam_segmento` varchar(15) NOT NULL DEFAULT '',  `segmentos_pam_bytes_in` int(10) DEFAULT NULL,  `segmentos_pam_bytes_out` int(10) DEFAULT NULL,  `segmentos_pam_bytes_tot` int(10) DEFAULT NULL,  `segmentos_pam_otros` int(10) unsigned DEFAULT NULL,  `segmentos_pam_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_segmentos_pam_min`,`segmentos_pam_segmento`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `segmentos_tcp_min` (  `id_segmentos_tcp_min` bigint(10) NOT NULL DEFAULT '0',  `segmentos_tcp_segmento` varchar(15) NOT NULL DEFAULT '',  `segmentos_tcp_bytes_in` int(10) DEFAULT NULL,  `segmentos_tcp_bytes_out` int(10) DEFAULT NULL,  `segmentos_tcp_bytes_tot` int(10) DEFAULT NULL,  `segmentos_tcp_otros` int(10) unsigned DEFAULT NULL,  `segmentos_tcp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_segmentos_tcp_min`,`segmentos_tcp_segmento`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `segmentos_udp_min` (  `id_segmentos_udp_min` bigint(10) NOT NULL DEFAULT '0',  `segmentos_udp_segmento` varchar(50) NOT NULL DEFAULT '',  `segmentos_udp_bytes_in` int(10) DEFAULT NULL,  `segmentos_udp_bytes_out` int(10) DEFAULT NULL,  `segmentos_udp_bytes_tot` int(10) DEFAULT NULL,  `segmentos_udp_otros` int(10) unsigned DEFAULT NULL,  `segmentos_udp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_segmentos_udp_min`,`segmentos_udp_segmento`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `sam_config` (`id_sam_segmento` int(10) NOT NULL auto_increment,  `sam_segmento` varchar(11) default NULL,  `sam_descripcion` longtext,  `sam_nombre` varchar(50) default NULL,  PRIMARY KEY  (`id_sam_segmento`)) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `servidor_config` (`id_servidor` int(5) NOT NULL auto_increment,  `servidor_ip` varchar(15) default NULL,  `servidor_puerto` int(5) default NULL,  `servidor_nombre` varchar(100) default NULL,  `servidor_nom_servicio` varchar(100) default NULL,  `servidor_descripcion` longtext,  PRIMARY KEY  (`id_servidor`)) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `servidor_min` (`id_servidor_min` bigint(20) NOT NULL,  `servidor_min_ip` varchar(15) NOT NULL,  `servidor_min_port` int(6) NOT NULL,  `servidor_min_vol_in` bigint(20) DEFAULT NULL,  `servidor_min_vol_out` bigint(20) DEFAULT NULL,  `servidor_min_vol_tot` bigint(20) DEFAULT NULL,  `servidor_min_conex_tot` bigint(20) DEFAULT NULL,  `servidor_min_throughput_tot` bigint(20) DEFAULT NULL, `servidor_min_top_ips_conex` text COMMENT 'top 10 que platicaron con el server',  `servidor_min_top_ips_vol` text COMMENT 'top 10 que consumieron mas con el server',  `servidor_min_tr` bigint(20) DEFAULT NULL COMMENT 'tiempo respuesta',  `servidor_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_servidor_min`,`servidor_min_ip`,`servidor_min_port`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `throughput_http_min` (  `id_throughput_http_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `throughput_http_min_in` double DEFAULT NULL,  `throughput_http_min_out` double DEFAULT NULL,  `throughput_http_min_tot` double DEFAULT NULL,  `throughput_http_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_throughput_http_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `throughput_min` (  `id_throughput_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `throughput_min_in` double DEFAULT NULL,  `throughput_min_out` double DEFAULT NULL,  `throughput_min_tot` double DEFAULT NULL,  `throughput_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_throughput_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `throughput_pam_min` (  `id_throughput_pam_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `throughput_pam_min_in` double DEFAULT NULL,  `throughput_pam_min_out` double DEFAULT NULL,  `throughput_pam_min_tot` double DEFAULT NULL,  `throughput_pam_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_throughput_pam_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `throughput_tcp_min` (  `id_throughput_tcp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `throughput_tcp_min_in` double DEFAULT NULL,  `throughput_tcp_min_out` double DEFAULT NULL,  `throughput_tcp_min_tot` double DEFAULT NULL,  `throughput_tcp_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_throughput_tcp_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `throughput_udp_min` (  `id_throughput_udp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `throughput_udp_min_in` double DEFAULT NULL,  `throughput_udp_min_out` double DEFAULT NULL,  `throughput_udp_min_tot` double DEFAULT NULL,  `throughput_udp_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_throughput_udp_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `tr_http_min` (  `id_tr_http` bigint(10) NOT NULL,  `tr_http_puerto` int(11) unsigned NOT NULL,  `tr_http_conex` bigint(21) NOT NULL,  `tr_http_bytes_in` decimal(33,0) DEFAULT NULL,  `tr_http_bytes_out` decimal(33,0) DEFAULT NULL,  `tr_http_bytes_tot` decimal(33,0) DEFAULT NULL,  `tr_http_min_seg` int(5) unsigned DEFAULT NULL,  `tr_http_min_miliseg` int(10) unsigned DEFAULT NULL,  `tr_http_max_seg` int(5) unsigned DEFAULT NULL,  `tr_http_max_miliseg` int(10) unsigned DEFAULT NULL,  `tr_http_avg_seg` decimal(15,10) DEFAULT NULL,  `tr_http_avg_miliseg` decimal(15,10) DEFAULT NULL,  `tr_http_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_tr_http`,`tr_http_puerto`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `tcp_min` (  `id_tcp_min` bigint(10) NOT NULL,  `tcp_min_IP_src`  varchar(50) NOT NULL DEFAULT '',  `tcp_min_Port_src` smallint(6) unsigned NOT NULL,  `tcp_min_IP_dst`  varchar(50) NOT NULL DEFAULT '',  `tcp_min_Port_dst` smallint(6) unsigned NOT NULL,  `tcp_min_bytes_src` int(10) unsigned DEFAULT NULL,  `tcp_min_paquetes_src` int(10) unsigned DEFAULT NULL,  `tcp_min_bytes_dst` int(10) unsigned DEFAULT NULL,  `tcp_min_paquetes_dst` int(10) unsigned DEFAULT NULL,  `tcp_min_bytes_tot` int(10) unsigned DEFAULT NULL,  `tcp_min_paquetes_tot` int(10) unsigned DEFAULT NULL,  `tcp_min_inicia` int(10) unsigned DEFAULT NULL,  `tcp_min_miliseg_inicia` int(10) unsigned DEFAULT NULL,  `tcp_min_fin` int(10) unsigned DEFAULT NULL,  `tcp_min_miliseg_fin` int(10) unsigned DEFAULT NULL,  `tcp_min_cve_edif_a` int(10) unsigned DEFAULT NULL,  `tcp_min_cve_edif_b` int(10) unsigned DEFAULT NULL,  `tcp_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_tcp_min`,`tcp_min_IP_src`,`tcp_min_Port_src`,`tcp_min_IP_dst`,`tcp_min_Port_dst`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `tr_min` (  `id_tr_min` bigint(10) NOT NULL,  `tr_min_puerto` int(11) unsigned NOT NULL,  `tr_min_conex` bigint(21) NOT NULL,  `tr_min_bytes_in` decimal(33,0) DEFAULT NULL,  `tr_min_bytes_out` decimal(33,0) DEFAULT NULL,  `tr_min_bytes_tot` decimal(33,0) DEFAULT NULL,  `tr_min_min_seg` int(5) unsigned DEFAULT NULL,  `tr_min_min_miliseg` int(10) unsigned DEFAULT NULL,  `tr_min_max_seg` int(5) unsigned DEFAULT NULL,  `tr_min_max_miliseg` int(10) unsigned DEFAULT NULL,  `tr_min_avg_seg` decimal(15,10) DEFAULT NULL,  `tr_min_avg_miliseg` decimal(15,10) DEFAULT NULL,  `tr_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_tr_min`,`tr_min_puerto`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `tr_pam_min` (  `id_tr_pam` bigint(10) NOT NULL,  `tr_pam_puerto` int(11) unsigned NOT NULL,  `tr_pam_conex` bigint(21) NOT NULL,  `tr_pam_bytes_in` decimal(33,0) DEFAULT NULL,  `tr_pam_bytes_out` decimal(33,0) DEFAULT NULL,  `tr_pam_bytes_tot` decimal(33,0) DEFAULT NULL,  `tr_pam_min_seg` int(5) unsigned DEFAULT NULL,  `tr_pam_min_miliseg` int(10) unsigned DEFAULT NULL,  `tr_pam_max_seg` int(5) unsigned DEFAULT NULL,  `tr_pam_max_miliseg` int(10) unsigned DEFAULT NULL,  `tr_pam_avg_seg` decimal(15,10) DEFAULT NULL,  `tr_pam_avg_miliseg` decimal(15,10) DEFAULT NULL,  `tr_pam_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_tr_pam`,`tr_pam_puerto`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `tr_tcp_min` (  `id_tr_tcp` bigint(10) NOT NULL,  `tr_tcp_puerto` int(11) unsigned NOT NULL,  `tr_tcp_conex` bigint(21) NOT NULL,  `tr_tcp_bytes_in` decimal(33,0) DEFAULT NULL,  `tr_tcp_bytes_out` decimal(33,0) DEFAULT NULL,  `tr_tcp_bytes_tot` decimal(33,0) DEFAULT NULL,  `tr_tcp_min_seg` int(5) unsigned DEFAULT NULL,  `tr_tcp_min_miliseg` int(10) unsigned DEFAULT NULL,  `tr_tcp_max_seg` int(5) unsigned DEFAULT NULL,  `tr_tcp_max_miliseg` int(10) unsigned DEFAULT NULL,  `tr_tcp_avg_seg` decimal(15,10) DEFAULT NULL,  `tr_tcp_avg_miliseg` decimal(15,10) DEFAULT NULL,  `tr_tcp_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_tr_tcp`,`tr_tcp_puerto`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `traceroute` ( `id_tracert` int(5) NOT NULL AUTO_INCREMENT,  `trace_fecha` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',  `trace_destino` varchar(50) NOT NULL DEFAULT '',  `trace_num_saltos` int(2) DEFAULT NULL,  `trace_index` varchar(50) DEFAULT NULL,  `trace_hostname_saltos` longtext,  `trace_ip_saltos` longtext,  `trace_time` longtext,  `trace_total_time` decimal(10,3) DEFAULT NULL,  PRIMARY KEY (`id_tracert`,`trace_fecha`,`trace_destino`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `udp_min` (`id_udp_min` bigint(10) NOT NULL,  `udp_min_IP_src`varchar(50) NOT NULL DEFAULT '',  `udp_min_Port_src` smallint(6) unsigned NOT NULL,  `udp_min_IP_dst`varchar(50) NOT NULL DEFAULT '',  `udp_min_Port_dst` smallint(6) unsigned NOT NULL,  `udp_min_bytes_src` int(10) unsigned DEFAULT NULL,  `udp_min_paquetes_src` int(10) unsigned DEFAULT NULL,  `udp_min_bytes_dst` int(10) unsigned DEFAULT NULL,  `udp_min_paquetes_dst` int(10) unsigned DEFAULT NULL,  `udp_min_bytes_tot` int(10) unsigned DEFAULT NULL,  `udp_min_paquetes_tot` int(10) unsigned DEFAULT NULL,  `udp_min_inicia` int(10) unsigned DEFAULT NULL,  `udp_min_miliseg_inicia` int(10) unsigned DEFAULT NULL,  `udp_min_cve_edif_a` int(10) unsigned DEFAULT NULL,  `udp_min_cve_edif_b` int(10) unsigned DEFAULT NULL,  `udp_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_udp_min`,`udp_min_IP_src`,`udp_min_Port_src`,`udp_min_IP_dst`,`udp_min_Port_dst`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `unidad_medicion` (  `unidad` int(6) NOT NULL DEFAULT '0',  `nombre_medida` varchar(20) NOT NULL DEFAULT '' COMMENT 'medida para bytes',  `nombre_medida2` varchar(20) NOT NULL DEFAULT '' COMMENT 'medida para bits (rendimiento)',  `seleccionado` int(1) DEFAULT '0',  PRIMARY KEY (`unidad`,`nombre_medida`,`nombre_medida2`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `vol_http_min` (  `id_vol_http_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `vol_http_min_in` int(10) unsigned DEFAULT NULL,  `vol_http_min_out` int(10) unsigned DEFAULT NULL,  `vol_http_min_tot` int(10) unsigned DEFAULT NULL,  `vol_http_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_vol_http_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `vol_min` (  `id_vol_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `vol_min_in` int(10) unsigned DEFAULT NULL,  `vol_min_out` int(10) unsigned DEFAULT NULL,  `vol_min_tot` int(10) unsigned DEFAULT NULL,  `vol_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_vol_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `vol_pam_min` (  `id_vol_pam_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `vol_pam_min_in` int(10) unsigned DEFAULT NULL,  `vol_pam_min_out` int(10) unsigned DEFAULT NULL,  `vol_pam_min_tot` int(10) unsigned DEFAULT NULL,  `vol_pam_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_vol_pam_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `vol_tcp_min` (  `id_vol_tcp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `vol_tcp_min_in` int(10) unsigned DEFAULT NULL,  `vol_tcp_min_out` int(10) unsigned DEFAULT NULL,  `vol_tcp_min_tot` int(10) unsigned DEFAULT NULL,  `vol_tcp_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_vol_tcp_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS `vol_udp_min` (  `id_vol_udp_min` bigint(10) unsigned NOT NULL DEFAULT '0',  `vol_udp_min_in` int(10) unsigned DEFAULT NULL,  `vol_udp_min_out` int(10) unsigned DEFAULT NULL,  `vol_udp_min_tot` int(10) unsigned DEFAULT NULL,  `vol_udp_min_fecha` datetime DEFAULT NULL,  PRIMARY KEY (`id_vol_udp_min`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
            st.execute("CREATE TABLE IF NOT EXISTS vol_min_aplicacion (id_vol_min_aplicacion bigint(20) NOT NULL,  vol_min_aplicacion_aplicacion varchar(200) NOT NULL,  vol_min_aplicacion_bytes_in double default NULL,  vol_min_aplicacion_bytes_out double default NULL,  vol_min_aplicacion_bytes_tot double default NULL,  vol_min_fecha datetime default NULL,  PRIMARY KEY  (id_vol_min_aplicacion,vol_min_aplicacion_aplicacion)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
     //       st.close();
        } catch (SQLException ex) {
            logger.error("Error al crear tablas del remoto:  " + ex);
        }
//        finally {
//            try {
//                st.close();
//                st = null;
//            } catch (SQLException ex) {
//                logger.error("No se pudo liberar el Statement de CreatTablasBDremoto:  " + ex);
//            }
//        }
        
    }


}
