package com.websniffer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.apache.log4j.Logger;

/**
 * This class reads any properties file.
 * @author skuarch
 */
public class GetProperties {

    static final Logger logger = Logger.getLogger(GetProperties.class);
    private String fileProperties;

    /**
     * Construct.
     */
    public GetProperties() {
    } //end construct

    //==========================================================================
    /**
     * Construct overloaded with parameter.
     * @param nameFileProperties String.
     */
    public GetProperties(String nameFileProperties) {

        try {
            this.fileProperties = nameFileProperties;
        } catch (Exception e) {
            logger.error("ERROR: GetProperties()\n", e);
        } //end try-catch

    } //end GetProperties (construct overloaded)

    //==========================================================================
    /**
     * This method load returns a Prop to be used by getProperties.
     * @return value of prop
     */
    private Properties ReadFileProperties() {


        Properties props = null;
        FileInputStream file = null;
        File f = null;

        try {

            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("/WebSniffer.properties");

            f = new File(this.fileProperties);
            props = new Properties();
            file = new FileInputStream(f.getAbsolutePath());
            props.load(inputStream);

            try {
                file.close();
            } finally {
                file = null;
                f = null;
            }


        } catch (IOException ex) {
            logger.error("ERROR: ReadFileProperties()\n", ex);
        } catch (Exception e) {
            logger.error("ERROR: ReadFileProperties()\n", e);
        }

        return props;
    } //end ReadFileProperties

    //==========================================================================
    /**
     *  returns a string with the value of property.
     * @param namePropertie String
     * @return String with prop
     */
    public String getProperties(String namePropertie) {

        String value = null;

        try {

            value = ReadFileProperties().getProperty(namePropertie);

        } catch (Exception e) {
            logger.error("ERROR: getProperties()\n", e);
        } //end try-catch

        return value;
    } //end getProperties
} //end class
