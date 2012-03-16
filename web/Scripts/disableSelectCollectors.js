

function disableSelectCollectors(){

    if (tipoGrafica == 'RECOLECTORES'){
       document.formSelects.selectCollector.disabled = true;
    } else {
        document.formSelects.selectCollector.disabled = false;
    }   

}