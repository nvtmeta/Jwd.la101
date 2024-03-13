package fsa.training.service.impl;

import fsa.training.dao.LoginDao;
import fsa.training.dao.impl.LoginDaoImpl;
import fsa.training.service.LoginService;

public class LoginServiceImpl implements LoginService {

   private final LoginDao loginDao = new LoginDaoImpl();
    @Override
    public boolean checkLogin(String username, String password) {
       return loginDao.checkLogin(username, password);
    }
}
