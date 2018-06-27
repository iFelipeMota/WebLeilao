package br.com.fatecpg.webleilao;

import java.util.ArrayList;

public class User {
    
    private long id;
    private String role;
    private String name;
    private String login;
    private long passwordHash;
    private double vl_saldo;

    public User(long id, String role, String name, String login, long passwordHash, double vl_saldo) {
        this.id = id;
        this.role = role;
        this.name = name;
        this.login = login;
        this.passwordHash = passwordHash;
        this.vl_saldo = vl_saldo;
    }

    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public long getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(long passwordHash) {
        this.passwordHash = passwordHash;
    }

    public double getVl_saldo() {
        return vl_saldo;
    }

    public void setVl_saldo(double vl_saldo) {
        this.vl_saldo = vl_saldo;
    }
    
    public static User getUser(String login, String pass) 
            throws Exception{
        
        String SQL = "SELECT * FROM usuario WHERE login = ? and passwordhash = ?";
        Object[] parameters = {login, pass.hashCode()};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        
        if (list.isEmpty()){
            return null;
        } else{
            Object[] row = list.get(0);
            User u = new User(
                    (long)row[0]
                    , (String)row[1]
                    , (String)row[2]
                    , (String)row[3]
                    , (long)row[4]
                    , (double)row[5]
            );
            return u;
        }
    }
    
    public static ArrayList<User> getUsers() 
            throws Exception{
        
        String SQL = "SELECT * FROM usuario";
        ArrayList<User> users = new ArrayList<>();
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, new Object[]{});
        
        for(int i=0;i<list.size();i++){
            
           Object row[] = list.get(i);
           User u = new User(
                  (long) row[0]
                  ,(String) row[1]
                  ,(String) row[2]
                  ,(String) row[3]
                  ,(long) row[4]
                  ,(double) row[5]
           );
           users.add(u);                
        }
        return users;
    }
    
    public static void addUser(String name, String role, String login, long passwordHash) 
            throws Exception{
        
        String SQL = "INSERT INTO usuario VALUES ("
                +"default"
                +", ?"
                +", ?"
                +", ?"
                +", ?"
                +", 0"
                +")";
        
        Object parameters[] = {role, name, login, passwordHash};
        
        DataBaseConnector.execute(SQL, parameters);
    }
    
    public static void removeUser(long id) 
            throws Exception{
        
        String SQL = "DELETE FROM usuario WHERE ID = ?";
                
        Object parameters[] = {id};
        
        DataBaseConnector.execute(SQL, parameters);
    }
    
}
