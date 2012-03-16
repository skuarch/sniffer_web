

function changeCollector(c){

    if(c == 0){        
        setTipoGrafica("RECOLECTORES");
        handler();
    }

    jGrowMessages('<b>Cambiando recolector</b> <br> '+ c );
    setIpRemoto(c);
    c = null;
    
}