
function blockDomains(domains,categorie){

    var withPoint = false;

    if(domains == null || domains == ""){
        alert("ERROR:\n-Favor de escribir un dominio");
    }else{

        for(i=0; i<domains.length; i++){

            if(domains.charAt(i)  == " "){
                alert("ERROR:\n-El dominio contiene espacios");
                return;
            }            

        }


        for(e=0; e<domains.length; e++){

            if(domains.charAt(e)  == '.'){
                withPoint = true;
                break;
            }else{
                withPoint = false;
            }

        }        

        if(withPoint == false){
            alert("ERROR:\n-El dominio debe de contener minimo un punto");
            return;
        }
        

        var answer = confirm ("Estas seguro que deseas bloquear el dominio\n"+domains);

        if (answer){            
            ajaxBlockDomain(categorie,domains);
        }else{
            alert ("operacion cancelada por el usuario")
        }
    
    }

}