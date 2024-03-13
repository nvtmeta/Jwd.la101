package fsa.training.Controller;

import fsa.training.service.LoginService;
import fsa.training.service.impl.LoginServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginController", value = {"/login", "/login.html"})
public class LoginController extends HttpServlet {

    private final LoginService employeeService = new LoginServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println("username = " + username + ", password = " + password);

//        check user exist on database

        if (employeeService.checkLogin(username, password)) {
            req.getSession().setAttribute("account", username);
            System.out.println("Đăng nhập thành công");
            resp.sendRedirect(req.getContextPath() + "/employee/list");
        } else {
            System.out.println("Đăng nhập thất bại");
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
        }
    }
}
