package com.quiz.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/user/*")
public class UserFilter extends HttpFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;

		HttpServletResponse resp = (HttpServletResponse) response;

		HttpSession session = req.getSession(false);
		if (session != null) {
			String role = (String) session.getAttribute("role");
			if (role != null && role.equals("USER")) {
				chain.doFilter(req, resp);
			} else {
				resp.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
			}
		} 
		else {
			resp.sendRedirect(req.getContextPath() + "/login.jsp");
		}
	}

}
