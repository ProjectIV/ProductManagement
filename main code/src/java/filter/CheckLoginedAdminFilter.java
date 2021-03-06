/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import beans.Admin;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.MyUtils;

/**
 *
 * @author Hung
 */
@WebFilter(filterName = "checkLoginedAdminFilter", urlPatterns = {"/admin/*"})
public class CheckLoginedAdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        String servletPath = req.getServletPath();
        if (!servletPath.equals("/admin/login") 
                && !servletPath.equals("/admin/logout")
                && !servletPath.contains("resources")
                && !servletPath.contains("images")) {    
            // Kiểm tra người dùng đã đăng nhập (login) chưa.
//            String checked = (String)session.getAttribute("COOKIE_CHECKED");
//            if(checked== null || !checked.equals("CHECKED")){
            Admin adminLogined = MyUtils.getLoginedAdmin(session);
            String loginedAdmin = MyUtils.getAdminCookie(req);
            // Nếu chưa đăng nhập (login).
            if (adminLogined == null && loginedAdmin == null) {
                // Redirect (Chuyển hướng) tới trang login.
                res.sendRedirect(req.getContextPath() + "/admin/login");
                return;
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }

}
