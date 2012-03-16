function validaFechas(){

	var fecha = new Date();
	var anio = fecha.getFullYear();
	var mes = fecha.getMonth()+1;
	var dia = fecha.getDate();
	var hora = fecha.getHours();
	var minuto = fecha.getMinutes();
	var segundo = '00';

	if(mes < 10)mes = '0'+mes;
	if(minuto < 10)minuto = '0'+minuto;
        if(hora < 10)hora = '0'+hora;

        var fechaSql = anio+'-'+mes+'-'+dia+' '+hora+':'+minuto+':'+segundo;	
        var errores = "";



	//obtengo las fechas de la pagina
	var fecha_inicial = document.form.fecha_inicial.value;
	var fecha_final = document.form.fecha_final.value;


        if(fecha_inicial > fechaSql){
            errores = errores + "La fecha inicial no puede ser mayor a la actual<br>";
        }


        if(fecha_final > fechaSql){
            errores = errores + "La fecha final no puede ser mayor a la actual<br>";
        }


	//valido que las fechas contengan algo
	if (fecha_inicial == "" || fecha_inicial == '' || fecha_inicial == undefined || document.form.fecha_inicial.length < 1){

		errores = errores + "La fecha inicial esta vacia, se requiere de una fecha<br>";

	}//fin if validacion de fecha inicial






	if (fecha_final == "" || fecha_final == '' || fecha_final == undefined || document.form.fecha_final.length < 1){

		errores = errores + "La fecha final esta vacia, se requiere de una fecha<br>";

	}//fin if validacion de fecha inicial





	//comparo que la fecha inicial no sea mayor a la fecha final
	if(fecha_inicial > fecha_final){

		errores = errores + "La fecha inicial no puede ser mayor a la fecha final<br>"

	}//fin if comparacion





	//comparo que la fecha final no sea menor a la fecha inicial
	if(fecha_final < fecha_final){

		errores = errores + "La fecha final no puede ser menor a la fecha inicial<br>"

	}//fin comparacion





	//muestro los errores en la capa de errores del index
	if(errores != ""){

		document.getElementById('error').innerHTML='<b>'+errores+'</b>';
		return false;

	}else{

		document.getElementById('error').innerHTML='';
		return true;

	}//fin if errores



}//fin validaFechas