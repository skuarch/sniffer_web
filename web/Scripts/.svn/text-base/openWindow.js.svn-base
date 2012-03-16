function openWindow(url, withh, height, withParameters, delimiter){

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    if(url == "level1Puerto.jsp?label=otros&" || url == "detalleIp.jsp?label=otros&" || url == "detalleNavegacionHttp.jsp?label=otros&" || url == "detalleNavegacionTcp.jsp?label=otros&"){
        return;
    }


    if(withParameters){
        
        //open window with parameters
        url = url + delimiter + getAllVariables();
        window.open(url, "_blank", "toolbar=no,menubar=no,directories=no,status=no,resizable=yes,location=no,scrollbars=yes,height="+height+",width="+withh);

    }else{

        window.open(url, "_blank", "toolbar=no,menubar=no,directories=no,status=no,resizable=yes,location=no,scrollbars=yes,height="+height+",width="+withh);               

    }

} //end function
