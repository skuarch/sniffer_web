function changeUnid(u){    

    switch(u){

        case "Bytes":
            setUnidadMedida(1);
            setNombreUnidadMedida2("Bits");
            break;
        case "KiloBytes": 
            setUnidadMedida(1000);
            setNombreUnidadMedida2("KiloBits");
            break;
        case "MegaBytes": 
            setUnidadMedida(1000000);
            setNombreUnidadMedida2("MegaBits");
            break;
        case "GigaBytes": 
            setUnidadMedida(1000000000);
            setNombreUnidadMedida2("GigaBits");
            break;

    }

}
