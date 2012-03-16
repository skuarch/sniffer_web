
function unBlockUrls(categorie,url){

    var selectedArray = new Array();
    var count = 0;
    

    for (i=0; i<url.options.length; i++) {
        if (url.options[i].selected) {
            selectedArray[count] = url.options[i].value;
            count++;
        }

    }

    if(count<1){

        alert("ERROR: \n-Favor de seleccionar una url de la lista");

    }else{

        var answer = confirm ("Estas seguro que deseas desbloquear la url(s)");

        if (answer){
            ajaxUnBlockUrl(selectedArray,categorie);
        }else{
            alert ("operacion cancelada por el usuario")
        }

    }


}