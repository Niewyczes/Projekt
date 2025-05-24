package io.ds.pierwszy;
import java.util.ArrayList;
import java.util.List;
public class UserList {
    private static final List<User> users = new ArrayList<>();
    public static boolean addUser(User user){
        if (getUser(user.getLogin())!=null){
            return false;
        }
        users.add(user);
        return true;
    }
    public static User getUser(String login){
        for( User user:users){
            if(user.getLogin().equals(login)){
                return user;

            }

        }
        return null;
    }
    public static boolean exists(String login){
        return getUser(login) != null;
    }

}
