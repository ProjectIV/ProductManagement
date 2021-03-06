/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletAdminSide.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Admin;
import utils.AdminDAO;
import utils.MyUtils;

@WebServlet(urlPatterns = {"/admin/login"})
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AdminLoginServlet() {
        super();
    }

    // Hiển thị trang Login.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward tới trang /WEB-INF/adminViews/loginView.jsp
        // (Người dùng không thể truy cập trực tiếp
        // vào các trang JSP đặt trong thư mục WEB-INF).
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/adminViews/loginView.jsp");

        dispatcher.forward(request, response);

    }

    // Khi người nhập username & password, và nhấn Submit.
    // Phương thức này sẽ được thực thi.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMeStr = request.getParameter("rememberMe");
        boolean remember = "Y".equals(rememberMeStr);

        Admin admin = null;
        boolean hasError = false;
        String errorString = null;

        if (username == null || password == null || username.length() == 0 || password.length() == 0) {
            hasError = true;
            errorString = "Required username and password!";
        } else {
            Connection conn = MyUtils.getStoredConnection(request);
            try {
                // Tìm admin trong DB.
                admin = AdminDAO.findAdmin(conn, username, password);

                if (admin == null) {
                    hasError = true;
                    errorString = "Username or password invalid";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }
        // Trong trường hợp có lỗi,
        // forward (chuyển hướng) tới /WEB-INF/adminViews/login.jsp
        if (hasError) {
            admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);

            // Lưu các thông tin vào request attribute trước khi forward.
            request.setAttribute("errorString", errorString);
            request.setAttribute("admin", admin);

            // Forward (Chuyển tiếp) tới trang /WEB-INF/adminViews/login.jsp
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/adminViews/loginView.jsp");

            dispatcher.forward(request, response);
        } // Trường hợp không có lỗi.
        // Lưu thông tin người dùng vào Session.
        // Và chuyển hướng sang trang adminInfo.
        else {
            HttpSession session = request.getSession();
            MyUtils.storeLoginedAdmin(session, admin);

            // Nếu người dùng chọn tính năng "Remember me".
            if (remember) {
                MyUtils.storeAdminCookie(response, admin);
            } // Ngược lại xóa Cookie
            else {
                MyUtils.deleteAdminCookie(response);
            }

            // Redirect (Chuyển hướng) sang trang /adminInfo.
            response.sendRedirect(request.getContextPath() + "/admin/home");
        }
    }

}
