package com.example.ema0898.motortecapp.models;

/**
 * Clase encargada de servid como modelo para parsear el JSON con la biblioteca GSON
 * los atributos deben tener el mismo nombre que los atributos del JSON
 * se utiliza para parsear la informacion de la lista de autos
 */
public class CarModel {

    private int idCoche;
    private String Matricula;
    private String Modelo;
    private String Color;
    private int Estado;
    private String Image;
    private int Kilometraje;
    private String Marca;

    public int getIdCoche() {
        return idCoche;
    }

    public void setIdCoche(int idCoche) {
        this.idCoche = idCoche;
    }

    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String matricula) {
        Matricula = matricula;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String modelo) {
        Modelo = modelo;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String color) {
        Color = color;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int estado) {
        Estado = estado;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public int getKilometraje() {
        return Kilometraje;
    }

    public void setKilometraje(int kilometraje) {
        this.Kilometraje = kilometraje;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String marca) {
        Marca = marca;
    }
}
