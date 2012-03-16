function blockSubred(subred,categorias,nameOfStructure){

    var selectedArray = new Array();
    var count = 0;
    var ip = "";
    var error = "";
    var mask = "";
    var withSlash = false;

    subred = subred.replace(' ','');
    subred = subred.replace(" ","");
    subred = subred.replace(/^\s+/g,'').replace(/\s+$/g,'');

    for(i=0; i<subred.length;i++){
        
        if(subred.charAt(i) != "/"){
            ip += subred.charAt(i);
        }

        if(subred.charAt(i) == "/"){
            withSlash = true;
            break;
        }
        
    }    

    mask = subred.substring(i+1,subred.length);
    
    var bueno = validaIp(ip);

    if(mask == ""){
        error = "\n-Favor de proporcionar un prefijo de red";
    }

    if(mask < 1 || mask > 32){
        error += "\n-El rango del prefijo debe de ser entre 1 y 32";
    }

    if(bueno == false){
        return;
    }

    if(!withSlash){
        error += "\n-La subred es incorrecta";
    }

    if(ip.length < 7 || ip == " "){
        error += "\n-El tamaño de la direccion IP es incorrecto";
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

    var answer = confirm ("Estas seguro que deseas bloquear la ip\n"+ip +"\nEsto borrara las categorias seleccionadas anteriormente");

    if (answer){        
        ajaxBlockInStructure(subred,selectedArray,nameOfStructure);
    }else{
        alert ("operacion cancelada por el usuario")
    }


} //end blockIP