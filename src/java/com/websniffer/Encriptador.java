package com.websniffer;

/**
 *
 * @author Puebla
 */
public class Encriptador {

    public static String desencripta(String encriptado) {
        String desencriptado = "";

        String llave = "abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789";
        int cont = 0;
        int temp = 0;
        int ultimo = 0;

        for (cont = 0; cont < encriptado.length(); cont++) {
            //temp = (int)(llave[cont]) + (int)(encriptado[cont]);
            temp = (int) llave.charAt(cont) + (int) encriptado.charAt(cont);

            if (temp < 32) {
                temp = 122 - (32 - temp);
            }

            if (temp > 122) {
                temp = 32 + (temp - 122);
            }

            desencriptado += (char) temp;

            ultimo++;
        }

        return desencriptado;
    }

    public static String encripta(String desencriptado) {
        String encriptado = "";
        String tmp = "";
        String llave = "abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789";
        int cont = 0;
        int temp = 0;
        int ultimo = 0;

        for (cont = 0; cont < desencriptado.length(); cont++) {
            temp = (int) (desencriptado.charAt(cont)) - (int) (llave.charAt(cont));


            if (temp < 32) {
                temp = 122 - (32 - temp);
            }

            if (temp > 122) {
                temp = 32 + (temp - 122);
            }

            encriptado += (char) (temp);
            ultimo++;
        }
        
        return encriptado;
    }
}
