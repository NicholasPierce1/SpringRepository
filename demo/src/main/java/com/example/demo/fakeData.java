package com.example.demo;

public class fakeData{
    public static String name = "Matthew Berry";
    public static int number = 0;
    private String fName = "";
    private String age = "";

    //Chase
    private String firstName = "";
    private String lastName = "";
    private String animal = "";

    public fakeData(String fName, String age){
        this.fName = fName;
        this.age = age;
    }

    //Chase
    public favoriteAnimal(String firstName, String lastName, String animal){
        this.firstName = firstName;
        this.lastName = lastName;
        this.animal = animal;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }


    //Chase
    //Getters
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getAnimal() { return animal; }

    //Setters
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public void setAnimal(String animal) { this.animal = animal; }
}
