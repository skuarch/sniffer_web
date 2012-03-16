/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websniffer;

import java.io.File;

/**
 *
 * @author Puebla
 */
class BorraArchivosTxt_tmps {

    public BorraArchivosTxt_tmps(String rutaBD, String fechaArch) {
        File archivoHTTP = new File(rutaBD + "HTTP" + fechaArch + ".txt");
        File archivoHTTP_TR = new File(rutaBD + "HTTP_TR_" + fechaArch + ".txt");
        File archivoTCP = new File(rutaBD + "TCP" + fechaArch + ".txt");
        File archivoTR = new File(rutaBD + "TR" + fechaArch + ".txt");
        File archivoUDP = new File(rutaBD + "UDP" + fechaArch + ".txt");
        File archivoIndicadores = new File(rutaBD + "Indicadores" + fechaArch + ".txt");

        archivoHTTP.delete();
        archivoHTTP_TR.delete();
        archivoTCP.delete();
        archivoTR.delete();
        archivoUDP.delete();
        archivoIndicadores.delete();

        archivoHTTP = null;
        archivoHTTP_TR = null;
        archivoTCP = null;
        archivoTR = null;
        archivoUDP = null;
        archivoIndicadores = null;
    }
}
