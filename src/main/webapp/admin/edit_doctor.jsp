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

			<!-- ADD DOCTOR FORM -->
			<div class="col-lg-4 offset-md-4">
				<div class="card hospital-card p-4">
					<h4 class="text-center mb-4">Edit Doctor Details</h4>

					<!--If Data not Inserted  -->
					<c:if test="${not empty errorMsg }">
						<p class="tecxt-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"></c:remove>
					</c:if>


					<c:if test="${not empty succMsg }">
						<p class="tecxt-center text-success fs-5">${succMsg}</p>
						<c:remove var="succMsg" scope="session"></c:remove>
					</c:if>
					
					
					<%
					int id = Integer.parseInt(request.getParameter("id"));
					DoctorDao dao2=new DoctorDao(DBConnect.getConn());
					Doctor d =dao2.getDoctorById(id);
					
					%>

					<form action="../editDoctorServlet" method="post">

						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								class="form-control" name="fullname" value="<%=d.getFullName()%>">
						</div>

						<div class="mb-3">
							<label class="form-label">DOB</label> <input type="date"
								class="form-control" name="dob" value="<%=d.getDob()%>">
						</div>

						<div class="mb-3">
							<label class="form-label">Qualification</label> <input
								type="text" class="form-control" name="quali" value="<%=d.getQuali()%>">
						</div>

						<div class="mb-3">
							<label class="form-label">Specialist</label>
							<option><%=d.getSpecialist()%></option>
							 <select
								class="form-select" name="spec">
								<%
								SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
								List<Specialist> list = dao.getAllSpecialist();
								for (Specialist s : list) {
								%>
								<option><%=s.getSpecialistName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								class="form-control" name="email" value="<%=d.getEmail()%>">
						</div>

						<div class="mb-3">
							<label class="form-label">Mobile No</label> <input type="text"
								class="form-control" name="mobno" value="<%=d.getMobNo()%>">
						</div>

						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password"
								class="form-control" name="password" value="<%=d.getPassword()%>">
						</div>
						<input type="hidden" name="id" value="<%=d.getId()%>">
						<button class="btn btn-primary w-100 col-md-12">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>