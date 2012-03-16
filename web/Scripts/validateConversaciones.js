
function validateConversaciones(){

    //check   

    if(opcionGrafica == "GLOBAL" || opcionGrafica == "UDP" ) {
        alert("En CONVERSACIONES no existe "+opcionGrafica+" la opcion se cambiara a TCP");
        setOpcionGrafica("TCP");
        $("#selectOptions").val("TCP");
    }

    

}