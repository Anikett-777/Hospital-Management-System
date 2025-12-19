package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/doctor_login")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
            // 1. Get parameters from the login form
            String em = req.getParameter("email");
            String ps = req.getParameter("password");
            
            // 2. Obtain the session object
            HttpSession session = req.getSession();
            
            // 3. Initialize DAO and check credentials
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
           Doctor doctor = dao.Login(em, ps);
            
            if (doctor != null) {
                // Success: Store user object in session and go to home page
                session.setAttribute("doctObj", doctor);
                resp.sendRedirect("doctor/index.jsp");
            } else {
                // Failure: Store error message and return to login page
                session.setAttribute("errorMsg", "Invalid Email & Password");
                resp.sendRedirect("doctor_login.jsp");
            }
            
        } catch (Exception e) {
            // 4. Proper error handling
            e.printStackTrace();
        }
		
	}

}
