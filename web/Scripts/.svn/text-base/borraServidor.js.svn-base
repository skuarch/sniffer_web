


function borraServidor(ipServidor,puertoServidor){


    //control del cache
    var r1 = Math.random()*1000;
    var r2 = Math.random();
    var r3 = Math.round(r1+r2,2);


    //validando ip
    if( ipServidor == "" || ipServidor == null || ipServidor.length < 1) {
        alert("No existe ip que borrar");
        return ;
    }

    //validando puerto
    if( puertoServidor == "" || puertoServidor == null || puertoServidor.length < 1 ) {
        alert("No existe puerto que borrar");
        return ;
    }


    //guardar
    ajaxBorraServidor(ipServidor,puertoServidor,r3);   


}//fin guardaervidor

