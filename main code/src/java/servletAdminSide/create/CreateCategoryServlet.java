/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletAdminSide.create;

/**
 *
 * @author Hung
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Category;
import utils.CategoryDAO;
import utils.MyUtils;

@WebServlet(urlPatterns = {"/admin/createCategory"})
public class CreateCategoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CreateCategoryServlet() {
        super();
    }

    // Hiển thị trang tạo sản phẩm.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/adminViews/CRUD/create/createCategoryView.jsp");
        dispatcher.forward(request, response);
    }

    // Khi người dùng nhập các thông tin sản phẩm, và nhấn Submit.
    // Phương thức này sẽ được gọi.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
        String errorString = null;
        Category category = null;
        try {
            int id = 0;
            String name = (String) request.getParameter("name");
            String description = request.getParameter("description");

            category = new Category(id, name, description, false);

            if (errorString == null) {
                CategoryDAO.insertCategory(conn, category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        } finally {
            // Lưu thông tin vào request attribute trước khi forward sang views.
            request.setAttribute("errorString", errorString);
            request.setAttribute("category", category);

            // Nếu có lỗi forward (chuyển tiếp) sang trang 'edit'.
            if (errorString != null) {
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/WEB-INF/adminViews/CRUD/create/createCategoryView.jsp");
                dispatcher.forward(request, response);
            } // Nếu mọi thứ tốt đẹp.
            // Redirect (chuyển hướng) sang trang danh sách sản phẩm.
            else {
                response.sendRedirect(request.getContextPath() + "/admin/categoryList");
            }
        }
    }

}
