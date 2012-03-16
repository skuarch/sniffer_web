package com.websniffer;


import java.io.File;
import org.apache.log4j.Logger;

/**
 * This class verifies that the files:.
 * <br>
 * -there
 * <br>
 * -readability
 * @author skuarch
 */
public class CheckFile {

    static final Logger logger = Logger.getLogger(CheckFile.class);
    File file;

    //==========================================================================
    /**
     * Construct.
     */
    public CheckFile() {

        try {
            file = null;

        } catch (Exception e) {
            logger.error("Error constructor Compuebafiles", e);
        } //end tray catch
    } //end CheckFile

    //==========================================================================
    /**
     * Method to check that the file exists and is readable.
     * @param fileName
     * @return boolean
     */
    public boolean exists(String fileName) {

        try {

            this.file = new File(fileName);

            //exists and is readable?
            if (!file.exists() || !file.canRead()) {
                logger.error(fileName + " file can not be read or does not exist");
                destruct();
                return (boolean) false;
            } else {
                destruct();
                return (boolean) true;
            }

        } catch (Exception e) {
            logger.fatal("Error exists()\n", e);
        } //end try-catch

        destruct();
        return true; // should never get here
    } //end exists

    //=================================
    /**
     * Destruct.
     */
    public void destruct() {
        file = null;
    }
} //end class

