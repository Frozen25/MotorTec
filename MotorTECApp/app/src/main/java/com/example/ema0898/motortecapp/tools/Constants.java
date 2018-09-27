package com.example.ema0898.motortecapp.tools;

public class Constants {

    // Rutas del servidor para obtener diversas cosas
    private static final String ip = "http://192.168.43.154:3000";
    public static final String newCarsRoute = ip + "/coche/new";
    public static final String usedCarRoute = ip + "/coche/used";
    public static final String getCar = ip + "/coche";
    public static final String countryRoute = ip + "/location/country";
    public static final String provinceRoute = ip + "/location/province/";
    public static final String cantonRoute = ip + "/location/canton/";
    public static final String districtRoute = ip + "/location/district/";
    public static final String addClient = ip + "/customer/add";
    public static final String getConcessionaire = ip + "/coche/cs";
    public static final String addSell = ip + "/transaction/sell";
    public static final String addBuy = ip + "/transaction/buy";
    public static final String getCarByUser = ip + "/coche/usuario/";
    public static final String getClientById = ip + "/customer/get/";
    public static final String getMarca = ip + "/coche/marca";
    public static final String addCar = ip + "/coche/add";

    // keys para pasar informacion entre activities
    public static final String newCarBundleString = "car_id";

    public static final String registerBundleName = "client_name";
    public static final String registerBundleLastName = "client_lastname";
    public static final String registerBundlePhone = "client_phone";
    public static final String registerBundleID = "client_id";
    public static final String registerBundleEmail = "client_email";

    public static final String userCarCs = "cliente_cs";

    public static final String buyId = "car_buyId";

    // Llaves de búsqueda para los archivos de las shared preferences
    public static final String sharedPreferencesClientNameFile = "client_name";
    public static final String sharedPreferencesClientName = "client_name";
    public static final String sharedPreferencedCsName = "cs_name";

    // Llave para obtener el atributo Nombre del JSON
    public static final String countryNameKey = "Nombre";
    public static final String cantonNameKey = "Nombre";
    public static final String provinceNameKey = "Nombre";

    public static final String concessionaireNameKey = "Nombre";

    public static final String clientNameKey = "Nombre";
}
