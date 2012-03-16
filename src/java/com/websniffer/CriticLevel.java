package com.websniffer;

import java.sql.ResultSet;
import org.apache.log4j.Logger;

/**
 * this class set and get level critic.
 * @author skuarch
 */
public class CriticLevel {

    static final Logger logger = Logger.getLogger(CriticLevel.class);
    private float levelVol;
    private float levelRendimiento;
    private String ip_remoto;
    private float maxDown;
    private String context;

    //==========================================================================
    public CriticLevel(String ip_remoto,String context) {
        this.levelVol = 0;
        this.levelRendimiento = 0;
        this.ip_remoto = ip_remoto;
        this.maxDown = 0;
        this.context = context;
    } //end construct

    //==========================================================================
    /**
     * Get the value of levelVol.
     *
     * @return the value of levelVol
     */
    public float getLevelVol() {
        setLevelVol();
        return this.levelVol;
    } //end getLevel

    //==========================================================================
    /**
     * Set the value of levelRendimiento.
     * @return int
     */
    public float getLevelRendimiento() {
        setLevelRendimiento();
        return levelRendimiento;
    }

    //==========================================================================
    /**
     * Set the value of levelVolRendimiento.
     */
    public void setLevelRendimiento() {

        int level = 0;

        try {

            ResultSet rs = new ConnectCollector(this.context).select("select config_nivel_critico_throughput from configuracion;", this.ip_remoto.trim());
            rs.next();
            level = (int) rs.getLong("config_nivel_critico_throughput");            

            try {
                rs.close();
            } finally {
                rs = null;
            }


        } catch (Exception e) {
            e.printStackTrace();
            logger.error("ERROR: setLevelRendimiento()\n" + e);
        }

        this.levelRendimiento = level;
    } //end setLevelRendimiento

    //==========================================================================
    /**
     * Set the value of levelVol.
     */
    public void setLevelVol() {

        int level = 0;

        try {

            ResultSet rs = new ConnectCollector(this.context).select("select config_nivel_critico_vol from configuracion;", this.ip_remoto.trim());
            rs.next();
            level = (int) rs.getLong("config_nivel_critico_vol");


            try {
                rs.close();
            } finally {
                rs = null;
            }


        } catch (Exception e) {
            e.printStackTrace();
            logger.error("ERROR: setLevelVol()\n" + e);
        }

        this.levelVol = level;
    } //end setLevelVol

    //==========================================================================
    /**
     * Set the value of levelRendimiento.
     * @return int
     */
    public float getMaxDown() {
        setMaxDown();
        return maxDown;
    }

    //==========================================================================
    /**
     * Set the value of MaxDown.
     */
    public void setMaxDown() {

        int max = 0;

        try {

            ResultSet rs = new ConnectCollector(this.context).select("select config_tasa_transferencia_download from configuracion;", this.ip_remoto.trim());
            rs.next();
            max = (int) rs.getLong("config_tasa_transferencia_download");


            try {
                rs.close();
            } finally {
                rs = null;
            }


        } catch (Exception e) {
            e.printStackTrace();
            logger.error("ERROR: setMaxDown()\n" + e);
        }

        this.maxDown = max;
    } //end setMaxDown
} //end class

