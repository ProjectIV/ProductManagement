/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletAdminSide.delete;

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
 
import utils.OrderDAO;
import utils.MyUtils;
import utils.OrderDetailDAO;
 
@WebServlet(urlPatterns = {"/admin/deleteOrder" })
public class DeleteOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public DeleteOrderServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
 
        int idOrder = (request.getParameter("idOrder") != null) 
                ? Integer.parseInt(request.getParameter("idOrder"))
                : 0;
        String deleteDetail = request.getParameter("orderDetail");
        String errorString = null;
 
        try {
            OrderDetailDAO.deleteOrderDetailByOrderId(conn, idOrder);
            OrderDAO.deleteOrder(conn, idOrder);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        } 
         
        // Nếu có lỗi, forward (chuyển tiếp) sang trang thông báo lỗi.
        if (errorString != null) {
            // Lưu thông tin vào request attribute trước khi forward sang views.
            request.setAttribute("errorString", errorString);
            // 
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/adminViews/CRUD/delete/deleteOrderErrorView.jsp");
            dispatcher.forward(request, response);
        }
        // Nếu mọi thứ tốt đẹp.
        // Redirect (chuyển hướng) sang trang danh sách sản phẩm.
        else {
            response.sendRedirect(request.getContextPath() + "/admin/orderList");
        }
 
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
}
