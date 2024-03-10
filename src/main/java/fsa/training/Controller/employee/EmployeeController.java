package fsa.training.Controller.employee;


import fsa.training.common.AppConstant;
import fsa.training.model.dto.EmployeeListDto;
import fsa.training.service.EmployeeService;
import fsa.training.service.impl.EmployeeServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeController", value = {"/employee", "/employee/list"})
public class EmployeeController extends HttpServlet {

    private final EmployeeService employeeService = new EmployeeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long totalItem = employeeService.getTotalItem();

        List<EmployeeListDto> employeeList = null;

        int page = AppConstant.DEFAULT_PAGE;
        long totalPage = 0L;
        if (totalItem > 0) {
            String pageStr = req.getParameter("page");
            String sizeStr = req.getParameter("size");

            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }

            int size = sizeStr != null ? Integer.parseInt(sizeStr) : AppConstant.DEFAULT_PAGE_SIZE;

            employeeList = employeeService.getAll(page, size);
            totalPage = totalItem <= size ? 1 : (long) Math.ceil((double) totalItem / size);

        }
        req.setAttribute("employeeList", employeeList);
        req.setAttribute("page", page);
        req.setAttribute("totalPage", totalPage);

        req.getRequestDispatcher("/WEB-INF/view/employee/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}


