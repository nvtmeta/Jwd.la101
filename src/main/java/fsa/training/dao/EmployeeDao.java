package fsa.training.dao;

import fsa.training.model.entity.Employee;

import java.util.List;

public interface EmployeeDao {
    public List<Employee> getAll(int page, int size);

    long getTotalItem();

    Employee create(Employee employee);

    void update(Employee employee);

    void delete(long id);

    Employee getById(long id);

    //    search by field name
    List<Employee> searchByField(String fieldName, String fieldValue, int page, int size);
}
