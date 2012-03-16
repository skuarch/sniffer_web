

function validateConfigCollector(){

    var f = document.formConfigCollector;
    var error = "";

    if(f.collector_hostname.value == ""){
        error +="-Falta el hostname\n";
    }

    if(f.collector_site.value == ""){
        error +="-Falta el nombre del sitio\n";
    }

    if(f.collector_site.length > 40){
        error += "-El nombre del sitio no puede ser mayor a 50 caracteres\n";
    }

    if(error.length >0){

        alert("Error:\n"+error);

    }else{

        f.submit();
        reloadTableCollector();

    }


    
}