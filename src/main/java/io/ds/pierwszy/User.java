//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package io.ds.pierwszy;

public class User {
    String name;
    String surname;
    String password;
    String login;

    String phone_number;

    String adress;

    public User(String name, String surname, String login, String password,String phone_number, String adress) {
        this.name = name;
        this.surname = surname;
        this.password = password;
        this.login = login;
        this.phone_number=phone_number;
        this.adress=adress;

    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone_number() {return phone_number;}
    public String getAdress() {return adress;}
    public void setName(String name) {this.name=name;}

    public void setSurname(String surname){this.surname=surname;}

    public void setPassword(String password){this.password=password;}

    public void setPhone_Number(String phone_number){this.phone_number=phone_number;}
    public void setAdress(String adress) {this.adress=adress;}

}
