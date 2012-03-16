

function validaRecolector(){

    var sc1 = document.formSelects.selectCollector.value;


    if(tipoGrafica != 'RECOLECTORES' && ip_remoto == ""){
        
        alert("Favor de seleccionar un recolector");
        jGrowTimeMessages("<h3>Favor de seleccionar un recolector</h3>",2500);
        return false;
    }

    return true;


}
