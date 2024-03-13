package fsa.training.dao;

public interface LoginDao {
//    check user exist on database

    boolean checkLogin(String username, String password);
}
