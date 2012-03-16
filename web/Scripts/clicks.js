function clicks(){

    if(tiempoGrafica == "7 DIAS" || tiempoGrafica == "30 DIAS" || tiempoGrafica == "PERSONALIZADO"){
       alert("Las graficas clickeables solo son para\nHoy,ultima hora,ultimas 2 horas y ayer ");
       return ;
    }


    if(clic == true){

        clic = false;

    }else{

        clic = true;

    }


    handler();

}
