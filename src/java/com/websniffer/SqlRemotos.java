package com.websniffer;

/**
 *
 * @author skuarch
 */
public class SqlRemotos {

    //==========================================================================
    /**
     * Contructor
     */
    public SqlRemotos() {
    }//fin constructor



    //==========================================================================
    /**
     * metodo que regresa el sql para obtener las ip de los openblocks remotos
     * @return String con el sql
     */
    public String getSqlRemotosIp(){

        String sql = "SELECT collector_ip FROM collectors";

        return sql;
    }//fin SqlRemotosIp



}//fin class
