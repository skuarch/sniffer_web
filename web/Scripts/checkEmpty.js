

function checkEmpty(obj){
    

    if(obj.value == "" || obj.value == '' || obj.value == undefined || obj.length < 0){
        return false;
    }

    return true;

}