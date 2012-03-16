package com.websniffer;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 *
 * @author skuarch
 */
public class IP {

    private String ip;

    /**
     * Constructor
     */
    public IP(){

           ip = null;

    }// fin constructor


    /**
     * metodo que regresa la ip local en string
     * @return String con la ip
     */
    public String getLocalIp(){
        try {
            ip = InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException ex) {
            ip = null;
        }
        return ip;
    }// fin getLocalIp



}// fin class
