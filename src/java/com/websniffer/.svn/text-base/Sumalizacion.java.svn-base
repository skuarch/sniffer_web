/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websniffer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import org.apache.log4j.Logger;

/**
 *
 * @author Puebla
 */
class Sumalizacion {

    static final Logger logger = Logger.getLogger(Sumalizacion.class);

    public Sumalizacion(String minutoTabla, String limiteResumen, String idTablas, String numTabla, String host, String nomb_BD, String usuarioBD, String password, String cadena_jdbc, boolean  completa) {
        
        ResultSet rs = null;
        ConectaBDRemoto conBDremoto = new ConectaBDRemoto();
        Statement st = conBDremoto.AbreConexionMysql(host, nomb_BD, usuarioBD, password, cadena_jdbc);


        try {
            DecimalFormat formatoNumero = new DecimalFormat("#####.##");
            long vol_general_tcp = 0;
            long vol_general_udp = 0;
            long vol_general_http = 0;
            long vol_general_pam = 0;
            long vol_puerto_tcp = 0;
            long vol_puerto_udp = 0;
            long vol_host_tcp = 0;
            long vol_host_udp = 0;
            long vol_general_host_http = 0;
            long vol_host_min = 0;
            long vol_segmentos_tcp = 0;
            long vol_segmentos_udp = 0;
            long vol_segmentos_http = 0;
            long vol_segmentos_min = 0;
            long vol_segmentos_pam = 0;
            long vol_puerto_tcp_y_udp = 0;
            long vol_host_tcp_otros = 0;
            long vol_host_udp_otros = 0;
            long vol_host_min_otros = 0;
            long vol_host_http_otros = 0;
            long vol_segmentos_tcp_otros = 0;
            long vol_segmentos_udp_otros = 0;
            long vol_segmentos_http_otros = 0;
            long vol_segmentos_min_otros = 0;
            long vol_segmentos_pam_otros = 0;
            long paquetes_tot_tcp = 0;
            long paquetes_tot_udp = 0;
            long paquetes_tot_http = 0;
            long paquetes_tot_pam = 0;
            long numRST = 0;
            long vol_alarma_max = 0;
            long throughput_alarma_max = 0;
            String[] servidor_tr = null;
            long volumen_ips;
            long ftpPackets = 0;
            long ftpBytes = 0;
            long pop3Packets = 0;
            long pop3Bytes = 0;
            long smtpPackets = 0;
            long smtpBytes = 0;
            long sshPackets = 0;
            long sshBytes = 0;
            long telnetPackets = 0;
            long telnetBytes = 0;
            long snmpPackets = 0;
            long snmpBytes = 0;

            long ipv4Packets = 0;
            long ipv4Bytes = 0;
            long ipv6Packets = 0;
            long ipv6Bytes = 0;
            long arpPackets = 0;
            long arpBytes = 0;
            long icmpPackets = 0;
            long icmpBytes = 0;

            


            String fechaTablas = (idTablas.substring(idTablas.length() - 12, idTablas.length() - 8) + "-" + idTablas.substring(idTablas.length() - 8, idTablas.length() - 6) + "-" + idTablas.substring(idTablas.length() - 6, idTablas.length() - 4) + " " + idTablas.substring(idTablas.length() - 4, idTablas.length() - 2) + ":" + idTablas.substring(idTablas.length() - 2, idTablas.length()) + ":00");




            

            //int[] pamConfigArray = sumalizacionBD.ObtieneDatosQuery();
            MatrizSumalizacion matSum = new MatrizSumalizacion();            
            rs = st.executeQuery("select * from pam_config");
            int[] pamConfigArray = matSum.ObtieneDatosQuery(rs);
            
            

            for (int indpam = 0; indpam < pamConfigArray.length - 1; indpam++) {
                st.execute("INSERT INTO pam_min_" + numTabla + " SELECT IP_src,  Port_src,  IP_dst,  Port_dst,  bytes_src,  paquetes_src,  bytes_dst,  paquetes_dst,  bytes_tot,  paquetes_tot,  inicia,  miliseg_inicia,  fin,  miliseg_fin,  cve_edif_a,  cve_edif_b FROM tcp_min_" + numTabla + " WHERE Port_src = " + pamConfigArray[indpam] + " OR Port_dst = " + pamConfigArray[indpam] + " UNION ALL SELECT IP_src, Port_src, IP_dst, Port_dst,  bytes_src, paquetes_src,  bytes_dst, paquetes_dst, bytes_tot, paquetes_tot, inicia, miliseg_inicia, fin, miliseg_fin, cve_edif_a, cve_edif_b FROM udp_min_" + numTabla + " WHERE Port_src = " + pamConfigArray[indpam] + "  OR Port_dst = " + pamConfigArray[indpam]);
            }

            /***************INICIAN LOS CALCULOS PARA OBTENER EL CAMPO OTROS EN LAS TABLAS**************/

            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM pam_min_" + numTabla);
            rs.next();
            vol_general_pam = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM tcp_min_" + numTabla);
            rs.next();
            vol_general_tcp = rs.getLong(1);            
            
            

            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM udp_min_" + numTabla);
            rs.next();
            vol_general_udp = rs.getLong(1);            
            
            

            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM http_min_" + numTabla);
            rs.next();
            vol_general_http = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vt) FROM (SELECT IF(Port_src < Port_dst, Port_src, Port_dst)puerto, SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto ORDER BY vt DESC LIMIT " + limiteResumen + ")xx");
            rs.next();
            vol_puerto_tcp = rs.getLong(1);
            
            


            rs = st.executeQuery("SELECT SUM(vt) FROM (SELECT IF(Port_src < Port_dst, Port_src, Port_dst)puerto, SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto ORDER BY vt DESC LIMIT " + limiteResumen + ")xx");
            rs.next();
            vol_puerto_udp = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT SUM(vt)vol_tot FROM (SELECT (IP_src)ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " GROUP BY ip )xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_host_tcp = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT SUM(vt)vol_tot FROM (SELECT (IP_src)ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " GROUP BY ip )xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_host_udp = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT  ip, SUM(vt)vol_tot FROM (SELECT (IP_src)ip,SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot)vt FROM http_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_general_host_http = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT SUM(vt)vol_tot FROM (SELECT (IP_src)ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " GROUP BY ip UNION ALL SELECT (IP_src)ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_host_min = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT SUM(vt)vol_tot FROM (SELECT DISTINCT SUBSTRING_INDEX((IP_src),'.',(SELECT * FROM num_octetos))ip, SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_segmentos_tcp = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT SUM(vt)vol_tot FROM (SELECT DISTINCT SUBSTRING_INDEX((IP_src),'.',(SELECT * FROM num_octetos))ip, SUM(bytes_tot)vt FROM udp_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_segmentos_udp = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT SUM(vt)vol_tot FROM (SELECT DISTINCT SUBSTRING_INDEX((IP_src),'.',(SELECT * FROM num_octetos))ip, SUM(bytes_tot)vt FROM http_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_segmentos_http = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT ip,SUM(vt)vol_tot FROM (SELECT DISTINCT SUBSTRING_INDEX((IP_src),'.',(SELECT * FROM num_octetos))ip, SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " GROUP BY ip UNION ALL SELECT DISTINCT SUBSTRING_INDEX((IP_src),'.',(SELECT * FROM num_octetos))ip, SUM(bytes_tot)vt FROM udp_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_segmentos_min = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT ip, SUM(vt)vol_tot FROM (SELECT DISTINCT SUBSTRING_INDEX((IP_src),'.',(SELECT * FROM num_octetos))ip,SUM(bytes_tot)vt FROM pam_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy");
            rs.next();
            vol_segmentos_pam = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(vol_tot) FROM (SELECT puerto,SUM(vt)vol_tot FROM (SELECT IF(Port_src < Port_dst, Port_src, Port_dst)puerto ,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto DESC UNION ALL SELECT IF(Port_src < Port_dst, Port_src, Port_dst)puerto ,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto)yy GROUP BY puerto ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")zz");
            rs.next();
            vol_puerto_tcp_y_udp = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 20 OR Port_dst = 20 OR Port_src = 21 OR Port_dst = 21");
            rs.next();
            ftpPackets = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 20 OR Port_dst = 20 OR Port_src = 21 OR Port_dst = 21");
            rs.next();
            ftpBytes = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 110 OR Port_dst = 110");
            rs.next();
            pop3Packets = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 110 OR Port_dst = 110");
            rs.next();
            pop3Bytes = rs.getLong(1);
            

            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 25 OR Port_dst = 25");
            rs.next();
            smtpPackets = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 25 OR Port_dst = 25");
            rs.next();
            smtpBytes = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 22 OR Port_dst = 22");
            rs.next();
            sshPackets = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 22 OR Port_dst = 22");
            rs.next();
            sshBytes = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 23 OR Port_dst = 23");
            rs.next();
            telnetPackets = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM tcp_min_" + numTabla + " WHERE Port_src = 23 OR Port_dst = 23");
            rs.next();
            telnetBytes = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM udp_min_" + numTabla + " WHERE Port_src = 161 OR Port_dst = 161 OR Port_src = 162 OR Port_dst = 162");
            rs.next();
            snmpPackets = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(bytes_tot) FROM udp_min_" + numTabla + " WHERE Port_src = 161 OR Port_dst = 161 OR Port_src = 162 OR Port_dst = 162");
            rs.next();
            snmpBytes = rs.getLong(1);
            
            
            
            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM tcp_min_" + numTabla);
            rs.next();
            paquetes_tot_tcp = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM udp_min_" + numTabla);
            rs.next();
            paquetes_tot_udp = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM http_min_" + numTabla);
            rs.next();
            paquetes_tot_http = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(paquetes_tot) FROM pam_min_" + numTabla);
            rs.next();
            paquetes_tot_pam = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT SUM(numRSTs) FROM tcp_min_" + numTabla);
            rs.next();
            numRST = rs.getLong(1);
            
            

            rs = st.executeQuery("SELECT config_nivel_critico_vol FROM configuracion");
            if(rs.next()){
                vol_alarma_max = rs.getLong(1);
            }
            else{
                logger.info("Falta inicializar config_nivel_critico_vol en la tabla configuracion");
            }
            
            
            
            rs = st.executeQuery("SELECT config_nivel_critico_throughput FROM configuracion");
            if(rs.next()){
                throughput_alarma_max = rs.getLong(1);
            }
            else{
                logger.info("Falta inicializar config_nivel_critico_throughput en la tabla configuracion");
            }
            
            
            
            rs = st.executeQuery("select (select sum(bytes_tot) from tcp_min_" + numTabla + ") + (SELECT SUM(bytes_tot) FROM udp_min_" + numTabla + ")");
            rs.next();
            volumen_ips = rs.getLong(1);
            
            

            vol_host_tcp_otros = vol_general_tcp - vol_host_tcp;
            vol_host_udp_otros = vol_general_udp - vol_host_udp;
            vol_host_min_otros = (vol_general_tcp + vol_general_udp) - vol_host_min;
            vol_host_http_otros = vol_general_http - vol_general_host_http;
            vol_segmentos_tcp_otros = vol_general_tcp - vol_segmentos_tcp;
            vol_segmentos_udp_otros = vol_general_udp - vol_segmentos_udp;
            vol_segmentos_http_otros = vol_general_http - vol_segmentos_http;
            vol_segmentos_min_otros = (vol_general_tcp + vol_general_udp) - vol_segmentos_min;
            vol_segmentos_pam_otros = (vol_general_tcp + vol_general_udp) - vol_segmentos_pam;

            ipv4Packets = (paquetes_tot_tcp + paquetes_tot_udp);
            ipv4Bytes = (vol_general_tcp + vol_general_udp);
            /***************TERMINAN LOS CALCULOS PARA OBTENER EL CAMPO OTROS PARA LAS TABLAS**************/




            /******************INICIA LLENADO DE LA TABLA INDICADORES_MIN*******************************/
            rs = null;
            
            rs = st.executeQuery("SELECT paquetesIPV6, bytesIPV6, paquetesARP, bytesARP, icmpPackets, icmpBytes FROM indicadores_min_" + numTabla);

            if (!rs.isClosed()) {
                String[][] indicadores = matSum.ObtieneMatrizQuery(rs, 6);



                if (indicadores.length > 0) {
                    st.execute("insert  into `indicadores_min` values (" + idTablas + "," + (vol_general_tcp + vol_general_udp) + "," + vol_general_tcp + "," + vol_general_udp + "," + vol_general_http + "," + vol_general_pam + "," + (((vol_general_tcp + vol_general_udp) * 8) / 60) + "," + ((vol_general_tcp * 8) / 60) + "," + ((vol_general_udp * 8) / 60) + "," + ((vol_general_http * 8) / 60) + "," + ((vol_general_pam * 8) / 60) + "," + (paquetes_tot_tcp + paquetes_tot_udp) + "," + paquetes_tot_tcp + "," + paquetes_tot_udp + "," + paquetes_tot_http + "," + paquetes_tot_pam + "," + numRST + "," + ipv4Packets + "," + ipv4Bytes + "," + indicadores[0][0] + "," + indicadores[0][1] + "," + indicadores[0][2] + "," + indicadores[0][3] + "," + ftpPackets + "," + ftpBytes + "," + pop3Packets + "," + pop3Bytes + "," + smtpPackets + "," + smtpBytes + "," + sshPackets + "," + sshBytes + "," + telnetPackets + "," + telnetBytes + "," + snmpPackets + "," + snmpBytes + "," + indicadores[0][4] + "," + indicadores[0][5] + ",'" + fechaTablas + "')");
                }
            } else {
                logger.error("no se pudo inicializar rs");
            }


            /******************TERMINA EL LLENADO DE LA TABLA INDICADORES_MIN*******************************/


            
            /**************************************Inicia llenado de Servidores****************************************/
            //@matriz contiene las IP's de los servidores junto con sus respectivos puertos

            rs = null;
            rs = st.executeQuery("SELECT INET_ATON(servidor_ip), servidor_puerto FROM servidor_config");


            double matriz[][] = matSum.ObtieneMatrizQuery(rs);



            for (int id = 0; id < matriz.length - 1; id++)//obtiene el top_ips_conex si hay servidores configurados
            {
                String ip_serv_top_10_conex = "";

                rs = st.executeQuery("select ips from (select ip ips,sum(conex)conexiones from (SELECT IP_src ip, count(*)conex FROM tcp_min_" + numTabla + " WHERE IP_dst=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_dst=" + formatoNumero.format(matriz[id][1]) + " group by ip union all SELECT IP_dst ip, COUNT(*)conex FROM tcp_min_" + numTabla + " WHERE IP_src=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_src=" + formatoNumero.format(matriz[id][1]) + " GROUP BY ip union all SELECT IP_src ip, COUNT(*)conex FROM udp_min_" + numTabla + " WHERE IP_dst=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_dst=" + formatoNumero.format(matriz[id][1]) + " GROUP BY ip UNION ALL SELECT IP_dst ip, COUNT(*)conex FROM udp_min_" + numTabla + " WHERE IP_src=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_src=" + formatoNumero.format(matriz[id][1]) + " GROUP BY ip)xx group by ips order by conexiones desc limit 10)yy");

                String[] ips_servidores_tops = matSum.ObtieneCadenasQuery(rs);




                for (int tope = 0; tope < ips_servidores_tops.length - 1; tope++) {
                    ip_serv_top_10_conex += ips_servidores_tops[tope];

                    if (tope + 1 != ips_servidores_tops.length - 1) {
                        ip_serv_top_10_conex += ",";
                    }
                }


                String ips_top_vol = "";

                rs = st.executeQuery("SELECT ips FROM (SELECT (ip)ips,SUM(vt)vol_tot FROM (SELECT IP_src ip, SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE IP_dst=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_dst=" + formatoNumero.format(matriz[id][1]) + " GROUP BY ip UNION ALL SELECT IP_dst ip, SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE IP_src=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_src=" + formatoNumero.format(matriz[id][1]) + " GROUP BY ip UNION ALL SELECT IP_src ip, SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE IP_dst=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_dst=" + formatoNumero.format(matriz[id][1]) + " GROUP BY ip UNION ALL SELECT IP_dst ip, SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE IP_src=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_src=" + formatoNumero.format(matriz[id][1]) + " GROUP BY ip)xx GROUP BY ips ORDER BY vol_tot DESC LIMIT 10)yy");
                String[] ips_top_vol_tmp = matSum.ObtieneCadenasQuery(rs);



                for (int tope = 0; tope < ips_top_vol_tmp.length - 1; tope++) {
                    ips_top_vol += ips_top_vol_tmp[tope];

                    if (tope + 1 != ips_top_vol_tmp.length - 1) {
                        ips_top_vol += ",";
                    }
                }



                rs = st.executeQuery("select (((SUM(segundos)*1000) + sum(milisegundos))/count(*)) miliseg from tr_min_" + numTabla + " where (IP_src=inet_ntoa(" + formatoNumero.format(matriz[id][0]) + ") and Port_src=" + formatoNumero.format(matriz[id][1]) + ") or (IP_dst=INET_NTOA(" + formatoNumero.format(matriz[id][0]) + ") AND Port_dst=" + formatoNumero.format(matriz[id][1]) + ")");
                servidor_tr = matSum.ObtieneCadenasQuery(rs);




                if (ips_top_vol.length() > 0) {
                    st.execute("INSERT INTO servidor_min SELECT '" + idTablas + "',ip_servidor,puerto_servidor,SUM(vi),SUM(vo),SUM(vt),SUM(conexiones),(SUM(vt)*8)/60,'" + ip_serv_top_10_conex + "','" + ips_top_vol + "'," + servidor_tr[0] + ",'" + fechaTablas + "' FROM (SELECT IP ip_servidor,Puerto puerto_servidor, SUM(bytes_in)vi,SUM(bytes_out)vo,SUM(bytes_totales)vt,SUM(conex)conexiones FROM (SELECT  MAX(IP_src) IP, Port_src Puerto,SUM(bytes_dst) bytes_in, SUM(bytes_src) bytes_out, SUM(bytes_tot) bytes_totales, COUNT(*)conex FROM tcp_min_" + numTabla + " WHERE IP_src = inet_ntoa(" + formatoNumero.format(matriz[id][0]) + ") AND Port_src = " + formatoNumero.format(matriz[id][1]) + " UNION ALL SELECT MAX(IP_dst) IP, Port_dst Puerto,SUM(bytes_src) bytes_in, SUM(bytes_dst) bytes_out, SUM(bytes_tot) bytes_totales, COUNT(*)conex FROM tcp_min_" + numTabla + " WHERE IP_dst = inet_ntoa(" + formatoNumero.format(matriz[id][0]) + ") AND Port_dst = " + formatoNumero.format(matriz[id][1]) + " )tcp WHERE (LENGTH(IP)>0) UNION ALL SELECT IP ip_servidor,max(Puerto) puerto_servidor, SUM(bytes_in)vi,SUM(bytes_out)vo,SUM(bytes_totales)vt,SUM(conex)conexiones FROM (SELECT  MAX(IP_src) IP, Port_src Puerto,SUM(bytes_dst) bytes_in, SUM(bytes_src) bytes_out, SUM(bytes_tot) bytes_totales, COUNT(*)conex FROM udp_min_" + numTabla + " WHERE IP_src = inet_ntoa(" + formatoNumero.format(matriz[id][0]) + ") AND Port_src = " + formatoNumero.format(matriz[id][0]) + " UNION ALL SELECT  MAX(IP_dst) IP, Port_dst Puerto,SUM(bytes_src) bytes_in, SUM(bytes_dst) bytes_out, SUM(bytes_tot) bytes_totales, COUNT(*)conex FROM udp_min_" + numTabla + " WHERE IP_dst = inet_ntoa(" + formatoNumero.format(matriz[id][0]) + ") AND Port_dst = " + formatoNumero.format(matriz[id][0]) + " )udp WHERE (LENGTH(IP)>0))xx WHERE (LENGTH(ip_servidor)>0)");
                }
            }


            /**************************************termina el llenado de Servidores****************************************/


            /********INICIA LLENADO DE TABLAS DE VOLUMEN****/
            st.execute("INSERT INTO vol_tcp_min select '" + idTablas + "',sum(bytes_src),sum(bytes_dst),sum(bytes_tot),'" + fechaTablas + "' from tcp_min_" + numTabla);
            st.execute("INSERT INTO vol_udp_min select '" + idTablas + "',sum(bytes_src),sum(bytes_dst),sum(bytes_tot),'" + fechaTablas + "' from udp_min_" + numTabla);
            st.execute("INSERT INTO vol_http_min select '" + idTablas + "',sum(bytes_src),sum(bytes_dst),sum(bytes_tot),'" + fechaTablas + "' from http_min_" + numTabla);
            

            if (pamConfigArray.length > 0)//i.e que hay puertos a monitorear
            {
                for (int indpam = 0; indpam < pamConfigArray.length - 1; indpam++) {
                    st.execute("CREATE TABLE IF NOT EXISTS `pam_ip_" + pamConfigArray[indpam] + "` (`id_pam_host` bigint(10) , `pam_host_IP` varchar(16) , `pam_host_bytes_src` int(10) DEFAULT NULL, `pam_host_bytes_dst` int(10) DEFAULT NULL, `pam_host_bytes_tot` int(10) DEFAULT NULL, `pam_host_a` tinyint(1) , `pam_host_b` tinyint(1) , `pam_host_fecha` datetime DEFAULT NULL, PRIMARY KEY (`id_pam_host`,`pam_host_IP`,`pam_host_a`,`pam_host_b`)) ENGINE=MyISAM DEFAULT CHARSET=latin1");
                }
                st.execute("INSERT INTO vol_pam_min select '" + idTablas + "',IF(SUM(bytes_src) <=> NULL, 0, SUM(bytes_src)), IF(SUM(bytes_dst) <=> NULL, 0, SUM(bytes_dst)), IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_tot)),'" + fechaTablas + "' from pam_min_" + numTabla);
            }

            st.execute("insert into vol_min (select '" + idTablas + "',sum(sum_src),sum(sum_dst),sum(sum_tot),'" + fechaTablas + "' from (select sum(bytes_src)sum_src,sum(bytes_dst)sum_dst,sum(bytes_tot)sum_tot from tcp_min_" + numTabla + " union all select sum(bytes_src)sum_src,sum(bytes_dst)sum_dst,sum(bytes_tot)sum_tot from udp_min_" + numTabla + ")XX)");
            /********TERMINA EL LLENADO DE TABLAS DE VOLUMEN****/

            
            st.execute("insert into tcp_min select '" + idTablas + "',IP_src,Port_src,IP_dst,Port_dst, bytes_src,paquetes_src,bytes_dst,paquetes_dst,bytes_tot,paquetes_tot,inicia,miliseg_inicia,fin,miliseg_fin,cve_edif_a,cve_edif_b,'" + fechaTablas + "' from tcp_min_" + numTabla + " order by bytes_tot desc limit " + limiteResumen);
            st.execute("insert into udp_min select '" + idTablas + "',IP_src,Port_src,IP_dst,Port_dst, bytes_src,paquetes_src,bytes_dst,paquetes_dst,bytes_tot,paquetes_tot,inicia,miliseg_inicia,cve_edif_a,cve_edif_b,'" + fechaTablas + "' from udp_min_" + numTabla + " order by bytes_tot desc limit " + limiteResumen);

            int limResGlomin = Integer.parseInt(limiteResumen) * 2;

            st.execute("insert into global_min select '" + idTablas + "', IP_src, Port_src, IP_dst, Port_dst, bytes_src, bytes_dst, bytes_tot FROM tcp_min_" + numTabla + " order by bytes_tot desc limit " + limResGlomin);
            st.execute("insert into global_min select '" + idTablas + "', IP_src, Port_src, IP_dst, Port_dst, bytes_src, bytes_dst, bytes_tot FROM udp_min_" + numTabla + " order by bytes_tot desc limit " + limResGlomin);
            if (completa) {
                st.execute("insert into global_completa_min select '" + idTablas + "',IP_src,Port_src,IP_dst,Port_dst, bytes_src,bytes_dst,bytes_tot,0 from tcp_min_" + numTabla);
                st.execute("insert into global_completa_min select '" + idTablas + "',IP_src,Port_src,IP_dst,Port_dst, bytes_src,bytes_dst,bytes_tot,1 from udp_min_" + numTabla);
            }
            /********INICIA LLENADO DE TABLAS DE HOST****/
            st.execute("insert into host_tcp_min select '" + idTablas + "', ip, sum(vs),sum(vd),sum(vt)vol_tot," + vol_host_tcp_otros + ", 1,1,'" + fechaTablas + "' from (select (IP_src)ip,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from tcp_min_" + numTabla + " group by ip )xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into host_udp_min select '" + idTablas + "', ip, sum(vs),sum(vd),sum(vt)vol_tot," + vol_host_udp_otros + ", 1,1, '" + fechaTablas + "' from (select (IP_src)ip,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from udp_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into host_http_min select '" + idTablas + "', ip, sum(vs),sum(vd),sum(vt)vol_tot," + vol_host_http_otros + ", 1,1, '" + fechaTablas + "' from (select (IP_src)ip,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from http_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into host_pam_min select '" + idTablas + "', ip, sum(vs),sum(vd),sum(vt)vol_tot, 1,1, '" + fechaTablas + "' from (select (IP_src)ip,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from pam_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into host_min select '" + idTablas + "',ip,sum(vs),sum(vd),sum(vt)vol_tot," + vol_host_min_otros + ",'1','" + fechaTablas + "' from (select (IP_src)ip,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from tcp_min_" + numTabla + " group by ip union all select (IP_src)ip,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from udp_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            /********TERMINA LLENADO DE TABLAS DE HOST****/



            /***** INICIA LLENADO DE LAS TABLAS DE PUERTOS  ***/
            st.execute("INSERT INTO puerto_tcp_min SELECT " + idTablas + ", IF(Port_src < Port_dst, Port_src, Port_dst)puerto ,COUNT(*)conex,SUM(bytes_src),SUM(bytes_dst),SUM(bytes_tot)vt," + (vol_general_tcp - vol_puerto_tcp) + ", 1, 1, '" + fechaTablas + "' FROM tcp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto ORDER BY vt DESC LIMIT " + limiteResumen);
            st.execute("INSERT INTO puerto_udp_min SELECT " + idTablas + ", IF(Port_src < Port_dst, Port_src, Port_dst)puerto ,COUNT(*)conex,SUM(bytes_src),SUM(bytes_dst),SUM(bytes_tot)vt," + (vol_general_udp - vol_puerto_udp) + ", 1, 1, '" + fechaTablas + "' FROM udp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto ORDER BY vt DESC LIMIT " + limiteResumen);
            st.execute("insert into puerto_min SELECT '" + idTablas + "',puerto, SUM(conex),SUM(vs),SUM(vd),SUM(vt)vol_tot," + ((vol_general_tcp + vol_general_udp) - vol_puerto_tcp_y_udp) + ",'" + fechaTablas + "' FROM (SELECT IF(Port_src < Port_dst, Port_src, Port_dst)puerto ,COUNT(*)conex,SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto DESC UNION ALL SELECT IF(Port_src < Port_dst, Port_src, Port_dst)puerto ,COUNT(*)conex,SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto)yy GROUP BY puerto ORDER BY vol_tot DESC LIMIT " + limiteResumen);


            for (int indpam = 0; indpam < pamConfigArray.length - 1; indpam++) {
                st.execute("insert into puerto_pam_min select '" + idTablas + "','" + pamConfigArray[indpam] + "',count(*),IF(SUM(bytes_src) <=> NULL, 0, SUM(bytes_src)), IF(SUM(bytes_dst) <=> NULL, 0, SUM(bytes_dst)), IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_tot)) vt,'" + fechaTablas + "' from pam_min_" + numTabla + " where Port_src=" + pamConfigArray[indpam] + " or Port_dst=" + pamConfigArray[indpam] + " ORDER BY vt DESC LIMIT " + limiteResumen);
                st.execute("INSERT INTO pam_ip_" + pamConfigArray[indpam] + " select '" + idTablas + "',((IP_src))host_a,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt,'1','0','" + fechaTablas + "' from pam_min_" + numTabla + " where Port_src='" + pamConfigArray[indpam] + "' group by host_a order by vt desc limit " + limiteResumen);
                st.execute("INSERT INTO tr_pam_min SELECT '" + idTablas + "','" + pamConfigArray[indpam] + "',COUNT(*) conex, SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot) vt, MIN(segundos)min_seg,MIN(milisegundos)min_miliseg, MAX(segundos)max_seg,MAX(milisegundos)max_miliseg, AVG(segundos)avg_seg,AVG(milisegundos)avg_miliseg, '" + fechaTablas + "' FROM tr_min_" + numTabla + " WHERE (Port_src =" + pamConfigArray[indpam] + " OR Port_dst =" + pamConfigArray[indpam] + ") ORDER BY vt DESC LIMIT " + limiteResumen);
            }
            /***** TERMINA LLENADO DE LAS TABLAS DE PUERTOS  ***/



            /***********************LLENADO DE TABLAS DE CONEXIONES ****************************/
            st.execute("insert into conex_tcp_min  select '" + idTablas + "',ip,sum(conex)con_tot,sum(vs),sum(vd),sum(vt),'1','1','" + fechaTablas + "' from (select (IP_src)ip,count(*)conex,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from tcp_min_" + numTabla + " group by IP_src)yy group by ip order by con_tot desc limit " + limiteResumen);
            st.execute("insert into conex_udp_min  select '" + idTablas + "',ip,sum(conex)con_tot,sum(vs),sum(vd),sum(vt),'1','1','" + fechaTablas + "' from (select (IP_src)ip,count(*)conex,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from udp_min_" + numTabla + " group by IP_src)yy group by ip order by con_tot desc limit " + limiteResumen);
            st.execute("insert into conex_http_min  select '" + idTablas + "',ip,sum(conex)con_tot,sum(vs),sum(vd),sum(vt),'1','1','" + fechaTablas + "' from (select (IP_src)ip,count(*)conex,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from http_min_" + numTabla + " group by IP_src)yy group by ip order by con_tot desc limit " + limiteResumen);
            st.execute("insert into conex_pam_min  select '" + idTablas + "',ip,sum(conex)con_tot,sum(vs),sum(vd),sum(vt),'1','1','" + fechaTablas + "' from (select (IP_src)ip,count(*)conex,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from pam_min_" + numTabla + " group by IP_src)yy group by ip order by con_tot desc limit " + limiteResumen);
            st.execute("insert into conex_min select '" + idTablas + "',ip,sum(conex)con_tot ,sum(vs)vol_in, sum(vd)vol_out, sum(vt)vol_tot,'1','" + fechaTablas + "' from (select (IP_src)ip,count(*)conex,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from tcp_min_" + numTabla + " group by ip  union all select (IP_src)ip,count(*)conex,sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from udp_min_" + numTabla + " group by ip)xx group by ip order by con_tot desc limit " + limiteResumen);
            /***********************FIN DE LLENADO DE TABLAS DE CONEXIONES ****************************/


            /***********************       LLENADO DE TABLA DE SEGMENTOS ****************************/
            st.execute("insert into segmentos_tcp_min select '" + idTablas + "',ip, sum(vs),sum(vd),sum(vt)vol_tot," + vol_segmentos_tcp_otros + ",'" + fechaTablas + "' from (select distinct SUBSTRING_INDEX((IP_src),'.',(select * from num_octetos))ip, sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from tcp_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into segmentos_udp_min select '" + idTablas + "',ip, sum(vs),sum(vd),sum(vt)vol_tot," + vol_segmentos_udp_otros + ",'" + fechaTablas + "' from (select distinct SUBSTRING_INDEX((IP_src),'.',(select * from num_octetos))ip, sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from udp_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into segmentos_http_min select '" + idTablas + "',ip, sum(vs),sum(vd),sum(vt)vol_tot," + vol_segmentos_http_otros + ",'" + fechaTablas + "' from (select distinct SUBSTRING_INDEX((IP_src),'.',(select * from num_octetos))ip, sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from http_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into segmentos_pam_min select '" + idTablas + "',ip, sum(vs),sum(vd),sum(vt)vol_tot," + vol_segmentos_pam_otros + ",'" + fechaTablas + "' from (select distinct SUBSTRING_INDEX((IP_src),'.',(select * from num_octetos))ip, sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from pam_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            st.execute("insert into segmentos_min select '" + idTablas + "',ip,sum(vs),sum(vd),sum(vt)vol_tot," + vol_segmentos_min_otros + ",'1','" + fechaTablas + "' from (select distinct SUBSTRING_INDEX((IP_src),'.',(select * from num_octetos))ip, sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from tcp_min_" + numTabla + " group by ip union all select distinct SUBSTRING_INDEX((IP_src),'.',(select * from num_octetos))ip, sum(bytes_src)vs,sum(bytes_dst)vd,sum(bytes_tot)vt from udp_min_" + numTabla + " group by ip)xx group by ip order by vol_tot desc limit " + limiteResumen);
            /***********************FIN DE LLENADO DE TABLA DE SEGMENTOS ****************************/

            /***********************LLENADO DE LA TABLA CONVERSACIONES DURACION******************************/
            st.execute("INSERT INTO conv_duracion_min select '" + idTablas + "',(IP_src)ipa,Port_src,(IP_dst)ipb,Port_dst, sum(bytes_src)vs,sum(bytes_dst)vd, sum(bytes_tot)vt, sum(abs(fin-inicia)) segundos,'" + fechaTablas + "' from tcp_min_" + numTabla + " group by ipa,Port_src,ipb,Port_dst order by vt desc limit " + limiteResumen);
            st.execute("INSERT INTO conv_duracion_http_min SELECT '" + idTablas + "',(IP_src)ipa,Port_src,(IP_dst)ipb,Port_dst,url, SUM(bytes_src)vs,SUM(bytes_dst)vd, SUM(bytes_tot)vt, SUM(ABS(fin-inicia)) segundos,'" + fechaTablas + "' FROM http_min_" + numTabla + " GROUP BY ipa,Port_src,ipb,Port_dst ORDER BY vt DESC LIMIT " + limiteResumen);
            st.execute("INSERT INTO conv_duracion_pam_min select '" + idTablas + "',(IP_src)ipa,Port_src,(IP_dst)ipb,Port_dst, sum(bytes_src)vs,sum(bytes_dst)vd, sum(bytes_tot)vt, sum(abs(fin-inicia)) segundos,'" + fechaTablas + "' from pam_min_" + numTabla + " group by ipa,Port_src,ipb,Port_dst order by vt desc limit " + limiteResumen);
            /***********************FIN DEL LLENADO DE LA TABLA CONVERSACIONES DURACION******************************/
            /************************ INICIA LLENADO DE TABLAS DE TIEMPO DE RESPUESTA********************************/
            st.execute("INSERT INTO tr_tcp_min SELECT '" + idTablas + "',IF(Port_src < Port_dst, Port_src, Port_dst)puerto,COUNT(*) conex, SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot) vt, MIN(segundos)min_seg,MIN(milisegundos)min_miliseg, MAX(segundos)max_seg,MAX(milisegundos)max_miliseg, ROUND(AVG(segundos),3) avg_seg,ROUND(AVG(milisegundos),3) avg_miliseg, '" + fechaTablas + "' FROM tr_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto ORDER BY vt DESC LIMIT " + limiteResumen);
            st.execute("INSERT INTO tr_min SELECT '" + idTablas + "',IF(Port_src < Port_dst, Port_src, Port_dst)puerto,COUNT(*) conex, SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot) vt, MIN(segundos)min_seg,MIN(milisegundos)min_miliseg, MAX(segundos)max_seg,MAX(milisegundos)max_miliseg, ROUND(AVG(segundos),3) avg_seg,ROUND(AVG(milisegundos),3) avg_miliseg, '" + fechaTablas + "' FROM tr_min_" + numTabla + " WHERE ((Port_src < 49152 AND Port_dst < 49152) OR (Port_src < 49152 AND Port_dst >= 49152) OR (Port_src >= 49152 AND Port_dst < 49152)) GROUP BY puerto ORDER BY vt DESC LIMIT " + limiteResumen);
            /************************ Termina LLENADO DE TABLAS DE TIEMPO DE RESPUESTA********************************/


            /**** AQUI EMPIEZA EL LLENADO DE LA TABLA nav_url_min  ****/
            rs = st.executeQuery("SELECT url,SUM(bytes_src),SUM(bytes_dst),SUM(bytes_tot)vt FROM http_min_" + numTabla + " GROUP BY url ORDER BY vt DESC LIMIT " + limiteResumen);
            String[][] arreglo_de_urls_con_vol = matSum.ObtieneMatrizQuery(rs, 4);
            
            

            rs = st.executeQuery("SELECT url,IP_dst,SUM(bytes_tot)vt FROM http_min_" + numTabla + " GROUP BY url ORDER BY vt DESC LIMIT " + limiteResumen);
            String[][] arreglo_url_con_sus_correspondientes_ip = matSum.ObtieneMatrizQuery(rs, 3);
            String[][] arreglo_tr_x_url = null;
            
            

            String[] ips_por_url_tmp = null;
            String ips_por_url = "";





            for (int m = 0; m < arreglo_de_urls_con_vol.length; m++) {
                ips_por_url = "";
                rs = st.executeQuery("SELECT ip FROM (SELECT (IP_src) ip, SUM(bytes_tot) vt FROM http_min_" + numTabla + " WHERE url LIKE '" + arreglo_de_urls_con_vol[m][0] + "' GROUP BY ip ORDER BY vt DESC )xx LIMIT " + limiteResumen);

                ips_por_url_tmp = matSum.ObtieneCadenasQuery(rs);

                for (int i = 0; i < ips_por_url_tmp.length - 1; i++) {
                    ips_por_url += ips_por_url_tmp[i];

                    if (i + 1 != ips_por_url_tmp.length - 1) {
                        ips_por_url += ",";
                    }
                }
                arreglo_tr_x_url = null;
                
                

                rs = st.executeQuery("SELECT  if(AVG(tiempo_conex)>0,ROUND(AVG(tiempo_conex),3),0), if(AVG(con_estab_a_ini_solicitud) >0,ROUND(AVG(con_estab_a_ini_solicitud),3) ,0), if(AVG(tiempo_solicitud)>0,ROUND(AVG(tiempo_solicitud),3),0),if(AVG(tiempo_respuesta)>0,ROUND(AVG(tiempo_respuesta),3),0),if(MIN(tiempo_respuesta)>0,ROUND(MIN(tiempo_respuesta),3),0),if(MAX(tiempo_respuesta)>0,ROUND(MAX(tiempo_respuesta),3),0),if(AVG(ult_resp_a_sig_solicitud)>0,ROUND(AVG(ult_resp_a_sig_solicitud),3),0) FROM (SELECT  IP_src,    SUM(conection_time) tiempo_conex,  SUM(idle_time_0) con_estab_a_ini_solicitud,  SUM(request_time)tiempo_solicitud,  SUM(response_time)tiempo_respuesta,   SUM(idle_time_1) ult_resp_a_sig_solicitud FROM http_tr_min_" + numTabla + " WHERE IF(CHAR_LENGTH(referer)>1,referer LIKE '" + arreglo_url_con_sus_correspondientes_ip[m][0] + "%'  ,IP_dst LIKE '" + arreglo_url_con_sus_correspondientes_ip[m][1] + "') GROUP BY IP_src )xx");
                arreglo_tr_x_url = matSum.ObtieneMatrizQuery(rs, 7);
                
                

                st.execute("INSERT INTO nav_url_min VALUES ('" + idTablas + "','" + arreglo_de_urls_con_vol[m][0] + "','" + ips_por_url + "'," + arreglo_de_urls_con_vol[m][1] + "," + arreglo_de_urls_con_vol[m][2] + "," + arreglo_de_urls_con_vol[m][3] + "," + formatoNumero.format(Double.parseDouble(arreglo_tr_x_url[0][0])) + "," + formatoNumero.format(Double.parseDouble(arreglo_tr_x_url[0][1])) + "," + formatoNumero.format(Double.parseDouble(arreglo_tr_x_url[0][2])) + "," + formatoNumero.format(Double.parseDouble(arreglo_tr_x_url[0][3])) + "," + formatoNumero.format(Double.parseDouble(arreglo_tr_x_url[0][4])) + "," + formatoNumero.format(Double.parseDouble(arreglo_tr_x_url[0][5])) + "," + formatoNumero.format(Double.parseDouble(arreglo_tr_x_url[0][6])) + "," + "'" + fechaTablas + "')");
            }
            /**** AQUI TERMINA EL LLENADO DE LA TABLA nav_url_min  ****/

            
            /**** AQUI EMPIEZA EL LLENADO DE LA TABLA nav_ip_min  ****/
            rs = st.executeQuery("SELECT (IP_src)ip,SUM(bytes_src),SUM(bytes_dst),SUM(bytes_tot)vt FROM http_min_" + numTabla + " GROUP BY ip ORDER BY vt DESC LIMIT " + limiteResumen);
            String[][] arreglo_de_ips_con_vol = matSum.ObtieneMatrizQuery(rs, 4);
            String[] urls_por_ip_tmp = null;
            String urls_por_ip = "";
            
            

            for (int m = 0; m < arreglo_de_ips_con_vol.length; m++) {
                urls_por_ip = "";
                rs = st.executeQuery("SELECT url FROM (SELECT url, SUM(bytes_tot) vt FROM http_min_" + numTabla + " WHERE (IP_src) LIKE '" + arreglo_de_ips_con_vol[m][0] + "' GROUP BY url ORDER BY vt DESC)xx LIMIT " + limiteResumen);
                urls_por_ip_tmp = matSum.ObtieneCadenasQuery(rs);
                
                

                for (int i = 0; i < urls_por_ip_tmp.length - 1; i++) {
                    urls_por_ip += urls_por_ip_tmp[i];

                    if (i + 1 != urls_por_ip_tmp.length - 1) {
                        urls_por_ip += ",";
                    }
                }
                st.execute("INSERT INTO nav_ip_min VALUES ('" + idTablas + "','" + arreglo_de_ips_con_vol[m][0] + "','" + urls_por_ip + "', " + arreglo_de_ips_con_vol[m][1] + ", " + arreglo_de_ips_con_vol[m][2] + "," + arreglo_de_ips_con_vol[m][3] + ",'" + fechaTablas + "')");
            }
            /**** AQUI TERMINA EL LLENADO DE LA TABLA nav_ip_min  ****/

  
            /********************INICIA LLENADO DE LA TABLA CONV_MIN**************************/

            rs = st.executeQuery("SELECT ip,SUM(vt)vol_tot FROM (SELECT (IP_src)ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " GROUP BY ip union all SELECT (IP_dst)ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " GROUP BY ip UNION ALL SELECT (IP_src)ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " GROUP BY ip UNION ALL SELECT (IP_dst)ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen);
            String[] ip_conversa = matSum.ObtieneCadenasQuery(rs);
            
            

                    
            String[][] ips_con_vol = null;
            String ips_conv = "";
            String vol_convs = "";
            for (int k = 0; k < ip_conversa.length - 1; k++) {
                ips_conv = "";
                vol_convs = "";

                rs = st.executeQuery("SELECT ip,SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE (IP_src) LIKE '" + ip_conversa[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ip_conversa[k] + "' GROUP BY ip union all SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE (IP_src) LIKE '" + ip_conversa[k] + "' GROUP BY ip union all SELECT (IP_src) ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ip_conversa[k] + "' GROUP BY ip )xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen);
                ips_con_vol = matSum.ObtieneMatrizQuery(rs, 2);
                
                



                for (int h = 0; h < ips_con_vol.length; h++) {
                    ips_conv += ips_con_vol[h][0];
                    if (h + 1 <= ips_con_vol.length - 1) {
                        ips_conv += ",";
                    }
                }

                for (int h = 0; h < ips_con_vol.length; h++) {
                    vol_convs += ips_con_vol[h][1];

                    if (h + 1 <= ips_con_vol.length - 1) {
                        vol_convs += ",";
                    }
                }

                //long vol_ip_otros=sumalizacionBD.RegresaDatosQuery("select (select sum(vt)vol_global from (select sum(bytes_tot)vt from tcp_min_"+numTabla+" WHERE (IP_src) LIKE '"+ip_conversa[k]+"' or (IP_dst) LIKE '"+ip_conversa[k]+"' union all SELECT SUM(bytes_tot)vt FROM udp_min_"+numTabla+" WHERE (IP_src) LIKE '"+ip_conversa[k]+"' OR (IP_dst) LIKE '"+ip_conversa[k]+"')xx) - (select sum(vol_tot)vol_conv from (SELECT ip,SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM tcp_min_"+numTabla+" WHERE (IP_src) LIKE '"+ip_conversa[k]+"' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM tcp_min_"+numTabla+" WHERE (IP_dst) LIKE '"+ip_conversa[k]+"' GROUP BY ip UNION ALL SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM udp_min_"+numTabla+" WHERE (IP_src) LIKE '"+ip_conversa[k]+"' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM udp_min_"+numTabla+" WHERE (IP_dst) LIKE '"+ip_conversa[k]+"' GROUP BY ip)xx WHERE  LENGTH(ip)>0  GROUP BY ip ORDER BY vol_tot DESC LIMIT "+limiteResumen+")yy) otros");
                long vol_ip_otros = 0;

                st.execute("insert into conv_min values ('" + idTablas + "','" + ip_conversa[k] + "','" + ips_conv + "','" + vol_convs + "','" + fechaTablas + "'," + vol_ip_otros + ")");
            }
            /********************TERMINA LLENADO DE LA TABLA CONV_MIN**************************/


            /********************INICIA EL LLENADO DE LAS TABLAS CONV_TCP_MIN**************************/

            rs = st.executeQuery("select ip ips,sum(vt)vol_tot from (SELECT (IP_src) ip, SUM(bytes_tot) vt FROM tcp_min_" + numTabla + " GROUP BY ip union all SELECT (IP_dst) ip, SUM(bytes_tot) vt FROM tcp_min_" + numTabla + " GROUP BY ip)xx group by ips order by vol_tot desc limit " + limiteResumen);
            String[] ips_conv_tcp = matSum.ObtieneCadenasQuery(rs);
            String[][] ips_con_vol_conv_tcp = null;
            String ips_que_conv_tcp = "";
            String vol_convs_tcp = "";
            
            

            for (int k = 0; k < ips_conv_tcp.length - 1; k++) {
                ips_que_conv_tcp = "";
                vol_convs_tcp = "";
                rs = st.executeQuery("SELECT ip,SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_tcp[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_tcp[k] + "' GROUP BY ip )xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen);
                ips_con_vol_conv_tcp = matSum.ObtieneMatrizQuery(rs, 2);
                
                

                for (int h = 0; h < ips_con_vol_conv_tcp.length; h++) {
                    ips_que_conv_tcp += ips_con_vol_conv_tcp[h][0];
                    if (h + 1 <= ips_con_vol_conv_tcp.length - 1) {
                        ips_que_conv_tcp += ",";
                    }
                }

                for (int h = 0; h < ips_con_vol_conv_tcp.length; h++) {
                    vol_convs_tcp += ips_con_vol_conv_tcp[h][1];

                    if (h + 1 <= ips_con_vol_conv_tcp.length - 1) {
                        vol_convs_tcp += ",";
                    }
                }

                rs = st.executeQuery("select (select sum(bytes_tot) vol_tot from tcp_min_" + numTabla + " where IP_src like '" + ips_conv_tcp[k] + "' or IP_dst LIKE '" + ips_conv_tcp[k] + "') - (select sum(vol_tot) from (SELECT SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_tcp[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM tcp_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_tcp[k] + "' GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy)");
                long vol_ip_tcp_otros = matSum.RegresaDatosQuery(rs);
                
                
                st.execute("insert into conv_tcp_min values ('" + idTablas + "','" + ips_conv_tcp[k] + "','" + ips_que_conv_tcp + "','" + vol_convs_tcp + "','" + fechaTablas + "'," + vol_ip_tcp_otros + ")");
            }
            /********************TERMINA EL LLENADO DE LAS TABLAS CONV_TCP_MIN**************************/


            /********************INICIA EL LLENADO DE LAS TABLAS CONV_UDP_MIN**************************/

            rs = st.executeQuery("select ip ips,sum(vt)vol_tot from (SELECT (IP_src) ip, SUM(bytes_tot) vt FROM udp_min_" + numTabla + " GROUP BY ip union all SELECT (IP_dst) ip, SUM(bytes_tot) vt FROM udp_min_" + numTabla + " GROUP BY ip)xx group by ips order by vol_tot desc limit " + limiteResumen);
            String[] ips_conv_udp = matSum.ObtieneCadenasQuery(rs);
            
            

            String[][] ips_con_vol_conv_udp = null;
            String ips_que_conv_udp = "";
            String vol_convs_udp = "";
            for (int k = 0; k < ips_conv_udp.length - 1; k++) {
                ips_que_conv_udp = "";
                vol_convs_udp = "";

                rs = st.executeQuery("SELECT ip,SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_udp[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_udp[k] + "' GROUP BY ip )xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen);
                ips_con_vol_conv_udp = matSum.ObtieneMatrizQuery(rs, 2);
                
                

                for (int h = 0; h < ips_con_vol_conv_udp.length; h++) {
                    ips_que_conv_udp += ips_con_vol_conv_udp[h][0];
                    if (h + 1 <= ips_con_vol_conv_udp.length - 1) {
                        ips_que_conv_udp += ",";
                    }
                }

                for (int h = 0; h < ips_con_vol_conv_udp.length; h++) {
                    vol_convs_udp += ips_con_vol_conv_udp[h][1];

                    if (h + 1 <= ips_con_vol_conv_udp.length - 1) {
                        vol_convs_udp += ",";
                    }
                }

                rs = st.executeQuery("select (select sum(bytes_tot) vol_tot from udp_min_" + numTabla + " where IP_src like '" + ips_conv_udp[k] + "' or IP_dst LIKE '" + ips_conv_udp[k] + "') - (select sum(vol_tot) from (SELECT SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_udp[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM udp_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_udp[k] + "' GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy)");
                long vol_ip_udp_otros = matSum.RegresaDatosQuery(rs);
                
                
                
                st.execute("insert into conv_udp_min values ('" + idTablas + "','" + ips_conv_udp[k] + "','" + ips_que_conv_udp + "','" + vol_convs_udp + "','" + fechaTablas + "'," + vol_ip_udp_otros + ")");
            }
            /********************TERMINA EL LLENADO DE LAS TABLAS CONV_UDP_MIN**************************/


            /********************INICIA EL LLENADO DE LAS TABLAS CONV_HTTP_MIN**************************/

            rs = st.executeQuery("select ip ips,sum(vt)vol_tot from (SELECT (IP_src) ip, SUM(bytes_tot) vt FROM http_min_" + numTabla + " GROUP BY ip union all SELECT (IP_dst) ip, SUM(bytes_tot) vt FROM http_min_" + numTabla + " GROUP BY ip)xx group by ips order by vol_tot desc limit " + limiteResumen);
            String[] ips_conv_http = matSum.ObtieneCadenasQuery(rs);
            
            
                
            String[][] ips_con_vol_conv_http = null;
            String ips_que_conv_http = "";
            String vol_convs_http = "";
            for (int k = 0; k < ips_conv_http.length - 1; k++) {
                ips_que_conv_http = "";
                vol_convs_http = "";

                rs = st.executeQuery("SELECT ip,SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM http_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_http[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM http_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_http[k] + "' GROUP BY ip )xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen);
                ips_con_vol_conv_http = matSum.ObtieneMatrizQuery(rs, 2);
                
                

                for (int h = 0; h < ips_con_vol_conv_http.length; h++) {
                    ips_que_conv_http += ips_con_vol_conv_http[h][0];
                    if (h + 1 <= ips_con_vol_conv_http.length - 1) {
                        ips_que_conv_http += ",";
                    }
                }

                for (int h = 0; h < ips_con_vol_conv_http.length; h++) {
                    vol_convs_http += ips_con_vol_conv_http[h][1];

                    if (h + 1 <= ips_con_vol_conv_http.length - 1) {
                        vol_convs_http += ",";
                    }
                }

                rs = st.executeQuery("select (select sum(bytes_tot) vol_tot from http_min_" + numTabla + " where IP_src like '" + ips_conv_http[k] + "' or IP_dst LIKE '" + ips_conv_http[k] + "') - (select sum(vol_tot) from (SELECT SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM http_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_http[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM http_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_http[k] + "' GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy)");
                long vol_ip_http_otros = matSum.RegresaDatosQuery(rs);
                
                

                st.execute("insert into conv_http_min values ('" + idTablas + "','" + ips_conv_http[k] + "','" + ips_que_conv_http + "','" + vol_convs_http + "','" + fechaTablas + "'," + vol_ip_http_otros + ")");
            }
            /********************TERMINA EL LLENADO DE LAS TABLAS CONV_HTTP_MIN**************************/


            /*****************INICIA EL LLENADO DE LAS TABLAS CONV_PAM_MIN********************************/

            rs = st.executeQuery("select ip ips,sum(vt)vol_tot from (SELECT (IP_src) ip, SUM(bytes_tot) vt FROM pam_min_" + numTabla + " GROUP BY ip union all SELECT (IP_dst) ip, SUM(bytes_tot) vt FROM pam_min_" + numTabla + " GROUP BY ip)xx group by ips order by vol_tot desc limit " + limiteResumen);
            String[] ips_conv_pam = matSum.ObtieneCadenasQuery(rs);
            
            
            
            String[][] ips_con_vol_conv_pam = null;
            String ips_que_conv_pam = "";
            String vol_convs_pam = "";
            
            for (int k = 0; k < ips_conv_pam.length - 1; k++) {
                ips_que_conv_pam = "";
                vol_convs_pam = "";


                rs = st.executeQuery("SELECT ip,SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM pam_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_pam[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM pam_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_pam[k] + "' GROUP BY ip )xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen);
                ips_con_vol_conv_pam = matSum.ObtieneMatrizQuery(rs, 2);
                
                

                for (int h = 0; h < ips_con_vol_conv_pam.length; h++) {
                    ips_que_conv_pam += ips_con_vol_conv_pam[h][0];
                    if (h + 1 <= ips_con_vol_conv_pam.length - 1) {
                        ips_que_conv_pam += ",";
                    }
                }

                for (int h = 0; h < ips_con_vol_conv_pam.length; h++) {
                    vol_convs_pam += ips_con_vol_conv_pam[h][1];

                    if (h + 1 <= ips_con_vol_conv_pam.length - 1) {
                        vol_convs_pam += ",";
                    }
                }

                rs = st.executeQuery("select (select sum(bytes_tot) vol_tot from pam_min_" + numTabla + " where IP_src like '" + ips_conv_pam[k] + "' or IP_dst LIKE '" + ips_conv_pam[k] + "') - (select sum(vol_tot) from (SELECT SUM(vt)vol_tot FROM (SELECT (IP_dst) ip,SUM(bytes_tot)vt FROM pam_min_" + numTabla + " WHERE (IP_src) LIKE '" + ips_conv_pam[k] + "' GROUP BY ip UNION ALL SELECT (IP_src) ip,SUM(bytes_tot)vt FROM pam_min_" + numTabla + " WHERE (IP_dst) LIKE '" + ips_conv_pam[k] + "' GROUP BY ip)xx GROUP BY ip ORDER BY vol_tot DESC LIMIT " + limiteResumen + ")yy)");
                long vol_ip_pam_otros = matSum.RegresaDatosQuery(rs);
                
                

                st.execute("insert into conv_pam_min values ('" + idTablas + "','" + ips_conv_pam[k] + "','" + ips_que_conv_pam + "','" + vol_convs_pam + "','" + fechaTablas + "'," + vol_ip_pam_otros + ")");

            }
            /**********************TERMINA EL LLENADO DE LAS TABLAS CONV_PAM_MIN***************************/


            /***** LLENADO DE TABLAS DE THROUGPUT*********/
            st.execute("INSERT INTO throughput_tcp_min select '" + idTablas + "',ROUND((sum(bytes_src)*8)/60,2),ROUND((sum(bytes_dst)*8)/60,2),ROUND((sum(bytes_tot)*8)/60,2),'" + fechaTablas + "' from tcp_min_" + numTabla);
            st.execute("INSERT INTO throughput_udp_min select '" + idTablas + "',ROUND((sum(bytes_src)*8)/60,2),ROUND((sum(bytes_dst)*8)/60,2),ROUND((sum(bytes_tot)*8)/60,2),'" + fechaTablas + "' from udp_min_" + numTabla);
            st.execute("INSERT INTO throughput_http_min select '" + idTablas + "',ROUND((sum(bytes_src)*8)/60,2),ROUND((sum(bytes_dst)*8)/60,2),ROUND((sum(bytes_tot)*8)/60,2),'" + fechaTablas + "' from http_min_" + numTabla);

            if (pamConfigArray.length > 1)//i.e que hay puertos a monitorear
            {
                rs = st.executeQuery("select ROUND((sum(bytes_tot)*8)/60,3) from pam_min_" + numTabla);
                rs.next();
                if(rs.getLong(1)>0){
                    st.execute("INSERT INTO throughput_pam_min select '" + idTablas + "',ROUND((sum(bytes_src)*8)/60,2),ROUND((sum(bytes_dst)*8)/60,2),ROUND((sum(bytes_tot)*8)/60,2),'" + fechaTablas + "' from pam_min_" + numTabla);
                }
                
                
            }

            st.execute("insert into throughput_min (select '" + idTablas + "',ROUND((sum(sum_src)*8)/60,3),ROUND((sum(sum_dst)*8)/60,3),ROUND((sum(sum_tot)*8)/60,3),'" + fechaTablas + "' from (select sum(bytes_src)sum_src,sum(bytes_dst)sum_dst,sum(bytes_tot)sum_tot from tcp_min_" + numTabla + " union all select sum(bytes_src)sum_src,sum(bytes_dst)sum_dst,sum(bytes_tot)sum_tot from udp_min_" + numTabla + ")XX)");
            /*****FIN DE LLENADO DE TABLAS DE THROUGPUT*********/


            /***** INICIA LLENADO DE LAS TABLAS DE PUERTOS  ***/
            st.execute("insert into puerto_http_min select '" + idTablas + "','80',count(*),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_src)),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_dst)),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_tot)),'" + fechaTablas + "' from http_min_" + numTabla + " where Port_dst=80");
            st.execute("insert into puerto_http_min select '" + idTablas + "','443',count(*),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_src)),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_dst)),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_tot)),'" + fechaTablas + "' from http_min_" + numTabla + " where Port_dst=443");
            st.execute("insert into puerto_http_min select '" + idTablas + "','8080',count(*),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_src)),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_dst)),IF(SUM(bytes_tot) <=> NULL, 0, SUM(bytes_tot)),'" + fechaTablas + "' from http_min_" + numTabla + " where Port_dst=8080");

            /***** TERMINA LLENADO DE LAS TABLAS DE PUERTOS  ***/


            /************************ INICIA LLENADO DE TABLAS DE TIEMPO DE RESPUESTA********************************/
            st.execute("INSERT INTO tr_http_min SELECT '" + idTablas + "','80' puerto,COUNT(*) conex, SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot) vt, MIN(segundos)min_seg,MIN(milisegundos)min_miliseg, MAX(segundos)max_seg,MAX(milisegundos)max_miliseg, ROUND(AVG(segundos),2) avg_seg,ROUND(AVG(milisegundos),2) avg_miliseg,'" + fechaTablas + "' FROM tr_min_" + numTabla + " WHERE (Port_src =80 OR Port_dst = 80) GROUP BY puerto");
            st.execute("INSERT INTO tr_http_min SELECT '" + idTablas + "','443' puerto,COUNT(*) conex, SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot) vt, MIN(segundos)min_seg,MIN(milisegundos)min_miliseg, MAX(segundos)max_seg,MAX(milisegundos)max_miliseg, ROUND(AVG(segundos),2) avg_seg,ROUND(AVG(milisegundos),2) avg_miliseg,'" + fechaTablas + "' FROM tr_min_" + numTabla + " WHERE (Port_src =443 OR Port_dst = 443) GROUP BY puerto");
            st.execute("INSERT INTO tr_http_min SELECT '" + idTablas + "','8080' puerto,COUNT(*) conex, SUM(bytes_src)vs,SUM(bytes_dst)vd,SUM(bytes_tot) vt, MIN(segundos)min_seg,MIN(milisegundos)min_miliseg, MAX(segundos)max_seg,MAX(milisegundos)max_miliseg, ROUND(AVG(segundos),2) avg_seg,ROUND(AVG(milisegundos),2) avg_miliseg,'" + fechaTablas + "' FROM tr_min_" + numTabla + " WHERE (Port_src =8080 OR Port_dst = 8080) GROUP BY puerto");
            /************************ TERMINA LLENADO DE TABLAS DE TIEMPO DE RESPUESTA********************************/


            /******************INICIA LLENADO DE LA TABLA ALARMA_MIN**************************************/
            long vol_del_minuto = vol_general_tcp + vol_general_udp;

            if (vol_del_minuto >= 0 && vol_del_minuto < (vol_alarma_max * 0.80)) //alarma de nivel 1
            {
                st.execute("INSERT INTO alarma_min VALUES(" + idTablas + ",1,\"El volumen esta dentro de lo normal\",0,'" + fechaTablas + "',0,0)");
            }


            if (vol_del_minuto >= (vol_alarma_max * 0.80) && vol_del_minuto <= vol_alarma_max) //alarma de nivel 2
            {
                st.execute("INSERT INTO alarma_min VALUES(" + idTablas + ",2,\"El volumen está por alcanzar el umbral máximo\",0,'" + fechaTablas + "',0,0)");
            }

            if (vol_del_minuto > vol_alarma_max && vol_alarma_max > 0) //alarma de nivel 3
            {
                st.execute("INSERT INTO alarma_min VALUES(" + idTablas + ",3,\"El volumen sobrepasó el umbral en un " + (((vol_del_minuto - vol_alarma_max) * 100) / vol_del_minuto) + "  por ciento\"," + (vol_del_minuto - vol_alarma_max) + ",'" + fechaTablas + "',0,0)");
            }
            /******************TERMINA EL LLENADO DE LA TABLA ALARMA_MIN**************************************/


            /******************INICIA LLENADO DE LA TABLA ALARMA_THROUGHPUT_MIN**************************************/
            if ((vol_del_minuto * 8) / 60 >= 0 && (vol_del_minuto * 8) / 60 < (throughput_alarma_max * 0.80)) //alarma de nivel 1
            {
                st.execute("INSERT INTO alarma_throughput_min VALUES(" + idTablas + ",1,\"El throughput esta dentro de lo normal\",0,'" + fechaTablas + "',0,0)");
            }


            if ((vol_del_minuto * 8) / 60 >= (throughput_alarma_max * 0.80) && (vol_del_minuto * 8) / 60 <= throughput_alarma_max) //alarma de nivel 2
            {
                st.execute("INSERT INTO alarma_throughput_min VALUES(" + idTablas + ",2,\"El throughput está por alcanzar el umbral máximo\",0,'" + fechaTablas + "',0,0)");
            }

            if ((vol_del_minuto * 8) / 60 > throughput_alarma_max && throughput_alarma_max > 0) //alarma de nivel 3
            {
                st.execute("INSERT INTO alarma_throughput_min VALUES(" + idTablas + ",3,\"El throughput sobrepasó el umbral en un " + ((((vol_del_minuto * 8) / 60 - throughput_alarma_max) * 100) / ((vol_del_minuto * 8) / 60)) + "  por ciento\"," + ((vol_del_minuto * 8) / 60 - throughput_alarma_max) + ",'" + fechaTablas + "',0,0)");
            }
            /******************TERMINA LLENADO DE LA TABLA ALARMA_THROUGHPUT_MIN**************************************/


            /******************INICIA LLENADO DE LA TABLA APLICACIONES**************************************/


            
            rs = st.executeQuery("SELECT ip_sam, aplicacion_sam FROM aplicaciones_sam");
            String[][] matrizDeAplicaciones = matSum.ObtieneMatrizQuery(rs, 2);

            //for (int idApl = 0; idApl < matrizDeAplicaciones.length - 1; idApl++) {
            for (int idApl = 0; idApl < matrizDeAplicaciones.length; idApl++) {
                try {
                    st.execute("INSERT INTO aplicacion_min_" + numTabla + " SELECT INET_ATON(IP_dst), Port_dst, INET_ATON(IP_src), Port_src, bytes_dst, paquetes_dst, bytes_src, paquetes_src, bytes_tot, paquetes_tot, inicia, miliseg_inicia, fin, miliseg_fin ,'" + matrizDeAplicaciones[idApl][1] + "' FROM tcp_min_" + numTabla + " WHERE IP_src LIKE '" + matrizDeAplicaciones[idApl][0] + "'");
                    st.execute("INSERT INTO aplicacion_min_" + numTabla + " SELECT INET_ATON(IP_src), Port_src, INET_ATON(IP_dst), Port_dst, bytes_src,paquetes_src,bytes_dst,paquetes_dst, bytes_tot, paquetes_tot, inicia, miliseg_inicia, fin, miliseg_fin ,'" + matrizDeAplicaciones[idApl][1] + "' FROM tcp_min_" + numTabla + " WHERE IP_dst LIKE '" + matrizDeAplicaciones[idApl][0] + "'");
                    st.execute("INSERT INTO aplicacion_min_" + numTabla + " SELECT INET_ATON(IP_dst), Port_dst, INET_ATON(IP_src), Port_src, bytes_dst, paquetes_dst, bytes_src, paquetes_src, bytes_tot, paquetes_tot, inicia, miliseg_inicia, fin, miliseg_fin ,'" + matrizDeAplicaciones[idApl][1] + "' FROM udp_min_" + numTabla + " WHERE IP_src LIKE '" + matrizDeAplicaciones[idApl][0] + "'");
                    st.execute("INSERT INTO aplicacion_min_" + numTabla + " SELECT INET_ATON(IP_src), Port_src, INET_ATON(IP_dst), Port_dst, bytes_src,paquetes_src,bytes_dst,paquetes_dst, bytes_tot, paquetes_tot, inicia, miliseg_inicia, fin, miliseg_fin ,'" + matrizDeAplicaciones[idApl][1] + "' FROM udp_min_" + numTabla + " WHERE IP_dst LIKE '" + matrizDeAplicaciones[idApl][0] + "'");
                } catch (Exception ex2) {
                    logger.error("Error al insertar aplicacion_min_#:   " + ex2);
                }
            }

            st.execute("INSERT INTO vol_min_aplicacion SELECT " + idTablas + ",aplicacion, SUM(bytes_src),  SUM(bytes_tot), SUM(bytes_tot) vt, '" + fechaTablas + "' FROM aplicacion_min_" + numTabla + " GROUP BY aplicacion ORDER BY vt DESC LIMIT " + limiteResumen);

            rs = st.executeQuery("SELECT aplicacion FROM aplicacion_min_" + numTabla + " GROUP BY aplicacion");
            String [] aplicaciones = matSum.ObtieneCadenasQuery(rs);
            String ips_src = "";
            String ips_aplicacion = "";
            String puertos_aplicacion = "";
            String bytes_in = "";
            String bytes_out = "";
            String bytes_tot = "";

            for (int numAplic = 0; numAplic < aplicaciones.length - 1; numAplic++) {
                int elementosTabla = 0;
                try{
                rs = st.executeQuery("SELECT INET_NTOA(IP_src) ip_a, INET_NTOA(IP_dst) ip_aplicacion, Port_dst puerto_aplicacion, SUM(bytes_src), SUM(bytes_dst), SUM(bytes_tot) vt FROM aplicacion_min_" + numTabla + "  WHERE aplicacion LIKE '" + aplicaciones[numAplic] + "' GROUP BY ip_a, ip_aplicacion, puerto_aplicacion ORDER BY vt DESC  LIMIT 10");
                rs.last();
                elementosTabla = rs.getRow();
                rs.beforeFirst();
                }catch(SQLException e){
                    logger.error("Error en el query detalle_app:  " +e);
                }

                
                int eT = 1;
                // ciclo para obtener los valores de las filas
                if(!rs.isClosed()){
                while (rs.next()) {

                    ips_src += rs.getString(1);
                    ips_aplicacion += rs.getString(2);
                    puertos_aplicacion += rs.getString(3);
                    bytes_in += rs.getString(4);
                    bytes_out += rs.getString(5);
                    bytes_tot += rs.getString(6);

                    if (elementosTabla > 1 && eT < elementosTabla) {
                        ips_src += ",";
                        ips_aplicacion += ",";
                        puertos_aplicacion += ",";
                        bytes_in += ",";
                        bytes_out += ",";
                        bytes_tot += ",";
                    }                    
                    eT++;
                }

                st.execute("INSERT INTO detalle_app_min VALUES ('"+ idTablas + "', '" + ips_src + "', '"+ ips_aplicacion + "', '" + puertos_aplicacion + "', '"
                        + bytes_in + "', '" + bytes_out + "', '" + bytes_tot + "', '" + aplicaciones[numAplic] + "', '" + fechaTablas + "')");

                ips_src = "";
                ips_aplicacion = "";
                puertos_aplicacion = "";
                bytes_in = "";
                bytes_out = "";
                bytes_tot = "";
            }
                else {
                    logger.error("El resulset está cerrado");
                }
            }

            /******************TERMINA LLENADO DE LA TABLA APLICACIONES**************************************/





            matSum = null;

            /*****************S E   B O R R A N   L A S   T A B L A S   T E M P O R A L E S*************************/
            st.execute("DROP TABLE pam_min_" + numTabla);
            st.execute("DROP TABLE tcp_min_" + numTabla);
            st.execute("DROP TABLE udp_min_" + numTabla);
            st.execute("DROP TABLE http_min_" + numTabla);
            st.execute("DROP TABLE tr_min_" + numTabla);
            st.execute("DROP TABLE http_tr_min_" + numTabla);
            st.execute("DROP TABLE indicadores_min_" + numTabla);
            st.execute("DROP TABLE IF EXISTS aplicacion_min_" + numTabla);
            /***********T E R M I N A  E L   B O R R A D O   D E   L A S   T A B L A S   T E M P O R A L E S***************/


        } catch (Exception e) {
            logger.error("Error en el metodo sumalizacion(): \n" + e);
        } finally {
            try {
                /*****************S E   B O R R A N   L A S   T A B L A S   T E M P O R A L E S*************************/
                st.execute("DROP TABLE IF EXISTS pam_min_" + numTabla);
                st.execute("DROP TABLE IF EXISTS tcp_min_" + numTabla);
                st.execute("DROP TABLE IF EXISTS udp_min_" + numTabla);
                st.execute("DROP TABLE IF EXISTS http_min_" + numTabla);
                st.execute("DROP TABLE IF EXISTS tr_min_" + numTabla);
                st.execute("DROP TABLE IF EXISTS http_tr_min_" + numTabla);
                st.execute("DROP TABLE IF EXISTS indicadores_min_" + numTabla);
                st.execute("DROP TABLE IF EXISTS aplicacion_min_" + numTabla);
                /***********T E R M I N A  E L   B O R R A D O   D E   L A S   T A B L A S   T E M P O R A L E S***************/

                
                conBDremoto.CierraConexionMysql(st);
                conBDremoto = null;

                rs.close();
                rs = null;

                st.close();
                st = null;
            } catch (SQLException ex) {
                logger.error("Error borrando tablas temporales" + ex);
            }
        }     
    }//fin sumalizacion()
}
