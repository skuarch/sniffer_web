


function ejecutaE2E(){

    var source = document.formE2E.origen.value;
    var target = null;
    var disabled = document.formE2E.destinoPersonalizado.disabled;

    //validando
    if(document.formE2E.destino.value == ""){

        alert("Seleccione un destino");
        return;

    }

    if(document.formE2E.destinoPersonalizado.value == "" && disabled != true){

        alert("Favor de escribir un destino");
        return;

    }


    if(document.formE2E.destinoPersonalizado.value == "host destino"){

        alert("Favor de escribir un destino");
        document.formE2E.destinoPersonalizado.value ="";

        return;

    }



    //buscando el destino
    if(disabled == true){

        target = document.formE2E.destino.value

    }else{

        target = document.formE2E.destinoPersonalizado.value        

    }


    ajaxE2E(source,target);

}

