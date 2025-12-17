package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_login")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
            // 1. Get parameters from the login form
            String em = req.getParameter("email");
            String ps = req.getParameter("password");
            
            // 2. Obtain the session object
            HttpSession session = req.getSession();
            
            // 3. Initialize DAO and check credentials
            UserDao dao = new UserDao(DBConnect.getConn());
            User user = dao.login(em, ps);
            
            if (user != null) {
                // Success: Store user object in session and go to home page
                session.setAttribute("userObj", user);
                resp.sendRedirect("index.jsp");
            } else {
                // Failure: Store error message and return to login page
                session.setAttribute("errorMsg", "Invalid Email & Password");
                resp.sendRedirect("user_login.jsp");
            }
            
        } catch (Exception e) {
            // 4. Proper error handling
            e.printStackTrace();
        }
		
	}
}

