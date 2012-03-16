function getAllVariables(){

    var variables = "unidadMedida=" + getUnidadMedida() +
        "&tipoGrafica=" + getTipoGrafica() +
        "&tiempoGrafica=" + getTiempoGrafica() +
        "&opcionGrafica=" + getOpcionGrafica() +
        "&fecha_inicial=" + getFecha_inicial() +
        "&fecha_final=" + getFecha_final() +
        "&clic=" + getClic() +
        "&user=" + getUser() +
        "&refrescar=" + getRefrescar() +
        "&nombreUnidadMedida2=" + getNombreUnidadMedida2() +
        "&refreshinterval=" + getRefreshInterval()+
        "&nombreUnidadMedida=" + getNombreUnidadMedida() +
        "&remoto=" + getRemoto() +
        "&ip_remoto=" + getIp_remoto() +
        "&ip_servidor=" + getIp_servidor() +
        "&puerto_server=" + getPuerto_server()+
        "&categoria=" + getCategoria();
    return variables;
}



