<%--
    Document   : createsDatabaseAndPersonalization
    Created on : 19/03/2010, 07:00:50 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            String database = request.getParameter("database").toLowerCase();
            String hostname = request.getParameter("ip").toLowerCase();
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            String port = request.getParameter("port");
            String project = request.getParameter("project").toLowerCase();
            String short_name = request.getParameter("project_short_name").toLowerCase();
            String path = request.getParameter("path").toLowerCase();
            String ex = "";
            java.io.File folder = null;
            java.io.File fileNamePool = null;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebSniffer Create DataBase</title>
    </head>
    <body>

        <center>
            <log:info category="createDataBase.jsp"> create database </log:info>
            <h1>creates database
                <br>
                <%= database%>
                and folder
            </h1>

            <%
                        try {

                            //create folder
                            folder = new java.io.File(path + "websniffer_" + short_name);
                            folder.mkdirs();
                            //out.println("create a file poolName in "+path+"websniffer_" + short_name);

                            fileNamePool = new java.io.File(path+"websniffer_" + short_name + "/poolName.txt");
                            fileNamePool.createNewFile();
                            java.io.BufferedWriter out2 = new java.io.BufferedWriter(new java.io.FileWriter(path+"websniffer_" + short_name + "/poolName.txt"));
                            out2.write("websniffer_" + short_name + "_pool");
                            out2.close();


                            new com.websniffer.ConnectDriver(hostname, "", user, password).update("CREATE DATABASE IF NOT EXISTS " + database);
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("CREATE TABLE collectors (collector_id int(5) NOT NULL AUTO_INCREMENT COMMENT 'pk: collector id', collector_ip varchar(15) NOT NULL COMMENT 'pk: collector ip', collector_port int(5) DEFAULT NULL, collector_context varchar(50) DEFAULT NULL, collector_site varchar(250) DEFAULT NULL COMMENT 'site name where the openblocks', collector_hostname varchar(150) DEFAULT NULL COMMENT 'collector name',   collector_description varchar(250) DEFAULT NULL COMMENT 'collector description', collector_pool varchar(50) DEFAULT NULL COMMENT 'pool for collector', collector_database_ip varchar(15) DEFAULT NULL COMMENT 'database for collector', collector_database_user varchar(50) DEFAULT NULL COMMENT 'user to connect to the database', collector_database_password varchar(50) DEFAULT NULL COMMENT 'password to connect to the database', PRIMARY KEY (collector_id,collector_ip), UNIQUE KEY collector_id (collector_id)) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='table to record collectors';");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("CREATE TABLE customize_theme (custom_id int(5) NOT NULL AUTO_INCREMENT COMMENT 'id for custom', custom_name_theme varchar(50) DEFAULT NULL COMMENT 'name profile', custom_header_color varchar(7) DEFAULT NULL COMMENT 'header color', custom_border_color_header varchar(7) DEFAULT NULL COMMENT 'border color for the header',custom_footer_color varchar(7) DEFAULT NULL COMMENT 'footer color',  custom_border_footer_color varchar(7) DEFAULT NULL COMMENT 'border color for the footer', custom_project_name varchar(150) DEFAULT NULL COMMENT 'Full project name', custom_application_name varchar(150) DEFAULT NULL COMMENT 'name of the application by default SisPro Application Manager', custom_window_title varchar(50) DEFAULT NULL COMMENT 'window title', custom_title_chart_color varchar(8) DEFAULT NULL COMMENT 'title chart color', custom_background_color_chart varchar(7) DEFAULT NULL COMMENT 'background color of the graph', custom_color_status_bar varchar(7) DEFAULT NULL COMMENT 'color status bar', custom_border_color_status_bar varchar(7) DEFAULT NULL COMMENT 'border color for status bar', custom_copyright varchar(100) DEFAULT NULL COMMENT 'copyright', PRIMARY KEY (`custom_id`)) ENGINE=MyISAM CHECKSUM=0 DELAY_KEY_WRITE=0 AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='table for theme';");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("insert ignore into customize_theme(custom_id,custom_name_theme,custom_header_color,custom_border_color_header,custom_footer_color,custom_border_footer_color,custom_project_name,custom_application_name,custom_window_title,custom_title_chart_color,custom_background_color_chart,custom_color_status_bar,custom_border_color_status_bar,custom_copyright) values (1,'default','#85B8CA','#cccccc','#85B8CA','#000000','DEMOSTRATION','Sispro Application Manager','Sispro','0xC3D9E1','#cccccc','#EBED9C','#000000','Todos los derechos reservados');");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("CREATE TABLE users (usr_id int(5) NOT NULL AUTO_INCREMENT COMMENT 'pk: id for each user ',usr_name varchar(50) NOT NULL COMMENT 'pk: name for usr',usr_password varchar(15) DEFAULT NULL COMMENT 'password for usr',usr_level int(1) DEFAULT NULL COMMENT 'level for usr 0 = user 1 = administrator',usr_description varchar(100) DEFAULT NULL COMMENT 'description for usr',usr_last_login datetime DEFAULT NULL COMMENT 'last login', PRIMARY KEY (usr_id,usr_name), UNIQUE KEY usr_id (`usr_id`)) ENGINE=MyISAM CHECKSUM=0 DELAY_KEY_WRITE=0 AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='table for users';");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("insert  into users(usr_id,usr_name,usr_password,usr_level,usr_description,usr_last_login) values (1,'skuarch','123',1,'administrador del sistema',NULL),(2,'julio','123',1,'administrador del sistema',NULL),(3,'invitado','123',0,'usuario sin privilegios',NULL);");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("CREATE TABLE custom (custom_id int(2) NOT NULL AUTO_INCREMENT, custom_project_short_name varchar(50) DEFAULT NULL COMMENT 'a short name of project', custom_name_jdbc_pool varchar(50) DEFAULT NULL COMMENT 'jdbc, pool of primary db', custom_database_name varchar(50) DEFAULT NULL, custom_database_ip varchar(50) DEFAULT NULL, custom_database_user varchar(50) DEFAULT NULL, custom_database_password varchar(50)DEFAULT NULL, custom_project_name varchar(50) DEFAULT NULL, custom_path varchar(50) DEFAULT NULL, PRIMARY KEY (custom_id)) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("INSERT INTO custom (custom_project_short_name, custom_name_jdbc_pool, custom_database_name, custom_database_ip, custom_database_user, custom_database_password, custom_project_name, custom_path) VALUES ('"+short_name+"', 'websniffer_" + short_name + "_pool', '"+database+"', '"+hostname+"', '"+user+"', '"+password+"', '"+project+"', '"+path+"');");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("CREATE TABLE squid_guard (sg_id int(5) NOT NULL AUTO_INCREMENT,sg_server varchar(15) DEFAULT NULL,sg_server_port int(5) DEFAULT NULL,PRIMARY KEY (sg_id)) ENGINE=MyISAM DEFAULT CHARSET=latin1;");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("INSERT INTO squid_guard (sg_server,sg_server_port) VALUES ('localhost',8589);");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("CREATE TABLE configBDCollector (ipBD varchar(20) DEFAULT NULL, rutaBD varchar(500) DEFAULT NULL, userBD varchar(20) DEFAULT NULL, passwBD varchar(20) DEFAULT NULL, nivelDetalleBD int(11) DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1;");
                            new com.websniffer.ConnectDriver(hostname, database, user, password).update("INSERT INTO configBDCollector (ipBD, rutaBD, userBD, passwBD, nivelDetalleBD) VALUES ('92.168.208.15','/var/lib/mysql/', 'root', 'vitalnoc',25);");

                        } catch (Exception e) {
                            out.println(e);
                        }
            %>

            <table border="1">
                <tbody>
                    <tr>
                        <td>database create in:</td>
                        <td><%= hostname%></td>
                    </tr>
                    <tr>
                        <td>user:</td>
                        <td><%= user%></td>
                    </tr>
                    <tr>
                        <td>project name:</td>
                        <td><%= project%></td>
                    </tr>
                    <tr>
                        <td>folder</td>
                        <td><%= folder.canWrite() %></td>
                    </tr>
                    <tr>
                        <td>folder path</td>
                        <td><%= folder.getAbsolutePath() %></td>
                    </tr>
                </tbody>
            </table>


                    <!--<h2>please create the connection pool with the name</h2> <h3>websniffer_<%= short_name%>_pool</h3> and create resource: jdbc/websniffer_<%= short_name%>-->

            <h2>please create the connection pool </h2>

            ./asadmin create-jdbc-connection-pool --user admin --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.DataSource --property user=<%=user%>:password=<%=password%>:DatabaseName=<%=database%>:ServerName=<%=hostname%>:port=<%=port%> websniffer_<%= short_name%>_pool

            <h2>please create resource </h2>

            ./asadmin create-jdbc-resource --connectionpoolid websniffer_<%= short_name%>_pool jdbc/websniffer_<%= short_name%>

            <!--<h3>websniffer_<%= short_name%>_pool</h3> and create resource: jdbc/websniffer_<%= short_name%>-->


            <br>
            <br>

            <a href="theme.jsp">

                custimize theme

            </a>
        </center>

    </body>
</html>

<%

            try {
                folder = null;
                fileNamePool = null;
            } finally {
                folder = null;
                fileNamePool = null;
            }

%>
