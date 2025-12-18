<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.dao.DoctorDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../components/allcss.jsp"%>
<style>
.hospital-card {
	border: none;
	border-radius: 16px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
}

.form-control, .form-select {
	border-radius: 10px;
}

.btn-primary {
	background: linear-gradient(135deg, #0ea5e9, #0369a1);
	border: none;
}

.table th {
	color: #0369a1;
	font-weight: 600;
}
</style>
<body>
	<%@include file="admin_navbar.jsp"%>

	<div class="container-fluid py-4">
		<div class="row g-4">
			<!-- DOCTOR TABLE -->
			<div class="col-md-12">
				<div class="card hospital-card p-4">
					<h4 class="text-center mb-4">Doctor Details</h4>

					<c:if test="${not empty errorMsg }">
						<p class="tecxt-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"></c:remove>
					</c:if>


					<c:if test="${not empty succMsg }">
						<p class="tecxt-center text-success fs-5">${succMsg}</p>
						<c:remove var="succMsg" scope="session"></c:remove>
					</c:if>


					<div class="table-responsive">
						<table class="table align-middle">
							<thead>
								<tr>
									<th>Full Name</th>
									<th>DOB</th>
									<th>Qualification</th>
									<th>Specialist</th>
									<th>Email</th>
									<th>Mob No</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Doctor> list2 = dao2.getAllDoctor();
								for (Doctor d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQuali()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>s
									<td><%=d.getMobNo()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-primary">Edit</a>
										 <a href="../delete_doctor?id=<%=d.getId() %>"
										class="btn btn-sm btn-primary">Delete</a></td>


								</tr
							<%}%>
								>
							</tbody>
						</table>
					</div>

				</div>
			</div>

		</div>
	</div>
</body>
</html>