


function guardaServidor(ipServidor,puertoServidor){


    //control del cache
    var r1 = Math.random()*1000;
    var r2 = Math.random();
    var r3 = Math.round(r1+r2,2);


    //validando ip
    if( validaIp(ipServidor) != true ) {        
        return ;
    }

    //validando puerto
    if( validaPuerto(puertoServidor) != true ) {        
        return ;
    }


    //guardar
    ajaxGuardaServidor(ipServidor,puertoServidor,r3);


}//fin guardaervidor

