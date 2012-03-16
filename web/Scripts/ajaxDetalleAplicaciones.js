/**
* @autor skuarch
* AJAX PARA TODAS LAS GRAFICAS
* esta funcion crea un objeto ajax y el resultado lo coloca en contenedor1
* contiene una variable para el control de cache
* el formato de las fechas es yyyy-mm-dd hh:mm:ss
* obtine la ruta de la funcion graficaRutas
*/
function ajaxDetalleAplicaciones(label){

	ajax = nuevoAjax();

	//control del cache
	var r1 = Math.random()*1000;
	var r2 = Math.random();
	var r3 = Math.round(r1+r2,2);
        var cargador = null;

        var ruta = "Scripts/detalleAplicaciones1.jsp?fecha_inicial="+window.opener.fecha_inicial+"&fecha_final="+window.opener.fecha_final+"&opcionGrafica="+window.opener.opcionGrafica+"&r3="+r3+"&clic="+window.opener.clic+"&tipoGrafica="+window.opener.tipoGrafica+"&tiempoGrafica="+window.opener.tiempoGrafica+"&unidadMedida="+window.opener.unidadMedida+"&nombreUnidadMedida="+window.opener.nombreUnidadMedida+"&label="+label+"&ip_remoto="+window.opener.ip_remoto+"&remoto="+window.opener.remoto;
        

	ajax.open("GET",ruta, true);
	ajax.onreadystatechange=function(){

		if(ajax.readyState==1){

			cargador = '<div align="center" class="div_cargador">Cargando...<br /> <img src="images/ajax-loader.gif" alt="Cargando..." /><br />Espere por favor</div>';
			document.getElementById('contenedor1').innerHTML = cargador;
		}//fin 1


		if(ajax.readyState==2){
			cargador = '<div align="center" class="div_cargador">Cargando...<br /> <img src="images/ajax-loader.gif" alt="Cargando..." /><br />Espere por favor</div>';
			document.getElementById('contenedor1').innerHTML = cargador;
		}//fin 2


		if(ajax.readyState==3){
			cargador = '<div align="center" class="div_cargador">Creando datos...<br /> <img src="images/ajax-loader.gif" alt="Cargando..." /><br />Espere por favor</div>';
			document.getElementById('contenedor1').innerHTML = cargador;
		}//fin 3


		if(ajax.readyState==4){

			//alert(ajax.responseText);

			document.getElementById('contenedor1').innerHTML = ajax.responseText;
                        sortables_init();


		}//fin 4

	}//fin onreadystate

    ajax.send(null);
    return;


}//fin funcion