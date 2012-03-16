function blockIP(ip,categorias,nameOfStructure){

    var selectedArray = new Array();
    var count = 0;
    var error = "";

    var bueno = validaIp(ip);

    ip = ip.replace(' ','');
    ip = ip.replace(" ","");
    ip = ip.replace(/^\s+/g,'').replace(/\s+$/g,'');

    if(bueno == false){
        return;
    }

    if(ip.length < 7 || ip == " "){
        error = "\n-El tamaño de la direccion IP es incorrecto";
    }

    for (i=0; i<categorias.options.length; i++) {
        if (categorias.options[i].selected) {
            selectedArray[count] = categorias.options[i].value;
            count++;
        }

    }

    if(count == 0){
        error += "\n-Favor de seleccionar una categoria para el bloqueo";
    }

    if(error.length > 0){
        error = "Los siguientes errores han ocurrido\n" + error;
        alert(error);
        return;
    }

    var answer = confirm ("Estas seguro que deseas bloquear la ip\n"+ip+"\nEsto borrara las categorias seleccionadas anteriormente");

    if (answer){        
        ajaxBlockInStructure(ip,selectedArray,nameOfStructure);
    }else{
        alert ("operacion cancelada por el usuario")
    }


} //end blockIP