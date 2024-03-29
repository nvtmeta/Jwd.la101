package fsa.training.dao.impl;

import fsa.training.dao.EmployeeDao;
import fsa.training.model.entity.Employee;
import fsa.training.utils.HibernateUtils;
import jakarta.persistence.criteria.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {
    @Override
    public List<Employee> getAll(int page, int size) {
        try (Session session = HibernateUtils.getSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Employee> query = builder.createQuery(Employee.class);
            Root<Employee> root = query.from(Employee.class);
            query.select(root);

            return session.createQuery(query)
                    .setMaxResults(size)
                    .setFirstResult(size * (page - 1))
                    .getResultList();
        }
    }

    @Override
    public long getTotalItem() {
        try (Session session = HibernateUtils.getSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Long> query = builder.createQuery(Long.class);
            Root<Employee> root = query.from(Employee.class);
            query.select(builder.count(root));

            return session.createQuery(query).getSingleResult();
        }
    }

    @Override
    public Employee create(Employee employee) {
        System.out.println("employeeDao = " + employee);

        try (Session session = HibernateUtils.getSession()) {
            Transaction transaction = session.beginTransaction();
            session.persist(employee);
            transaction.commit();
            return employee;
        }

    }

    @Override
    public void update(Employee employee) {
        try (Session session = HibernateUtils.getSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(employee);
            transaction.commit();
        }
    }

    @Override
    public void delete(long id) {
        try (Session session = HibernateUtils.getSession()) {
            Employee employee = session.find(Employee.class, id);

            if (employee == null) {
                throw new IllegalArgumentException("Can not find employee with id: " + id);
            }

            Transaction transaction = session.beginTransaction();
            session.remove(employee);
            transaction.commit();

        }
    }

    @Override
    public Employee getById(long id) {
        try (Session session = HibernateUtils.getSession()) {
            return session.get(Employee.class, id);
        }
    }

    @Override
    public List<Employee> searchByField(String fieldName, String fieldValue, int page, int size) {
        try (Session session = HibernateUtils.getSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Employee> query = builder.createQuery(Employee.class);
            Root<Employee> root = query.from(Employee.class);

            // Use a case-insensitive comparison for the field name
            Expression<String> expression = builder.lower(root.get(fieldName));
            Predicate predicate = builder.equal(expression, fieldValue);

//                        Join<Employee, Account> accountJoin = root.join("account");
//
//            // Use a case-insensitive comparison for the field name
//            Expression<String> expression = builder.lower(accountJoin.get(fieldName));

            query.select(root).where(predicate);

            return session.createQuery(query)
                    .setMaxResults(size)
                    .setFirstResult(size * (page - 1))
                    .getResultList();
        }
    }
}
