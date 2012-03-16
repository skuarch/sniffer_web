function openModalWindow(url, withh, height, withParameters, delimiter){

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    if(withParameters){
        //open modal window with parameters
        url = url + delimiter + getAllVariables();
        window.showModalDialog(url,a, "dialogwidth: "+withh+"px; dialogheight: "+height+"px; resizable: no");

    }else{

        window.showModalDialog(url,a, "dialogwidth: "+withh+"px; dialogheight: "+height+"px; resizable: no");

    }

} //end function
