package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/admin_register")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String em = req.getParameter("email");
			String ps = req.getParameter("password");
			HttpSession session = req.getSession();
			
			
			if("admin@gmail.com".equals(em) && "admin".equals(ps)) {
				session.setAttribute("adminObj", new User());
				resp.sendRedirect("admin/index.jsp");
			}else {
				session.setAttribute("errorMsg","Invalid Email & Password");
				resp.sendRedirect("admin_login.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
