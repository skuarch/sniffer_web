//==============================================================================
/**
 * obtiene la fecha actual del navegador (cliente)
 * @return String con la fecha en formato (yyyy-mm-dd hh:mm:ss)
 */
function getFechaHoraActual(){

    	var fecha = new Date();
	var anio = fecha.getFullYear();
	var mes = fecha.getMonth()+1;
	var dia = fecha.getDate();
	var hora = fecha.getHours();
	var minuto = fecha.getMinutes();
	var segundo = '00';

        if(dia < 10 || dia.length == 1)dia = '0'+dia;
	if(mes < 10)mes = '0'+mes;
	if(minuto < 10)minuto = '0'+minuto;
        if(hora < 10)hora = '0'+hora;
	

	var fechaSql = anio+'-'+mes+'-'+dia+' '+hora+':'+minuto+':'+segundo;

        return fechaSql;
}



/**
 * funcion que regresa un objeto de tipo date actual
 * @return Date
 */
function getObjectDate(){

    return new Date();

}




//==============================================================================
/**
 * obtiene la fecha actual del navegador (cliente)
 * @return String con la fecha en formato (yyyy-mm-dd 00:00:00)
 */
function getFechaActualCeros(){

    	var fecha = new Date();
	var anio = fecha.getFullYear();
	var mes = fecha.getMonth()+1;
	var dia = fecha.getDate();

	if(mes < 10)mes = '0'+mes;
        if(dia < 10 || dia.length == 1)dia = '0'+dia;
	//if(segundo < 10)segundo = '0'+segundo;


	var fechaSql = anio+'-'+mes+'-'+dia+' 00:00:00';

        return fechaSql;
}


//==============================================================================
/**
 * Establece el formato a una fecha recibe un objeto de tipo date
 * @return string data con formato "yyyy-mm-dd hh:MM:ss"
 */
function fechaFormato(date){
    return dateFormat(date, "yyyy-mm-dd hh:MM:ss");
}



//==============================================================================
/**
 * Establece el formato a una fecha recibe un objeto de tipo date
 * @return string data con formato "yyyy-mm-dd 00:00:00"
 */
function fechaFormatoCeros(date){
    return dateFormat(date, "isoDate") + " 00:00:00";
}


//==============================================================================
/**
 * Establece el formato a una fecha recibe un objeto de tipo date
 * @return string data con formato "yyyy-mm-dd 23:59:59"
 */
function fechaFormato23(date){
    return dateFormat(date, "isoDate") + " 23:59:59";
}


//==============================================================================
/**
 * Establece el formato a una fecha recibe un objeto de tipo date
 * @return string data con formato "yyyy-mm-dd hh:ii:ss"
 */
function fechaFormatoSql(date){
    return dateFormat(date, "yyyy-mm-dd' 'HH:MM:ss");
}




//==============================================================================
/**
 * obtiene la fecha de ayer inicial
 * @return string data con formato ayer "yyyy-mm-dd 00:00:00"
 */
function getFechaAyerInicia(){
    var f = new Date().getTime();
    f = f - 86400000;
    return fechaFormatoCeros(f);
}




//==============================================================================
/**
 * obtiene la fecha de ayer final
 * @return string data con formato ayer "yyyy-mm-dd 00:00:00"
 */
function getFechaAyerFinaliza(){
    var f = new Date().getTime();
    f = f - 86400000;
    return fechaFormato23(f);
}



//==============================================================================
/**
 * obtiene la fecha de antier inicial
 * @return string data con formato ayer "yyyy-mm-dd 00:00:00"
 */
function getFechaAntierInicia(){
    var f = new Date().getTime();
    f = f - 86400000 * 2;
    return fechaFormatoCeros(f);
}



//==============================================================================
/**
 * obtiene la fecha de ayer final
 * @return string data con formato ayer "yyyy-mm-dd 00:00:00"
 */
function getFechaAntierFinaliza(){
    var f = new Date().getTime();
    f = f - 86400000 * 2;
    return fechaFormato23(f);
}




//==============================================================================
/**
 * obtiene el timestamp tipo javascript con los segundos actuales
 * @return timestamp (javascript) actual
 */
function getNowTimeStamp(){
    //var now = Date.parse(new Date()) /1000;
    return Math.round(new Date().getTime());
}


//==============================================================================
/**
 * regresa los segundos de un objeto date
 * @return timestamp (javascript)
 */
function getTimeStamp(date){
    return date.getTime();
}



//==============================================================================
/**
 * Convierte segundos a un objeto de tipo date
 * @return un objeto de tipo date
 */
function convierteTimeStamp(ts){
    date = new Date(ts);
    return date;
}


//==============================================================================
/**
 * resta segundos para una fecha
 * @param segNow
 * @param segRestar a restar
 * @return la diferencia entre segnow y segRestar
 */
function restaSegundos(segNow,segRestar){
    var v = segNow - segRestar;
    return fechaFormato(convierteTimeStamp(v));
}