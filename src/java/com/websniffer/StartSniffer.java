package com.websniffer;

import java.io.File;
import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class StartSniffer extends Thread {

    static final Logger logger = Logger.getLogger(StartSniffer.class);
    private File file;
    private String context;

    //==========================================================================
    /**
     * Construct.
     */
    public StartSniffer(File file, String context) {
        try {

            this.file = file;
            this.context = context;

        } catch (Exception e) {
            logger.error("ERROR: construct StartSniffer()\n" + e);
        }

    } //end construct

    //==========================================================================
    @Override
    public void run() {
        super.run();

        try {

            Sniffer2BD zip2BD = new Sniffer2BD(this.file.getAbsolutePath(), this.context);
            synchronized (zip2BD) {
                zip2BD.start(); //inicia hilo
            }

            try {
                this.file = null;
            } finally {
                this.file = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: StartSniffer().run()\n" + e);
        }


    } //end run
} //end class

