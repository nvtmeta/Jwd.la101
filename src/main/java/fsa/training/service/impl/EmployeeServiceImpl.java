package fsa.training.service.impl;

import fsa.training.dao.EmployeeDao;
import fsa.training.dao.impl.EmployeeDaoImpl;
import fsa.training.model.dto.EmployeeListDto;
import fsa.training.model.entity.Employee;
import fsa.training.service.EmployeeService;

import java.util.List;
import java.util.stream.Collectors;

public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeDao employeeDao = new EmployeeDaoImpl();

    @Override
    public List<EmployeeListDto> getAll(int page, int size) {
        List<Employee> employeeList = employeeDao.getAll(page, size);

        List<EmployeeListDto> employeesListDTOS = employeeList.stream().map(e -> {
                    return new EmployeeListDto(
                            e.getEmployeeId(), e.getFirstName(), e.getDateOfBirth(),
                            e.getAddress(), e.getPhone(), e.getDepartmentName());
                }
        ).collect(Collectors.toList());

        return employeesListDTOS;
    }

    @Override
    public long getTotalItem() {
        return employeeDao.getTotalItem();
    }

    @Override
    public Employee create(Employee employee) {
        System.out.println("employeeService = " + employee);
        return employeeDao.create(employee);
    }

    @Override
    public void update(Employee employee) {
        employeeDao.update(employee);
    }

    @Override
    public boolean delete(long id) {
        try {
            employeeDao.delete(id);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    @Override
    public Employee findById(long id) {
        return employeeDao.getById(id);
    }

    @Override
    public List<EmployeeListDto> search(String field, String value, int page, int size) {
        List<Employee> employeeList = employeeDao.searchByField(field, value, page, size);

        return employeeList.stream().map(e -> {
                    return new EmployeeListDto(
                            e.getEmployeeId(), e.getFirstName(), e.getDateOfBirth(),
                            e.getAddress(), e.getPhone(), e.getDepartmentName());
                }
        ).collect(Collectors.toList());
    }
}
