function blockRango(rango,categorias,nameOfStructure){

    var selectedArray = new Array();
    var count = 0;
    var ip1 = "";
    var ip2="";
    var error = "";    
    var withSlash = false;    

    for(i=0; i<rango.length;i++){
        
        if(rango.charAt(i) != "-"){
           ip1 += rango.charAt(i);
        }

        if(rango.charAt(i) == "-"){
            withSlash = true;
            break;
        }
        
    }        

    rango = rango.replace(' ','');
    rango = rango.replace(" ","");
    ip1 = ip1.replace(/^\s+/g,'').replace(/\s+$/g,'');
    ip2 = ip2.replace(/^\s+/g,'').replace(/\s+$/g,'');

    ip2 = rango.substring(i+1,rango.length);

    var bueno = validaIp(ip1);
    var bueno2 = validaIp(ip2);

    if(ip1 == ip2){
           error += "\n-Los rangos son iguales";
    }

    if(rango.length < 15 || rango.length > 31){
        error += "\n-El rango es incorrecto";
    }

    if(bueno == false){
        return;
    }

    if(!withSlash){
        error += "\n-El rango debe de llevar un '-'";
    }

    if(ip1.length < 7 || ip1 == " "){
        error += "\n-El tamaño de la direccion IP es incorrecto";
    }

    if(ip2.length < 7 || ip2 == " "){
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

    var answer = confirm ("Estas seguro que deseas bloquear el rango\n"+rango+"\nEsto borrara las categorias seleccionadas anteriormente");

    if (answer){        
        ajaxBlockInStructure(ip1+"-"+ip2,selectedArray,nameOfStructure);
    }else{
        alert ("operacion cancelada por el usuario")
    }


} //end blockIP