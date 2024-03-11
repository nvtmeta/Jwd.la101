package fsa.training.Controller.employee;

import fsa.training.model.entity.Employee;
import fsa.training.service.EmployeeService;
import fsa.training.service.impl.EmployeeServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EmployeeController", value = {"/employee/detail"})
public class EmployeeDetailController extends HttpServlet {

    private final EmployeeService employeeService = new EmployeeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        System.out.println("id = " + id);
        Employee employee = employeeService.findById(Long.parseLong(id));
        System.out.println("employee = " + employee);
        req.setAttribute("employee", employee);

        req.getRequestDispatcher("/WEB-INF/view/employee/detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
