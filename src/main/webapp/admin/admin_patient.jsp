<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@ page import="java.util.*"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.Appointment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp"%>
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
</style>
<body>
	<%@include file="admin_navbar.jsp"%>

	<div class="col-lg-12">
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
							<th>Email</th>
							<th>Mob No</th>
							<th>Diseases</th>
							<th>Doctor Name</th>
							<th>Address</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						AppoinmentDao dao = new AppoinmentDao(DBConnect.getConn());
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
						%>

						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress()%></td>
							<td><%=ap.getStatus()%></td>
						</tr>
						<%
						}
						%>


					</tbody>

				</table>
			</div>
		</div>
	</div>
</body>
</html>