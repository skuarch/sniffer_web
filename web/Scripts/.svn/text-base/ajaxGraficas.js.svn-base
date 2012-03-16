/**
* @autor skuarch
* AJAX PARA TODAS LAS GRAFICAS
* esta funcion crea un objeto ajax y el resultado lo coloca en contenedor1
* contiene una variable para el control de cache
* el formato de las fechas es yyyy-mm-dd hh:mm:ss
* obtine la ruta de la funcion graficaRutas
*/
function ajaxGraficas(){

    cargador = '<br><br><br><br><img src="images/ajax-loader.gif" align="absmiddle" /> Cargando...<br>esc para cancelar';
    document.getElementById('contenedor1').innerHTML = cargador;
    var ajax = nuevoAjax();


    //control del cache
    var r3 = null;
    r3 = antiCache(Math.random()*1000,Math.random()*1000);
    var cargador = null;
        
        
    //var ruta = graficaRutas(tipoGrafica)+"?fecha_inicial="+fecha_inicial+"&fecha_final="+fecha_final+"&opcionGrafica="+opcionGrafica+"&r3="+r3+"&clic="+clic+"&tipoGrafica="+tipoGrafica+"&tiempoGrafica="+tiempoGrafica+"&unidadMedida="+unidadMedida+"&nombreUnidadMedida="+nombreUnidadMedida+"&refreshInterval="+refreshInterval+"&paginaGrafica="+paginaGrafica+"&remoto="+remoto+"&ip_remoto="+ip_remoto+"&nombreUnidadMedida2="+nombreUnidadMedida2;
    var ruta = graficaRutas(tipoGrafica)+"?"+getAllVariables()+"&r3=" + r3;

    ajax.open("GET",ruta, true);
    ajax.onreadystatechange=function(){        

        if(ajax.readyState==1){
            document.getElementById('contenedor1').innerHTML = cargador;
        }//fin 1


        if(ajax.readyState==2){            
            document.getElementById('contenedor1').innerHTML = cargador;
        }//fin 2


        if(ajax.readyState==3){            
            document.getElementById('contenedor1').innerHTML = cargador;
        }//fin 3


        if(ajax.readyState==4){

            //alert(ajax.responseText);

            document.getElementById('contenedor1').innerHTML = ajax.responseText;
            sortables_init();
            r3 = null;


        }//fin 4

    }//fin onreadystate

    ajax.send(null);
    return;


}//fin funcion