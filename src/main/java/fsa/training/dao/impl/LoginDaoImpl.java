package fsa.training.dao.impl;

import fsa.training.dao.LoginDao;
import fsa.training.model.entity.Account;
import fsa.training.utils.HibernateUtils;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class LoginDaoImpl implements LoginDao {
    @Override
    public boolean checkLogin(String username, String password) {
//        check user exist on database
        try (Session session = HibernateUtils.getSession()) {
            Query<Account> query = session.createQuery("from Account a where a.account = :account and a.password = :password", Account.class)
                    .setParameter("account", username)
                    .setParameter("password", password);

            try {
                Account accountEntity = query.getSingleResult();
                return accountEntity != null;
            } catch (NoResultException ex) {
                return false;
            }

        }
    }
}
