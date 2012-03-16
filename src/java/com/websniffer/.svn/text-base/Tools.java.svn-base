package com.websniffer;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.StringTokenizer;
import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class Tools {

    static final Logger logger = Logger.getLogger(Tools.class);

    public Tools() {
    }

    //==============================================================================
    /**
     * Este metoto trata de resolver al nombre del host, para saber si esta vivo.
     * @param host String
     * @return boolean
     */
    public boolean hostIsALive(String host) throws IOException {

        boolean status = false;

        int timeOut = 3000;
        try {


            status = InetAddress.getByName(host).isReachable(timeOut);
            System.out.println(status);

        } catch (UnknownHostException ex) {

            System.out.println(ex);
            return false;

        }

        return status;
    }//fin sendPing


    //======================================================================
    /**
     *
     * @param ipstr
     * @return boolean
     */
    public static boolean doPing(String ipstr) {
        boolean retv = false;
        try {
            InputStream ins = Runtime.getRuntime().exec("ping -n 1 -w 2000 " + ipstr).getInputStream();
            byte[] prsbuf = new byte[ins.available()];
            ins.read(prsbuf);
            String parsstr = new StringTokenizer(new String(prsbuf), "%").nextToken().trim();
            if (!parsstr.endsWith("100")) {
                retv = true;
            }

            try{
                ins.close();
            }finally{
                ins = null;
            }

        } catch (Exception e) {
            System.out.println(e);
            retv = false;
        }
        return retv;
    }//fin doPing


    //==========================================================================
    /**
     * This method returns a string with the local ip.
     * @return String ip local
     */
    public String getLocalIpAdress() {

        InetAddress adress = null;
        String ip = "";

        try {

            adress = InetAddress.getLocalHost();
            byte[] bytesIP = adress.getAddress();

            for (int x = 0; x < bytesIP.length; x++) {
                if (x > 0) {
                    ip += ".";
                }

                ip += bytesIP[x] & 255;

            }

        } catch (Exception e) {
            logger.error("ERROR: getLocalIpAdress()\n", e);
        }

        return ip;
    } //end getLocalIpAdress

    //==========================================================================
    /**
     * This method returns a string with the local hostname.
     * @return String hostName
     */
    public String getLocalHostName() {

        InetAddress address = null;
        String hostName = null;

        try {

            address = InetAddress.getLocalHost();
            hostName = address.getHostName();

        } catch (Exception e) {
            logger.error("ERROR: getLocalHostName()\n", e);
        }

        return hostName;
    } //end getLocalIpAdress

}//fin class

