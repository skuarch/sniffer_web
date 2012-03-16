/**
* @autor skuarch
* AJAX PARA TODAS LAS GRAFICAS
* esta funcion crea un objeto ajax y el resultado lo coloca en contenedor1
* contiene una variable para el control de cache
* el formato de las fechas es yyyy-mm-dd hh:mm:ss
* obtine la ruta de la funcion graficaRutas
*/
var filas1 = 0;
var filas2 = 0;

    function ajaxTablaServidores(dataSet,limit,paginacion){

    

        //siguiente
        if(filas1 == 0 && paginacion == "siguiente"){

            filas1 = 1;
            //filas2 = filas1 + limit * 1 -1;
            filas2 = limit;

        }else if(filas1 != 0 && paginacion == "siguiente"){

            filas1 = filas1 + limit * 1;
            //filas2 = filas1 + limit *1 - 1;
            filas2 = limit;
            
        }// fin figuiente


        //anterior             
        if(filas1 != 0 && paginacion == "anterior"){

            filas1 = filas1 - limit * 1;
            //filas2 = filas1 + limit * 1 -1 ;
            filas2 = limit;
        }
        //para que el numero no este en negativo
        if(filas1 == 0 && paginacion == "anterior" || filas1 == -99 || filas1 == "-99" || filas1 < 1){

            filas1 = 1;
            //filas2 = limit;
            filas2 = limit;
            return ;
        }


        //fijo
        if(paginacion == "fijo"){
            // las variables se quedan como estan
            filas1=0;
            filas2=100;
        }

        
        
        
        //alert("filas1: "+filas1);
        //alert("filas2: "+filas2);

	ajax = nuevoAjax();

	//control del cache
	var r1 = Math.random()*1000;
	var r2 = Math.random();
	var r3 = Math.round(r1+r2,2);
        var cargador = null;        

        var ruta = "tablaServidores.jsp?fecha_inicial="+window.opener.fecha_inicial+"&fecha_final="+window.opener.fecha_final+"&opcionGrafica="+window.opener.opcionGrafica+"&r3="+r3+"&clic="+window.opener.clic+"&tipoGrafica="+window.opener.tipoGrafica+"&tiempoGrafica="+window.opener.tiempoGrafica+"&unidadMedida="+window.opener.unidadMedida+"&nombreUnidadMedida="+window.opener.nombreUnidadMedida+"&refreshInterval="+window.opener.refreshInterval+"&dataSet="+dataSet+"&limit="+limit+"&paginacion="+paginacion+"&filas1="+filas1+"&filas2="+filas2+"&ip_servidor="+window.opener.ip_servidor+"&puerto_server="+window.opener.puerto_server+"&nombreUnidadMedida2="+window.opener.nombreUnidadMedida2+"&ip_remoto="+window.opener.ip_remoto;

	ajax.open("GET",ruta, true);
	ajax.onreadystatechange=function(){

		if(ajax.readyState==1){

			cargador = '<div align="center" class="div_cargador">Cargando...<br /> <img src="images/ajax-loader.gif" alt="Cargando..." /><br />Espere por favor</div>';
			document.getElementById('contenedorTablaServidores').innerHTML = cargador;
		}//fin 1


		if(ajax.readyState==2){
			cargador = '<div align="center" class="div_cargador">Cargando...<br /> <img src="images/ajax-loader.gif" alt="Cargando..." /><br />Espere por favor</div>';
			document.getElementById('contenedorTablaServidores').innerHTML = cargador;
		}//fin 2


		if(ajax.readyState==3){
			cargador = '<div align="center" class="div_cargador">Creando datos...<br /> <img src="images/ajax-loader.gif" alt="Cargando..." /><br />Espere por favor</div>';
			document.getElementById('contenedorTablaServidores').innerHTML = cargador;
		}//fin 3


		if(ajax.readyState==4){

			//alert(ajax.responseText);

			document.getElementById('contenedorTablaServidores').innerHTML = ajax.responseText;
                        sortables_init();

		}//fin 4

	}//fin onreadystate

    ajax.send(null);
    return;


}//fin funcion