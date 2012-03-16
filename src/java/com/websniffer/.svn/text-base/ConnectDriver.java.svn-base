package com.websniffer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.apache.log4j.Logger;

/**
 * This class connects to a database using the driver jdbc.
 * @author skuarch
 */
public class ConnectDriver {

    static final Logger logger = Logger.getLogger(ConnectDriver.class);
    private ResultSet rs;
    private Connection con;
    private Statement st;
    private String ipServer;
    private String dataBaseName;
    private String user;
    private String password;

    //==========================================================================
    /**
     * Construct.
     * @param ipServer
     * @param dataBaseName
     * @param user
     * @param password
     */
    public ConnectDriver(String ipServer, String dataBaseName, String user, String password) {

        this.rs = null;
        this.con = null;
        this.st = null;
        this.ipServer = ipServer;
        this.dataBaseName = dataBaseName;
        this.user = user;
        this.password = password;

    } //end construct

    //==========================================================================
    /**
     * method that returns a connection to the database.     
     * @return Connection
     */
    public Connection getConnection() {

        String jdbc = null;

        if (this.dataBaseName.isEmpty() || this.dataBaseName.equalsIgnoreCase(null) || this.dataBaseName.length() < 1) {
            jdbc = "jdbc:mysql://" + this.ipServer + ":3306/";
        } else {
            jdbc = "jdbc:mysql://" + this.ipServer + ":3306/" + this.dataBaseName;
        }

        try {

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            this.con = (Connection) DriverManager.getConnection(jdbc, this.user, this.password);

        } catch (Exception e) {
            logger.error("ERROR: getConexion()\n", e);
        }

        return this.con;
    } //end getConnection

    //==========================================================================
    /**
     * method that gets as a ResultSet.
     * @param sql
     * @return ResultSet
     */
    public ResultSet select(String sql) {

        this.st = null;
        this.rs = null;

        try {

            this.st = (Statement) getConnection();
            this.rs = this.st.executeQuery(sql);

            //closing
            try {
                this.st.close();
            } finally {
                this.st = null;
            }

            st = null;

        } catch (Exception e) {
            System.out.println("sql: " + sql);
            logger.error("ERROR: select()\n", e);
        }

        return this.rs;
    } //end select

    //==========================================================================
    /**
     * method.
     * @param sql
     */
    public void update(String sql) {

        try {

            Connection cons = this.getConnection();
            Statement sts = cons.createStatement();
            sts.executeUpdate(sql);

            try {
                cons.close();
                sts.close();
            } finally {
                cons = null;
                sts = null;
            }
            
            sql = null;

        } catch (Exception e) {
            logger.error("ERROR: Update()\n" + e);
        }

    } //end update
} //end class

