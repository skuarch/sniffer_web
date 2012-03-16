

function ajaxDeleteStructureSource(nameOfStructure){

    var continues = false;
    var ajax = nuevoAjax();


    if(nameOfStructure == "admin"){
        alert("el bloqueo admin no se puede borrar");
        return;
    }


    var answer = confirm("Estas seguro de eliminar el bloqueo " + nameOfStructure +"?")
    if (answer){
        contunues = true;
    }
    else{
        alert("Operacion cancelada")
        return;
    }



    //control del cache
    var r1 = Math.random()*1000;
    var r2 = Math.random();
    var r3 = Math.round(r1+r2,2);

    var ruta = "Scripts/deleteStructure.jsp?nameOfStructure="+nameOfStructure+"&r3"+r3;

    ajax.open("GET",ruta, true);
    ajax.onreadystatechange=function(){

        if(ajax.readyState==1){
        }//fin 1


        if(ajax.readyState==2){
        }//fin 2


        if(ajax.readyState==3){
        }//fin 3


        if(ajax.readyState==4){

            alert(ajax.responseText);
            handler();

        }//fin 4

    }//fin onreadystate

    ajax.send(null);
    return;


}

