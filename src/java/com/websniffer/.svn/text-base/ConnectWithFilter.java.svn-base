package com.websniffer;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ConnectException;
import java.net.Socket;
import java.sql.ResultSet;
import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class ConnectWithFilter {

    static final Logger logger = Logger.getLogger(ConnectWithFilter.class);
    private String serverSquid;
    private int portSquidServer;
    private String context;

    //=========================================================================
    public ConnectWithFilter(String context) {

        this.context = context;
        ResultSet rs1 = null;

        try {

            rs1 = new com.websniffer.ConnectPool(this.context).select("select * from squid_guard");
            rs1.next();

            this.portSquidServer = rs1.getInt("sg_server_port");
            this.serverSquid = rs1.getString("sg_server");

            try {
                rs1.close();
            } finally {
                rs1 = null;
            }

        } catch (Exception e) {
            logger.error("ERROR: ConnectWithFilter() " + e);
        }

    } //end ConectWithFilter

    //=========================================================================
    public String[] getCategories(String categorie, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String[] categories = null;
        String cat = null;

        try {

            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("showCategories"); //send command
            in.readLine(); //cmd:
            cat = in.readLine(); //result
            pw.println("exit"); //finish connection
            categories = cat.split(",");

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
                cat = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().getCatecories() " + e);
            logger.error("ERROR: ConnectWithFilter().getCatecories() " + e);
            pw.println("exit");
        }


        return categories;
    } //end getCategories

    //=========================================================================
    public String[] getDomains(String categorie, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String[] domains = null;
        String dom = null;

        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("showDomains " + categorie);
            in.readLine(); //cmd:
            dom = in.readLine();
            pw.println("exit"); //finish connection
            domains = dom.split(",");

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
                dom = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().getDomains() " + e);
            logger.error("ERROR: ConnectWithFilter().getDomains() " + e);
            pw.println("exit");
        }

        return domains;

    } //end getDomains

    //=========================================================================
    public String[] getUrls(String categorie, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String[] urls = null;
        String link = null;

        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("showUrls " + categorie);
            in.readLine(); //cmd:
            link = in.readLine();
            pw.println("exit"); //finish connection
            urls = link.split(",");

            if (urls.length < 1) {
                String[] s = {"whitout urls"};
                return s;
            }

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
                link = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().getUrls() " + e);
            logger.error("ERROR: ConnectWithFilter().getUrls() " + e);
            pw.println("exit");
        }

        return urls;
    } //end getUrls

    //=========================================================================
    public String unblockDomains(String categorie, String array, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String[] domains = null;
        String rtn = "the domain(s) was unblock";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            domains = array.split(",");

            for (int i = 0; i < domains.length; i++) {

                in.readLine(); //cmd:
                pw.println("unblockDomain " + categorie + domains[i]);
                java.lang.Thread.sleep(20);
                logger.debug("unblockDomain " + categorie + domains[i]);

            }

            in.readLine(); //cmd:
            pw.println("recompileCategorie " + categorie);
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().unblockDomains() " + e);
            logger.error("ERROR: ConnectWithFilter().unblockDomains() " + e);
            pw.println("exit");
        }

        return rtn;
    } //end unblockDomain

    //=========================================================================
    public String unblockUrl(String categorie, String array, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String[] urls = null;
        String rtn = "the url(s) was unblock";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            urls = array.split(",");

            for (int i = 0; i < urls.length; i++) {

                in.readLine(); //cmd:
                pw.println("unblockUrl " + categorie + urls[i]);
                java.lang.Thread.sleep(20);
                logger.debug("unblockUrl " + categorie + urls[i]);

            }

            in.readLine(); //cmd:
            pw.println("recompileCategorie " + categorie);
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().unblockUrls() " + e);
            logger.error("ERROR: ConnectWithFilter().unblockUrls() " + e);
            pw.println("exit");
        }

        return rtn;
    } //end unblockUrl

    //=========================================================================
    public String blockDomain(String categorie, String domain, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:            
            pw.println("blockDomain " + categorie + " " + domain);
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("recompileCategorie " + categorie);
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().blockDomain() " + e);
            logger.error("ERROR: ConnectWithFilter().blockDomain() " + e);
            pw.println("exit");
        }

        return rtn;

    } //end blockDomain

    //=========================================================================
    public String blockUrl(String categorie, String url, PrintWriter out) {


        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("blockUrl " + categorie + " " + url);
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("recompileCategorie " + categorie);
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().blockUrl() " + e);
            logger.error("ERROR: ConnectWithFilter().blockUrl() " + e);
            pw.println("exit");
        }

        return rtn;

    } //end blockUrl

    //=========================================================================
    public String showStructures(PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("showStructures");
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().showStructures() " + e);
            logger.error("ERROR: ConnectWithFilter().showStructures() " + e);
            pw.println("exit");
        }

        return rtn;
    } //showStructures

    //=========================================================================
    public String createStructureSource(String nameOfStructure, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("createStructureSource " + nameOfStructure);
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().createStructureSource() " + e);
            logger.error("ERROR: ConnectWithFilter().createStructureSource() " + e);
            pw.println("exit");
        }

        return rtn;
    } //createStructureSource

    //=========================================================================
    public String deleteStructureSource(String nameOfStructure, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("deleteStructureSource " + nameOfStructure);
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().deleteStructureSource() " + e);
            logger.error("ERROR: ConnectWithFilter().deleteStructureSource() " + e);
            pw.println("exit");
        }

        return rtn;
    } //deleteStructureSource

    //=========================================================================
    public String getContent(String nameOfStructure, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("getContentOfStructureSource " + nameOfStructure);
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().getContent() " + e);
            logger.error("ERROR: ConnectWithFilter().getContent() " + e);
            pw.println("exit");
        }

        return rtn;
    } //getContent

    //=========================================================================
    public String addInStructureSource(String nameOfStructure, String ip, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("addInStructureSource " + nameOfStructure + " " + ip + " ip");
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().getContent() " + e);
            logger.error("ERROR: ConnectWithFilter().getContent() " + e);
            pw.println("exit");
        }

        return rtn;

    } //end addInStructureSource

    //=========================================================================
    public String addInAcl(String nameOfStructure, String command, PrintWriter out) {

        Socket socket = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter pw = null;
        DataOutputStream outs = null;
        BufferedReader in = null;
        String rtn = "";


        try {
            socket = new Socket(this.serverSquid, this.portSquidServer);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
            outs = new DataOutputStream(outputStream);
            pw = new PrintWriter(outputStream, true);
            in = new BufferedReader(new InputStreamReader(inputStream));

            in.readLine(); //cmd:
            pw.println("addInAcl " + nameOfStructure + " " + command + " true");
            in.readLine(); //cmd:
            rtn = in.readLine();
            pw.println("exit"); //finish connection

            try {
                socket.close();
                in.close();
                outs.close();
                inputStream.close();
                outputStream.close();
                pw.close();
            } finally {
                socket = null;
                in = null;
                outs = null;
                inputStream = null;
                outputStream = null;
                pw = null;
            }

        } catch (ConnectException ce) {
            out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" + ce);
        } catch (Exception e) {
            out.println("ERROR: ConnectWithFilter().getContent() " + e);
            logger.error("ERROR: ConnectWithFilter().getContent() " + e);
            pw.println("exit");
        }

        return rtn;

    } //end addInAcl


} //end class

