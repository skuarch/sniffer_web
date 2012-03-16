package com.websniffer;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author Puebla
 * @archivoZipConRuta : archivo Zip con todo y su path
 * @rutaBD = ruta de la BD
 * @user : usuario de la BD
 * @password : password de la BD
 * @nivelDetalle : numero de registros a insertar por minuto. Default 25
 */
class Sniffer2BD extends Thread {
    String archivoZipConRuta;
    String rutaBD;
    String user;
    String password;
    String nivelDetalle;
    String context;
    String ipBD;
    boolean completa;
    
    static final Logger logger = Logger.getLogger(Sniffer2BD.class);

    /**
     * @param archivoZipConRuta
     */
   public Sniffer2BD(String archivoZipConRuta,String context) {
       this.context = context;
       //this.completa = false;
       //this.nivelDetalle = "25";
       this.ipBD = "localhost";
       this.rutaBD = "/var/lib/mysql/";
       this.user = "root";
       this.password = "vitalnoc";
        
        this.archivoZipConRuta = archivoZipConRuta;
    }



    @Override
    public void start() {
        //validando archivo zip
        if(!new CheckFile().exists(archivoZipConRuta))
        {
            try {
                logger.error("no exite el archivo zip");
                throw new Exception ("no exite el archivo zip");
            }catch(Exception e) {
                logger.error("no exite el archivo zip" + e);
            }
        }//fin de valida archivo


        

        String nombArchZip = new File(archivoZipConRuta).getName();
        String nomb_BD = "sniffer_" + nombArchZip.substring(0, nombArchZip.indexOf("_", nombArchZip.indexOf("_",
                nombArchZip.indexOf("_", nombArchZip.indexOf("_", nombArchZip.indexOf("_") + 1) + 1) + 1) + 1));

        rutaBD = rutaBD + nomb_BD + "/";
        
        String host = ipBD;
        String cadena_jdbc = "jdbc:mysql://"+ host +"/";
        String minutoTabla;
        String idTablas;
        String fechaArch;
        String nombArchsTXT_tmp = "";
    //    String nombBDRepositorio = "websniffer_";
        String IP_remoto_tmp = "";
        boolean existsBD = false;
        //String IP_remoto = "";

        //  "/" si es un sistema unix y debe usarse "\" si es un windows
        String PathArchZip = new File(archivoZipConRuta).getParent() +"/";

        IP_remoto_tmp = nombArchZip.substring(nombArchZip.indexOf("_") + 1, nombArchZip.indexOf("_", nombArchZip.indexOf("_", nombArchZip.indexOf("_", nombArchZip.indexOf("_", nombArchZip.indexOf("_") + 1) + 1) + 1) + 1));

        //nombBDRepositorio += nombArchZip.substring(0, nombArchZip.indexOf("_"));

        //String[][] ipam = null;

        nombArchsTXT_tmp = nombArchZip.substring(nombArchZip.indexOf("Captura") + 7, nombArchZip.length() - 4);

        fechaArch = nombArchZip.substring(nombArchZip.length() - 18, nombArchZip.length() - 4);
        minutoTabla = fechaArch.substring((fechaArch.length() - 6), fechaArch.length() - 2);
        idTablas = fechaArch.substring((fechaArch.length() - 14), fechaArch.length() - 2);

    //    IP_remoto = IP_remoto_tmp.replace("_", ".");


        //File BDiniFile = new File(rutaBD + "BDinicializada");
        CreaBaseDatosRemoto cBDr = new CreaBaseDatosRemoto();
            
        UnzipArchZip unzip = new UnzipArchZip();
        unzip.unzipArchZip(nombArchZip, PathArchZip); //descomprime archivo zip
        unzip = null;

       String usuarioBD = "root";

       existsBD = cBDr.dbExists(this.user, this.password, this.ipBD, nomb_BD);


        if (existsBD) {
            try {
                ConectaBDRemoto conBDrem = new ConectaBDRemoto();
                Statement stBD = conBDrem.AbreConexionMysql(host, nomb_BD, usuarioBD, password, cadena_jdbc);

                ResultSet rs = stBD.executeQuery("SELECT completa, nivelDetalle FROM config_sam");
                rs.next();
                this.completa = rs.getBoolean(1);
                this.nivelDetalle = rs.getString(2);                
            } catch (SQLException ex) {
                logger.error("ERROR al obtener config SAM: " + ex);
            }

        } else {
            this.completa = false;
            this.nivelDetalle = "25";
        }


       //si la BD no existe, entonces la creo y la inicializo
        if (!existsBD) {
            //Doy de alta el nuevo remoto en la BD general
            UpdateRemoto upRemoto = new UpdateRemoto();
            upRemoto.update(context, IP_remoto_tmp, nomb_BD, usuarioBD);

            //creo la BD del remoto
            cBDr.CreaBD(this.user, password, nomb_BD);
            cBDr = null;

//            //Creo un archivo dentro de la BD para saber si ésta ya ha sido creada e inicializada
//            try {
//                BDiniFile.createNewFile();
//            } catch (IOException ex) {
//                logger.error("Error creando el archivo BDinicializada:  " + ex);
//            }

            CreaEinicializaBDremoto cBDremoto = new CreaEinicializaBDremoto();
            cBDremoto.crea(host, nomb_BD, usuarioBD, password, cadena_jdbc, minutoTabla, PathArchZip, nombArchsTXT_tmp);
            

        }//if (!BDiniFile.exists())
        else {   //si la BD ya existe

            String proyecto = this.context.substring(1, this.context.length());
            ConnectPool cp = new ConnectPool(this.context);

//            ResultSet rsUsuario = cp.select("SELECT collector_database_user FROM collectors WHERE collector_ip LIKE '" + IP_remoto_tmp.replace("_", ".") + "' AND collector_description LIKE '" + proyecto + "'");
//            cp = null;
//            try {
//                rsUsuario.next();
//                usuarioBD = rsUsuario.getString(1);
//                rsUsuario.close();
//                rsUsuario = null;
//            } catch (SQLException ex) {
//                logger.error("Error conectandose al pool" + ex);
//            }


            try {
                ConectaBDRemoto conBDremoto = new ConectaBDRemoto();
                Statement st = conBDremoto.AbreConexionMysql(host, nomb_BD, usuarioBD, password, cadena_jdbc);

                CreaTablasTmpRemoto cTtmpR = new CreaTablasTmpRemoto(); //creo tablas temporales
                cTtmpR.creaTablasTemporalesRemoto(st, minutoTabla);
                cTtmpR = null;

                LoadTxtBD cargaTxtBD = new LoadTxtBD(); //cargo los txt en las tablas temporales
                cargaTxtBD.cargaTxts(st, PathArchZip, nombArchsTXT_tmp, minutoTabla);
                cargaTxtBD = null;

                conBDremoto.CierraConexionMysql(st);
                st.close();
                conBDremoto = null;

            } catch (SQLException ex1) {
                logger.error("Error creando y cargando la tablas temporales:  " + ex1);
            }
        }//fin del else de ya existe la BD

       

        
        try {
            new Sumalizacion(minutoTabla, nivelDetalle, idTablas, minutoTabla, host, nomb_BD, usuarioBD, password, cadena_jdbc, completa);
        } catch (Exception ex) {
            logger.error("Error en Sumalizacion: " + ex);
        }



        new BorraArchivosTxt_tmps(PathArchZip, nombArchsTXT_tmp);

        UnzipArchZip unzipBorra = new UnzipArchZip();
        unzipBorra.borraArchZip(nombArchZip, PathArchZip);

        unzipBorra = null;
//        System.gc();

    }//fin de start()

}
