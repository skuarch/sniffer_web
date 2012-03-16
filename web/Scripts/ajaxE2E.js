/**
* @autor skuarch
* AJAX PARA TODAS LAS GRAFICAS
* esta funcion crea un objeto ajax y el resultado lo coloca en contenedor1
* contiene una variable para el control de cache
* el formato de las fechas es yyyy-mm-dd hh:mm:ss
* obtine la ruta de la funcion graficaRutas
*/
function ajaxE2E(origen,destino){

    ajax = nuevoAjax();
       

    //control del cache
    var r1 = Math.random()*1000;
    var r2 = Math.random();
    var r3 = Math.round(r1+r2,2);
    var cargador = null;

    //desahabilito todo para que no hagan pendejadas
    document.formE2E.origen.disabled = true;
    document.formE2E.destino.disabled = true;
    document.formE2E.destinoPersonalizado.disabled = true;
    document.formE2E.ejecutar.disabled = true;


    var ruta = "graficaE2E.jsp?origen="+origen+"&destino="+destino;

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
            cargador = '<div align="center" class="div_cargador">Cargando...<br /> <img src="images/ajax-loader.gif" alt="Cargando..." /><br />Espere por favor</div>';
            document.getElementById('contenedor1').innerHTML = cargador;
        }//fin 3


        if(ajax.readyState==4){

            //alert(ajax.responseText);

            document.getElementById('contenedor1').innerHTML = ajax.responseText;
            sortables_init();

            //habilito todo para que no hagan problemas
            document.formE2E.origen.disabled = false;
            document.formE2E.destino.disabled = false;
            document.formE2E.ejecutar.disabled = false;
            if(document.formE2E.destinoPersonalizado.disabled == true){
                document.formE2E.destinoPersonalizado.disabled = false;
            }


        }//fin 4

    }//fin onreadystate

    ajax.send(null);
    return;


}//fin funcion