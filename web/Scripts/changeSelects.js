
//general
function changeSelects(){

    var sc = document.formSelects.selectCollector.value;

    if(sc == 0){
        alert("favor de seleccionar un recolector de la lista");
        jGrowTimeMessages("<h3>Favor de seleccionar un recolector</h3>",2500);
    }else{

        //set all
        setIpRemoto(document.formSelects.selectCollector.value);
        setNombreUnidadMedida(document.formSelects.selectMeasure.value);
        setTiempoGrafica(document.formSelects.selectDates.value);        
        setOpcionGrafica(document.formSelects.selectOptions.value);
        
        jGrowTimeMessages('remoto ip='+getIp_remoto()+'<br> tipo='+getTipoGrafica()+'<br> tiempo='+getTiempoGrafica()+' <br> medida='+getNombreUnidadMedida() +'<br> opcion=' + getOpcionGrafica(),3000);
        handler();        
    }

}