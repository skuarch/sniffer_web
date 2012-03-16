package com.websniffer;

import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class Context {

    static final Logger logger = Logger.getLogger(Context.class);
    private String shortContext;
    private String context;

    //==========================================================================
    public Context(String context) {
        this.shortContext = null;
        this.context = context;
    } //end context

    //==========================================================================
    public String getShortContext() {
        setShortContext();
        return shortContext;
    } //end getShortContext

    //==========================================================================
    public void setShortContext() {

        int sizeContext = 0;
        int index = 0;

        try {

            sizeContext = this.context.length();
            index = this.context.indexOf("_");

            shortContext = this.context.substring(index, sizeContext);

        } catch (Exception e) {
            logger.error("ERROR: setShortContex()\n" + e);
        }

    } //end setShortContet
} //end class

