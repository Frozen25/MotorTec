package com.example.ema0898.motortecapp.models;

/**
 * Clase encargada de servid como modelo para parsear el JSON con la biblioteca GSON
 * los atributos deben tener el mismo nombre que los atributos del JSON
 * se utiliza para parsear la informacion de los distritos
 */
public class DistrictModel {

    private String Nombre;
    private int idDistrito;

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public int getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(int idDistrito) {
        this.idDistrito = idDistrito;
    }
}
