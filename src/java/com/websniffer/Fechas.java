package com.websniffer;

//import java.sql.Time;
import java.util.Date;

/**
 *
 * @author skuarch
 */
public class Fechas {


    private String fechaSql;
    private String horaSql;
    private String fechaHora;
    private long timeStamp;
    private Date objDate;
    private Date sqlDate;
    private Date sqlTime;
    private String horaCeros;
    private String horaUltima;



    //==========================================================================
    public Fechas(){

        objDate = new Date();
        sqlDate = new java.sql.Date(new Date().getTime());
        sqlTime = new java.sql.Time(new Date().getTime());
        fechaHora = sqlDate + " " + sqlTime;
        fechaSql = sqlDate.toString();
        horaSql = sqlTime.toString();
        timeStamp = objDate.getTime();
        horaCeros = " 00:00:00";
        horaUltima = " 23:59:59";

    }//fin constructor




    //==========================================================================
    public String getFechaHora(){
        return fechaHora;
    }



    public String getHoraCeros(){
        return horaCeros;
    }



    //==========================================================================
    public String getFechaSql(){
        return fechaSql;
    }


    //==========================================================================
    public void setFechaSql(String nvoFecha){
        fechaSql = nvoFecha;
    }


    //==========================================================================
    public String getHoraSql(){
        return horaSql;
    }


    //==========================================================================
    public void setHoraSql(String nvoHora){
        horaSql = nvoHora;
    }


    //==========================================================================
    public long getTimeStamp(){
        return timeStamp;
    }


    //==========================================================================
    public void setTimeStamp(long nvoTimeStamp){
        timeStamp = nvoTimeStamp;
    }


    //==========================================================================
    public String getHoraUltima(){
        return horaUltima;
    }





    //==========================================================================
    /**
     * Metodo que convierte un String a el formato de id de la base de datos
     * @param fecha String con la fecha en formato sql
     * @return long con el formato yyyymmddhhmm
     */
    public long fechaId(String fecha){

        long fechaLong = 0;
        String fechaStr;
        fechaStr = fecha.substring(0, 4)+
                   fecha.substring(5, 7)+
                   fecha.substring(8, 10)+
                   fecha.substring(11, 13)+
                   fecha.substring(14, 16);

        fechaLong = Long.valueOf(fechaStr).longValue();

        return (long)fechaLong;
    }




    //==========================================================================
    /**
     * convierte un long a fecha sql
     * @param fechaLong fecha en segundos
     * @return fecha en formato sql
     */
    public String convierteFecha(long fechaLong){

        java.sql.Date sqlDate1 = new java.sql.Date(fechaLong);
        java.sql.Time sqlTime1 = new java.sql.Time(fechaLong);

        return sqlDate1+" "+sqlTime1;
    }


}
