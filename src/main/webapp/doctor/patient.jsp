<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.Appointment"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@page import="com.db.DBConnect"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patien Page</title>
<%@include file="../components/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="doctor_navbar.jsp"%>

	<section class="appointment-list-section py-5">
		<div class="container">
			<div class="row align-items-center">

				<!-- LEFT: APPOINTMENT TABLE -->
				<div class="col-lg-12">
					<div class="card appointment-table-card p-4">
						<h4 class="text-center mb-4 text-success fw-semibold">
							Patient List</h4>

						<c:if test="${not empty succMsg }">
							<p class="tecxt-center text-success fs-5">${succMsg}</p>
							<c:remove var="succMsg" scope="session"></c:remove>
						</c:if>

						<!--If Data not Inserted  -->
						<c:if test="${not empty errorMsg }">
							<p class="tecxt-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"></c:remove>
						</c:if>

						<div class="table-responsive">
							<table class="table align-middle appointment-table">
								<thead>
									<tr>
										<th>Full Name</th>
										<th>Gender</th>
										<th>Age</th>
										<th>Appoint Date</th>
										<th>Email</th>
										<th>Phone No</th>
										<th>Disease</th>
										<th>Status</th>
									</tr>
								</thead>

								<tbody>
									<%
									Doctor d = (Doctor) session.getAttribute("doctObj");
									AppoinmentDao dao = new AppoinmentDao(DBConnect.getConn());
									List<Appointment> list = dao.getAllAppointmentByDoctor(d.getId());
									for (Appointment ap : list) {
									%>
									<tr>
										<td class="fw-semibold"><%=ap.getFullName()%></td>
										<td><%=ap.getGender()%></td>
										<td><%=ap.getAge()%></td>
										<td><%=ap.getAppoinDate()%></td>
										<td><%=ap.getEmail()%></td>
										<td><%=ap.getPhNo()%></td>
										<td><%=ap.getDiseases()%></td>
										<td><%=ap.getStatus()%></td>
										<td>
										<%if("pending".endsWith(ap.getStatus()))
										{%>
											<a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">Comment</a>
											
										<%}else{%>
											<a href="#" class="btn btn-success btn-sm disabled">Comment</a> 
										<%}
											%>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>