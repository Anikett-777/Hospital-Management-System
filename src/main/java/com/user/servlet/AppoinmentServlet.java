package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppoinmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/add_appointment")
public class AppoinmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
			/*
			 * try { int userId = Integer.parseInt(req.getParameter("userId")); String
			 * fullname = req.getParameter("fullname"); String gender =
			 * req.getParameter("gender"); String age = req.getParameter("age"); String
			 * appoinDate = req.getParameter("app_date"); String email =
			 * req.getParameter("email"); String phNo = req.getParameter("phNo"); String
			 * diseases = req.getParameter("disease");
			 * 
			 * String docId = req.getParameter("doctorId"); if (docId == null ||
			 * docId.isEmpty()) { session.setAttribute("errorMsg",
			 * "Please select a doctor"); resp.sendRedirect("user_appointment.jsp"); return;
			 * }
			 * 
			 * int doctorId = Integer.parseInt(docId); String address =
			 * req.getParameter("address");
			 * 
			 * Appointment ap = new Appointment( userId, fullname, gender, age, appoinDate,
			 * email, phNo, diseases, doctorId, address, "pending" );
			 * 
			 * AppoinmentDao dao = new AppoinmentDao(DBConnect.getConn());
			 * 
			 * if (dao.addAppoinment(ap)) { session.setAttribute("succMsg",
			 * "Appointment booked successfully"); } else { session.setAttribute("errorMsg",
			 * "Something went wrong on server"); }
			 * 
			 * resp.sendRedirect("user_appointment.jsp");
			 * 
			 * } catch (NumberFormatException e) { e.printStackTrace();
			 * session.setAttribute("errorMsg", "Invalid input data");
			 * resp.sendRedirect("user_appointment.jsp");
			 * 
			 * } catch (Exception e) { e.printStackTrace(); session.setAttribute("errorMsg",
			 * "Server error occurred"); resp.sendRedirect("user_appointment.jsp"); }
			 */
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String fullname = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoinDate = req.getParameter("app_date");
		String email = req.getParameter("email");
		String phNo = req.getParameter("phNo");
		String diseases = req.getParameter("disease");
		int doctorId = Integer.parseInt(req.getParameter("doctorId"));
		String address = req.getParameter("address");
		
		Appointment ap = new Appointment(userId, fullname, gender, age, appoinDate, email, phNo, diseases, doctorId, address,"pending");
		AppoinmentDao dao = new AppoinmentDao(DBConnect.getConn());
		
		
		if(dao.addAppoinment(ap)) {
			session.setAttribute("succMsg", "Appointment Successfully");
			resp.sendRedirect("user_appointment.jsp");
		}else {
			session.setAttribute("errorMsg", "Something went Wrong on server");
			
			resp.sendRedirect("user_appointment.jsp");
		}
		 
		}
	}
	
