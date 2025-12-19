<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/allcss.jsp"%>
</head>
<style>
.appointment-list-section {
	background: #f4f8fb;
}

.appointment-table-card {
	border-radius: 14px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
	border: none;
}

.appointment-table thead th {
	font-weight: 600;
	color: #198754;
	border-bottom: 2px solid #e9ecef;
}

.appointment-table tbody tr {
	transition: all 0.2s ease;
}

.appointment-table tbody tr:hover {
	background-color: #f1fdf6;
}

.status-ok {
	background-color: #198754;
	padding: 6px 12px;
	border-radius: 20px;
	font-weight: 500;
}

.status-pending {
	background-color: #ffc107;
	color: #000;
	padding: 6px 12px;
	border-radius: 20px;
	font-weight: 500;
}

.doctor-img {
	max-height: 420px;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<section class="appointment-list-section py-5">
		<div class="container">
			<div class="row align-items-center">

				<!-- LEFT: APPOINTMENT TABLE -->
				<div class="col-lg-8">
					<div class="card appointment-table-card p-4">
						<h4 class="text-center mb-4 text-success fw-semibold">
							Appointment List</h4>

						<div class="table-responsive">
							<table class="table align-middle appointment-table">
								<thead>
									<tr>
										<th>Full Name</th>
										<th>Gender</th>
										<th>Age</th>
										<th>Appoint Date</th>
										<th>Diseases</th>
										<th>Doctor Name</th>
										<th>Status</th>
									</tr>
								</thead>

								<tbody>
								<%
								User user =(User)session.getAttribute("userObj");
								AppoinmentDao dao = new AppoinmentDao(DBConnect.getConn());
								List<Appointment>list=dao.getAllAppointmentByLoginUser(user.getId());
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								for (Appointment ap : list)
								
								{
									Doctor d=dao2.getDoctorById(ap.getDoctorId());
								%>
									<tr>
										<td class="fw-semibold"><%=ap.getFullName()%></td>
										<td><%=ap.getGender()%></td>
										<td><%=ap.getAge()%></td>
										<td><%=ap.getAppoinDate()%></td>
										<td><%=ap.getDiseases()%></td>
										<td><%=ap.getFullName()%></td>
										<td><span class="badge status-ok">
										<% if("Pending".equals(ap.getStatus())){%>
											<a href="#"  class="btn btn-sm btn-warning">Pending</a>
											
										<%}else{%>
											<a href="#"  class="btn btn-sm btn-success">Done</a>
											<%}
											%>
										
										</span></td>
									</tr>			
									
								<%}
								
								%>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>                       

				<!-- RIGHT: DOCTOR IMAGE -->
				<div class="col-lg-4 d-none d-lg-block text-center">
					<img src="images/img04.jfif" class="img-fluid doctor-img"
						alt="Doctor">
				</div>

			</div>
		</div>
	</section>
</body>
</html>