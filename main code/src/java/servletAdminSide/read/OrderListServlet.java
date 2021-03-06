/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletAdminSide.read;

/**
 *
 * @author Hung
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Order;
import beans.User;
import java.util.ArrayList;
import utils.OrderDAO;
import utils.MyUtils;
import utils.UserDAO;

@WebServlet(urlPatterns = {"/admin/orderList"})
public class OrderListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public OrderListServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = MyUtils.getStoredConnection(request);

        String errorString = null;
        List<Order> list = new ArrayList<Order>();
        String sortBy = (request.getParameter("sortBy") != null) ? request.getParameter("sortBy") : "idDESC";
        try {
            String userName = request.getParameter("search");
            String id = request.getParameter("id");
            int orderId = Integer.MAX_VALUE;
            orderId = (id != null) ? Integer.parseInt(id) : orderId;

            int rowInTable = 0;
            int rowInPage = 2;
            int pageQuantity = 1;
            int pageNum = (request.getParameter("page") != null)
                    ? Integer.parseInt(request.getParameter("page"))
                    : 1;
            pageNum = (pageNum < 1) ? 1 : pageNum;

            String ordinal = (sortBy.contains("ASC")) ? "ASC" : "DESC";
            String abridgedSortBy = sortBy.substring(0, sortBy.lastIndexOf(ordinal));
            if(abridgedSortBy.equals("product_id")
                || abridgedSortBy.equals("purchased_quantity")
                || abridgedSortBy.equals("status")){
                abridgedSortBy = "id";
                ordinal ="DESC";
            }

            if (orderId != Integer.MAX_VALUE) {
                list.add(OrderDAO.findOrder(conn, orderId));
            } else if (userName != null) {
                User user = UserDAO.findUserByName(conn, userName);
                if (user != null) {
                    list = OrderDAO.findOrderByUserId(conn, user.getId());
                }
            } else {
                rowInTable = OrderDAO.countRows(conn);
                pageQuantity = (rowInTable % rowInPage == 0) ? rowInTable / rowInPage : rowInTable / rowInPage + 1;
                pageNum = (pageNum > pageQuantity) ? pageQuantity : pageNum;
                int offset = (pageNum - 1) * rowInPage;
                list = OrderDAO.queryOrder(conn, offset, rowInPage, abridgedSortBy, ordinal);

                request.setAttribute("pageQuantity", pageQuantity);
                request.setAttribute("page", pageNum);
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        } finally {
            // Lưu thông tin vào request attribute trước khi forward sang views.
            request.setAttribute("errorString", errorString);
            request.setAttribute("orderList", list);
            request.setAttribute("sortBy", sortBy);

            // Forward sang /WEB-INF/adminViews/orderListView.jsp
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/adminViews/CRUD/read/orderListView.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
