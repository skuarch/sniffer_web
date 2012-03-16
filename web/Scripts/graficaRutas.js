
function graficaRutas(tipoG){

    var r = null;

    switch(tipoG){

        case 'VOLUMEN':
            r = "chartVolumen.jsp";
            break;

        case 'PUERTOS':
            r = "chartPuertos.jsp";
            break;

        case 'SEGMENTOS':
            r = "chartSegmentos.jsp";
            break;

        case 'CONEXIONES':
            r = "chartConexiones.jsp";
            break;

        case 'NAVEGACION':
            r = "chartNavegacion.jsp";
            break;

        case 'IPS':
            r = "chartIps.jsp";
            break;

        case 'RENDIMIENTO':
            r = "chartRendimiento.jsp";
            break;

        case 'CONVERSACIONES':
            r = "chartConversaciones.jsp";
            break;

        case 'SERVIDORES':
            r = "chartServidores.jsp";
            break;

        case 'INDICADORES':
            r = "chartIndicadores.jsp";
            break;

        case 'APLICACIONES':
            r = "chartAplicaciones.jsp";
            break;

        case 'RECOLECTORES':
            r = "tableCollectors.jsp";
            break;

        case 'ALARMAS':
            r = "chartAlarms.jsp";            
            break;

        case 'E2E':
            r = "e2e1.jsp";
            break;

        case 'FILTRADO':
            r = "filter.jsp";
            break;

        case 'MUESTRA_FILTRADO':
            r = "showFilter.jsp";
            break;

        case 'BLOQUEO HOST':
            r = "blockHost.jsp";
            break;

    }

    return r;

}
