
function blockUrls(url,categorie){

    if(url == null || url == ""){
        alert("ERROR:\n-Favor de escribir una url");
    }else{

        for(i=0; i<url.length; i++){

            if(url.charAt(i)  == " "){
                alert("ERROR:\n-La url contiene espacios");
                return;
            }

        }

        var answer = confirm ("Estas seguro que deseas bloquear la url\n"+url);

        if (answer){
            ajaxBlockUrl(categorie,url);
        }else{
            alert ("operacion cancelada por el usuario")
        }

    }

}