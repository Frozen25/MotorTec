package com.example.ema0898.motortecapp.tools;

public class Constants {

    private static final String ip = "http://192.168.0.27:3000";
    public static final String newCarsRoute = ip + "/coche/new";
    public static final String usedCarRoute = ip + "/coche/used";
    public static final String countryRoute = ip + "/location/country";
    public static final String provinceRoute = ip + "/location/province/";
    public static final String cantonRoute = ip + "/location/canton/";
    public static final String districtRoute = ip + "/location/district/";
    public static final String addClient = ip + "/customer/add";

    public static final String newCarBundleString = "car_id";
    public static final String registerBundleName = "client_name";
    public static final String registerBundleLastName = "client_lastname";
    public static final String registerBundleID = "client_id";
    public static final String registerBundlePhone = "client_phone";

    public static final String sharedPreferencesClientNameFile = "client_name";
    public static final String sharedPreferencesClientName = "client_name";

    public static final String countryNameKey = "Nombre";
    public static final String provinceNameKey = "Nombre";
    public static final String cantonNameKey = "Nombre";
}
