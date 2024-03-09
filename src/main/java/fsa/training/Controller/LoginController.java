package fsa.training.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginController", value = {"/login", "/login.html"})
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");

        if (account.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")) {
            req.getSession().setAttribute("account", account);
            System.out.println("Đăng nhập thành công");
            resp.sendRedirect(req.getContextPath() + "/employee");
        } else {
            System.out.println("Đăng nhập thất bại");
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
        }
    }
}
