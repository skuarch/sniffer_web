

function validaLogin(){

    var usr = document.form.usuario;
    var pass = document.form.password;
    var error = "";

    if(usr.value == ""){

        error = error + "-El nombre de usuario es requerido\n";

    }

    if(pass.value == ""){

        error = error + "-El password es requerido\n";

    }

    if(error.length > 0){

        error = "Los siguientes errores han ocurrido\n" +error;

        alert(error);

    }else{

        document.form.submit();

    }


}
