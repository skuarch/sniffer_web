package com.websniffer;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.log4j.Logger;

/**
 * this class connect to collector using a driverManager.
 * @author skuarch
 */
public class ConnectCollector {

    static final Logger logger = Logger.getLogger(ConnectCollector.class);
    private String context;

    //==========================================================================
    /**
     * Construct.
     * @param context String
     */
    public ConnectCollector(String context) {
        this.context = context;
    } //end construct

    //==========================================================================
    /**
     * method exe qry.
     * @param sql String
     * @param ip_remoto String
     * @return ResultSet
     */
    public ResultSet select(String sql, String ip_remoto) {

        //validate sql and ip_remoto
        if (sql.equalsIgnoreCase("") || ip_remoto.equalsIgnoreCase("")) {
            logger.error("ERROR: ERROR: ConnectCollector().select()\n"
                    + "sql/ip is null o empty");
            throw new UnsupportedOperationException("sql/ip is null or empty");
        }

        ResultSet rs = null;        
        ResultSet rsPool = null;
        Connection con = null;
        Statement st = null;
        String dbName = null;
        String ip_db = null;
        String usuario_db = null;
        String password_db = null;
        String projectShortName = null;
        String jdbc;

        try {
            rsPool = new ConnectPool(this.context).select("select * from collectors where collector_ip = '"+ip_remoto+"'");
            rsPool.next();

            projectShortName = this.context;
            ip_db = rsPool.getString("collector_database_ip");
            usuario_db = rsPool.getString("collector_database_user");
            password_db = rsPool.getString("collector_database_password");
            dbName = ip_remoto.replace(".", "_");
            jdbc = "jdbc:mysql://" + ip_db + ":3306/sniffer" + projectShortName + "_" + dbName;


            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = (Connection) DriverManager.getConnection(jdbc, usuario_db, password_db);
            st = (Statement) con.createStatement();
            rs = st.executeQuery(sql);

            try {
                rsPool.close();
                //con.close();
                //st.close();
            } finally {
                rsPool = null;
                con = null;
                st = null;
            }

        } catch (SQLException esql) {
            logger.error("SQLException: in ConnectCollector().select() \nsql: " + sql);
            logger.error("ERROR: ConnectCollector().select()\n", esql);
        } catch (Exception e) {
            logger.error("SQLException: in ConnectCollector().select() \nsql: " + sql);
            logger.error("ERROR: ConnectCollector().select()\n", e);
        }


        return rs;
    } //end select

    //==========================================================================
    public void update(String sql, String ip_remoto) {

        //validate sql and ip_remoto
        if (sql.equalsIgnoreCase("") || ip_remoto.equalsIgnoreCase("")) {
            logger.error("ERROR: ERROR: ConnectCollector().select()\n"
                    + "sql/ip is null o empty");
            throw new UnsupportedOperationException("sql/ip is null or empty");
        }
        
        ResultSet rsPool = null;
        Connection con = null;
        Statement st = null;
        String dbName = null;
        String ip_db = null;
        String usuario_db = null;
        String password_db = null;
        String projectShortName = null;
        String jdbc;

        try {
            rsPool = new ConnectPool(this.context).select("select * from collectors");
            rsPool.next();

            projectShortName = this.context;
            ip_db = rsPool.getString("collector_database_ip");
            usuario_db = rsPool.getString("collector_database_user");
            password_db = rsPool.getString("collector_database_password");
            dbName = ip_remoto.replace(".", "_");
            jdbc = "jdbc:mysql://" + ip_db + ":3306/sniffer" + projectShortName + "_" + dbName;


            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = (Connection) DriverManager.getConnection(jdbc, usuario_db, password_db);
            st = (Statement) con.createStatement();
            st.execute(sql);

            try {
                rsPool.close();
                con.close();
                st.close();
            } finally {
                rsPool = null;
                con = null;
                st = null;
            }

        } catch (SQLException esql) {
            logger.error("SQLException: in ConnectCollector().update()\nsql: " + sql);
            logger.error("ERROR: ConnectCollector().update()\n", esql);
        } catch (Exception e) {
            logger.error("SQLException: in ConnectCollector().update()\nsql: " + sql);
            logger.error("ERROR: ConnectCollector().update()\n", e);
        }

    } //end update
} //end class

