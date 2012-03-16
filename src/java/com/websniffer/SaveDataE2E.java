package com.websniffer;

import java.util.Scanner;
import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class SaveDataE2E implements Runnable {

    static final Logger logger = Logger.getLogger(SaveDataE2E.class);
    String result;
    String shortContext;
    String ip_remoto;

    //==========================================================================
    public SaveDataE2E(String result, String shortContext, String ip_remoto) {
        super();
        this.result = result;
        this.shortContext = shortContext;
        this.ip_remoto = ip_remoto;
    } //end SaveDataE2E

    //==========================================================================
    @Override
    public void run() {

        if (this.result == null) {
            logger.error("SaveDataE2E().result is empty or null");            
            return;
        }

        if (this.ip_remoto == null) {
            logger.error("SaveDataE2E().ip_remoto is empty or null");
            return;
        }

        if (this.shortContext == null) {
            logger.error("SaveDataE2E().shortContext is empty or null");
            return;
        }



        String sql = null;
        Scanner scan = null;
        String ipOrigin = null;
        String ipDestination = null;
        String date;
        String hour;
        int numHops;

        String index = "";
        String destination = "";
        String hop = "";
        String time = "";

        String totalTime = null;

        try {

            scan = new Scanner(this.result);

            ipOrigin = scan.next();
            ipDestination = scan.next();
            date = scan.next();
            hour = scan.next();
            numHops = scan.nextInt();

            try {

                for (int i = 0; i < numHops; i++) {
                    index += scan.next().trim();
                    destination += scan.next().trim();
                    hop += scan.next().trim();
                    time += scan.next().trim();

                    if (i < numHops - 1) {
                        index += ",";
                        destination += ",";
                        hop += ",";
                        time += ",";
                    }

                }

                totalTime = scan.next();

            } catch (Exception e) {
                logger.error("ERROR: SaveE2E().run().for " + e);
            }

            sql = "INSERT INTO traceroute (trace_fecha, trace_destino, trace_num_saltos, trace_index, trace_hostname_saltos, trace_ip_saltos, trace_time, trace_total_time)"
                    + "VALUES"
                    + "('" + date + " " + hour + "', '" + ipDestination + "', '" + numHops + "', '" + index + "', '" + destination + "', '" + hop + "', '" + time + "', '" + totalTime + "');";
            new ConnectCollector(this.shortContext).update(sql, this.ip_remoto);


            try {
                scan.close();
            } finally {
                scan = null;
                sql = null;
                this.result = null;
                this.ip_remoto = null;
            }


        } catch (Exception e) {

            logger.error("ERROR: SaveData().run\n" + e);

        }

        //throw new UnsupportedOperationException("Not supported yet.");
    } //end run

} //end class

