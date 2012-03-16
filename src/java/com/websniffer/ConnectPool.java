package com.websniffer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import org.apache.log4j.Logger;

/**
 * this class connect with a pool of conections.
 * @author skuarch
 */
public class ConnectPool {

    static final Logger logger = Logger.getLogger(ConnectPool.class);
    private InitialContext ic;
    private Connection con = null;
    private ResultSet rs;
    private Statement st;
    private DataSource ds;
    private String ip;
    private String context;

    /*
    private DataSource getJdbc__WS() throws NamingException {
    Context c = new InitialContext();
    return (DataSource) c.lookup("jdbc/websniffer_demo");
    }
     */
    //==========================================================================
    public ConnectPool(String context) {
        ic = null;
        con = null;
        rs = null;
        st = null;
        ds = null;
        ip = null;
        this.context = context;

    } //fin constructor

    //==========================================================================
    public Connection getConnection() {

        try {
            con = null;
            DataSource pool = null;
            ic = null;

            ic = new InitialContext();
            //pool = (DataSource) ic.lookup("jdbc/websniffer_web");
            String jndi = "jdbc/websniffer" + this.context;            
            pool = (DataSource) ic.lookup(jndi);

            con = pool.getConnection();

        } catch (Exception e) {

            logger.error("ERROR: getConection():" + e);
            return null;

        }

        return con;
    }

    //==========================================================================
    public int getNumFilas(ResultSet r) {

        int numRows = 0;

        try {
            
            r.last();
            numRows = r.getRow();
            r.beforeFirst();

        } catch (Exception e) {
            logger.error("ERROR: getFilas()" + e);
        }

        return numRows;
    }

    //==========================================================================
    public ResultSet select(String sql) {

        try {

            Connection cons = getConnection();
            st = cons.createStatement();
            rs = st.executeQuery(sql);
            rs = st.getResultSet();

            try{
                cons.close();
                this.con.close();
            }finally{
                cons = null;
                this.con = null;
            }

        } catch (Exception e) {

            logger.error("ERROR: Select(): " + e + " \nsql: " + sql);
            return null;

        }

        return rs;
    }

    //==========================================================================
    public ResultSet selectLogin(String sql, String usr, String pwd) {

        ResultSet rset = null;
        Connection cons = null;
        PreparedStatement pstmt = null;

        try {
            cons = getConnection();
            pstmt = cons.prepareStatement(sql);
            pstmt.setString(1, usr);
            pstmt.setString(2, pwd);
            rset = pstmt.executeQuery();

            try {                
                this.con.close();
                con.close();
            } finally {                
                this.con.close();
                con.close();
            }

            this.con = null;
            con = null;

        } catch (SQLException ex) {
            rset = null;
            logger.error("ERROR: SelectLogin()" + ex);
        }

        return rset;
    }

    //==========================================================================
    public void update(String sql) {

        try {

            Connection cons = getConnection();
            Statement sts = cons.createStatement();
            sts.executeUpdate(sql);

            try {
                cons.close();
                sts.close();
            } finally {
                cons = null;
                sts = null;
            }

            //System.out.println(sql);

        } catch (Exception e) {
            logger.error("ERROR: update():" + e + " \nsql: " + sql);
        }

    }
} //fin class

