

function changeOption(o){
    
    jGrowMessages('<b>Cambiando opcion</b> <br> '+ o);
    setOpcionGrafica(o);



    //check
    if(tipoGrafica=="CONVERSACIONES"){

        if(opcionGrafica == "GLOBAL" || opcionGrafica == "UDP" ) {
            alert("En CONVERSACIONES no existe "+opcionGrafica+" la opcion se cambiara a TCP");
            setOpcionGrafica("TCP");
            $("#selectOptions").val("TCP");
        }

    }


    if(tipoGrafica=="NAVEGACION"){

        if(opcionGrafica == "GLOBAL" || opcionGrafica == "UDP" || opcionGrafica == "PAM") {
            alert("En NAVEGACION no existe "+opcionGrafica+" la opcion se cambiara a HTTP");
            setOpcionGrafica("TCP");
            $("#selectOptions").val("HTTP");
        }

    }

    
    changeStatus();
    
}


