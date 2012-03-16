package com.websniffer;

import java.sql.ResultSet;
import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class Theme {

    static final Logger logger = Logger.getLogger(Theme.class);
    private String context;

    //==========================================================================
    /**
     * Construct.
     */
    public Theme(String context) {
        this.context = context;
    } //end construct

    //==========================================================================
    /**
     * method that gets the color of the head.
     * @return String
     */
    public String getHeaderColor() {

        String sql = "select custom_header_color from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_header_color");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getHeaderColor()" + e);
        }

        return param;
    } //end getHeaderColor




    //==========================================================================
    /**
     * method that gets the color of the border.
     * @return String
     */
    public String getBorderColorHeader() {

        String sql = "select custom_border_color_header from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_border_color_header");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getBorderColorHeader()" + e);
        }

        return param;
    } //end getBorderColorHeader




    //==========================================================================
    /**
     * method that gets the color of the footer.
     * @return String
     */
    public String getFooterColor() {

        String sql = "select custom_footer_color from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_footer_color");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getFooterColor()" + e);
        }

        return param;
    } //end getFooterColor()




    //==========================================================================
    /**
     * method that gets the border color of the footer.
     * @return String
     */
    public String getBorderFooterColor() {

        String sql = "select custom_border_footer_color from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_border_footer_color");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getBorderFooterColor()" + e);
        }

        return param;
    } //end getBorderFooterColor()





    //==========================================================================
    /**
     * method that gets the name of the project.
     * @return String
     */
    public String getProjecName() {

        String sql = "select custom_project_name from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_project_name");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getProjecName()" + e);
        }

        return param;
    } //end getProjecName()



    //==========================================================================
    /**
     * method that gets the name of the application.
     * @return String
     */
    public String getApplicationName() {

        String sql = "select custom_application_name from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_application_name");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getApplicationName()" + e);
        }

        return param;
    } //end getApplicationName()




    //==========================================================================
    /**
     * method that gets the title of the window.
     * @return String
     */
    public String getWindowTitle() {

        String sql = "select custom_window_title from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_window_title");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getWindowTitle()" + e);
        }

        return param;
    } //end getWindowTitle()




    //==========================================================================
    /**
     * method that gets the color of the title chart.
     * @return String
     */
    public String getTitleChartColor() {

        String sql = "select custom_title_chart_color from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_title_chart_color");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getTitleChartColor()" + e);
        }

        return param;
    } //end getTitleChartColor()





    //==========================================================================
    /**
     * method that gets the color of the background chart.
     * @return String
     */
    public String getBackgroundColorChart() {

        String sql = "select custom_background_color_chart from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_background_color_chart");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getBackgroundColorChart()" + e);
        }

        return param;
    } //end getBackgroundColorChart()



    //==========================================================================
    /**
     * method that gets the border color of the status bar.
     * @return String
     */
    public String getColorStatusBar() {

        String sql = "select custom_color_status_bar from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_color_status_bar");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getColorStatusBar()" + e);
        }

        return param;
    } //end getColorStatusBar()




    //==========================================================================
    /**
     * method that gets the border color of the status bar.
     * @return String
     */
    public String getBorderColorStatusBar() {

        String sql = "select custom_border_color_status_bar from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_border_color_status_bar");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getBorderColorStatusBar()" + e);
        }

        return param;
    } //end getBorderColorStatusBar()





    //==========================================================================
    /**
     * method that gets copyright.
     * @return String
     */
    public String getCopyright() {

        String sql = "select custom_copyright from customize_theme;";
        String param = null;
        ResultSet rs = null;

        try {

            rs = new ConnectPool(this.context).select(sql);
            rs.next();
            param = rs.getString("custom_copyright");

            try {
                rs.close();
            } finally {                
                rs = null;
                sql = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: getCopyright()" + e);
        }

        return param;
    } //end getCopyright()

} //end class

