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

    public User(String name, String surname, String login, String password) {
        this.name = name;
        this.surname = surname;
        this.password = password;
        this.login = login;
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


    public void setName(String name) {this.name=name;}

    public void setSurname(String surname){this.surname=surname;}

    public void setPassword(String password){this.password=password;}

}
