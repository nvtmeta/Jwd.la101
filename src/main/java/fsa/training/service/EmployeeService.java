package fsa.training.service;

import fsa.training.model.dto.EmployeeListDto;
import fsa.training.model.entity.Employee;

import java.util.List;

public interface EmployeeService {

    public List<EmployeeListDto> getAll(int page, int size);

    public long getTotalItem();

    public Employee create(Employee employee);

    public void update(Employee employee);

    public boolean delete(long id);

    public Employee findById(long id);
}
