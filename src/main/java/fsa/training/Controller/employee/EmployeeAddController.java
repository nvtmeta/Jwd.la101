package fsa.training.Controller.employee;


import fsa.training.model.entity.Account;
import fsa.training.model.entity.Employee;
import fsa.training.service.EmployeeService;
import fsa.training.service.impl.EmployeeServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;

@WebServlet(name = "EmployeeAddController", value = {"/employee/add"})
public class EmployeeAddController extends HttpServlet {

    private final EmployeeService employeeService = new EmployeeServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phone = req.getParameter("phoneNumber");
        LocalDate dateOfBirth = LocalDate.parse(req.getParameter("dateOfBirth"));
        int gender = Integer.parseInt(req.getParameter("gender"));
        String address = req.getParameter("address");
        int status = Integer.parseInt(req.getParameter("status"));
        String department = req.getParameter("departmentName");
        String remark = req.getParameter("remark");
        String account = req.getParameter("account");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println("firstName = " + firstName);
        System.out.println("lastName = " + lastName);
        System.out.println("phone = " + phone);
        System.out.println("dateOfBirth = " + dateOfBirth);
        System.out.println("gender = " + gender);
        System.out.println("address = " + address);
        System.out.println("status = " + status);
        System.out.println("department = " + department);
        System.out.println("remark = " + remark);
        System.out.println("account = " + account);
        System.out.println("email = " + email);
        System.out.println("password = " + password);

        Account account1 = Account.builder()
                .account(account)
                .email(email)
                .password(password)
                .status(status)
                .build();

        Employee employee = Employee.builder()
                .firstName(firstName)
                .lastName(lastName)
                .phone(phone)
                .dateOfBirth(dateOfBirth)
                .gender(gender)
                .address(address)
                .remark(remark)
                .departmentName(department)
                .account(account1)
                .build();


//        password must have at least 6 characters, include at least one uppercase letter, one lowercase letter, and  number
        if (password.length() < 6 || !password.matches(".*[A-Z].*") || !password.matches(".*[a-z].*") || !password.matches(".*\\d.*")) {
            String message = "Password must have at least 6 characters, include at least one uppercase letter, one lowercase letter, and  number";
            resp.sendRedirect(req.getContextPath() + "/employee/add?message=" + URLEncoder.encode(message, "UTF-8"));
            return;
        }

//        TODO:validation account , password
        account1.setEmployee(employee);

        employeeService.create(employee);
// Back to screen of Employee
//list and display the message
//"Add employee successfully".

        String message = "Add employee successfully";
        resp.sendRedirect(req.getContextPath() + "/employee/list?message=" + URLEncoder.encode(message, "UTF-8"));

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get add employee");
        req.getRequestDispatcher("/WEB-INF/view/employee/add.jsp").forward(req, resp);
    }
}
