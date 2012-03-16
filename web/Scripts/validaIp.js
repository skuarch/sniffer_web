

function validaIp(ip) {

    var partes=ip.split('.');

    if (partes.length!=4) {

        alert('Error:\n-Direccion IP no valida');

        return false;

    }//fin if

    for (i=0;i<4;i++) {

        num=partes[i];

        if (num>255 || num<0 || num.length==0 || isNaN(num)){

            alert('Error:\n-Direccion IP no valida');

            return false;

        }//fin if

    }//fin for


    partes = null;
    return true;

}//fin function


