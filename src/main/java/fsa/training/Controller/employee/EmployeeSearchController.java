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


@WebServlet(name = "EmployeeSearchController", value = {"/employee/search"})
public class EmployeeSearchController extends HttpServlet {
    private final EmployeeService employeeService = new EmployeeServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String searchField = req.getParameter("searchField");
        String searchContent = req.getParameter("searchContent");

        System.out.println("searchField = " + searchField);
        System.out.println("searchContent = " + searchContent);
//        super.doPost(req, resp);


        long totalItem = employeeService.getTotalItem();
        System.out.println("totalItem = " + totalItem);
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

            employeeList = employeeService.search(searchField, searchContent, page, size);
            totalPage = totalItem <= size ? 1 : (long) Math.ceil((double) totalItem / size);

        }

        System.out.println("employeeList = " + employeeList);
        req.setAttribute("employeeList", employeeList);
        req.setAttribute("page", page);
        req.setAttribute("totalEmployee", totalItem);
        req.setAttribute("totalPage", totalPage);
        req.getRequestDispatcher("/WEB-INF/view/employee/list.jsp").forward(req, resp);
    }
}
