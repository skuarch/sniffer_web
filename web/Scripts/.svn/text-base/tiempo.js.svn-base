/*
 *1 hoy
 *2 ultima hora
 *3 ultimas 2 horas
 *4 ayer
 *5 7 dias
 *6 15 dias
 *7 Personalizado
*/
function tiempo(time){

    switch(time){

        case "HOY":
            setFechaInicial(getFechaActualCeros());
            setFechaFinal(getFechaHoraActual());
            tiempoGrafica = 'HOY';
            break;


        case "ULTIMA HORA":

            setFechaInicial(fechaFormatoSql(convierteTimeStamp(getNowTimeStamp()- 3600000)));
            setFechaFinal(getFechaHoraActual());
            tiempoGrafica = 'ULTIMA HORA';
            break;


        case "ULTIMAS DOS HORAS":

            setFechaInicial(fechaFormatoSql(convierteTimeStamp(getNowTimeStamp()- (3600000 * 2))));
            setFechaFinal(getFechaHoraActual());
            tiempoGrafica = 'ULTIMAS DOS HORAS';
            break;

        case "AYER":
            setFechaInicial(getFechaAyerInicia());
            setFechaFinal(fechaFormato23(convierteTimeStamp(getTimeStamp(getObjectDate()) - (3600000 * 24)))) ;
            tiempoGrafica = 'AYER';
            window.clearInterval(refreshInterval);            
            break;


        case "7 DIAS":
            setFechaInicial(fechaFormatoCeros(convierteTimeStamp(getTimeStamp(getObjectDate()) - (3600000 * 24 * 7))));
            setFechaFinal(getFechaHoraActual()) ;
            tiempoGrafica = '7 DIAS';
            window.clearInterval(refreshInterval);            
            break;



        case "15 DIAS":
            setFechaInicial(fechaFormatoCeros(convierteTimeStamp(getTimeStamp(getObjectDate()) - (3600000 * 24 * 15))));
            setFechaFinal(getFechaHoraActual()) ;
            tiempoGrafica = '15 DIAS';
            window.clearInterval(refreshInterval);            
            break;


         
         case "PERSONALIZADO":
            tiempoGrafica = 'PERSONALIZADO';
            window.clearInterval(refreshInterval);
            openWindow("customDates.jsp",500,300,true,"?");
            break;
         

    }// fin switch    

}// fin funcion