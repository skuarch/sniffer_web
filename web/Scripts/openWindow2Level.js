function openWindow2Level(url, width, height, withParameters, delimiter){

    var names = getUrlVarsName();
    var string = "";

    for(i=0; i < names.length; i++){

        if(names[i] == "label"){
            continue;
        }
        
        if(i == names.length-1){
            string += names[i] +"=" +getUrlVars(names[i]);
            continue;
        }

        string += names[i] +"=" +getUrlVars(names[i])+delimiter;

    }

    //alert(string);

    if(withParameters){

        //open window with parameters
        url = url + delimiter + string;

        window.open(url, "_blank", "toolbar=no,menubar=no,directories=no,status=no,resizable=yes,location=no,scrollbars=yes,height="+height+",width="+width);

    }else{

        window.open(url, "_blank", "toolbar=no,menubar=no,directories=no,status=no,resizable=yes,location=no,scrollbars=yes,height="+height+",width="+width);

    }

    names = null;
    url = null;
    string = null;

} //end function



