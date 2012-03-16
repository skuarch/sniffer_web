
function unblockDomains(domains){
    
    var selectedArray = new Array();
    var count = 0;    

    for (i=0; i<domains.options.length; i++) {
        if (domains.options[i].selected) {
            selectedArray[count] = domains.options[i].value;
            count++;
        }

    }

    if(count<1){

        alert("ERROR: \n-Favor de seleccionar un dominio de la lista");

    }else{

        var answer = confirm ("Estas seguro que deseas desbloquear el dominio(s)");
        
        if (answer){            
            ajaxUnBlockDomain(selectedArray,categorie);
        }else{
            alert ("operacion cancelada por el usuario")
        }

    }
    

}