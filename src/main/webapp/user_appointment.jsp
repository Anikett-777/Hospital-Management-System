<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/allcss.jsp"%>
</head>
<style>
.appointment-section {
	background: #f4f8fb;
	padding: 60px 0;
}

.appointment-card {
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
}

.appointment-title {
	font-weight: 600;
	letter-spacing: 0.5px;
}

.form-control, .form-select {
	border-radius: 8px;
}

.submit-btn {
	background: linear-gradient(135deg, #198754, #20c997);
	border: none;
	padding: 12px;
	font-weight: 500;
	border-radius: 8px;
}
</style>
<body>
	<%@ include file="components/navbar.jsp"%>
	<section class="appointment-section">
		<div class="container">
			<div class="row align-items-center">

				<!-- LEFT IMAGE -->
				<div class="col-lg-6 d-none d-lg-block text-center">
					<img src="images/img04.jfif" class="img-fluid" alt="Doctor Image">
				</div>

				<!-- RIGHT FORM -->
				<div class="col-lg-6">
					<div class="card appointment-card p-4">
						<h4 class="text-center mb-4 appointment-title">User
							Appointment</h4>

						<c:if test="${not empty succMsg }">
							<p class="tecxt-center text-success fs-5">${succMsg}</p>
							<c:remove var="succMsg" scope="session"></c:remove>
						</c:if>

						<!--If Data not Inserted  -->
						<c:if test="${not empty errorMsg }">
							<p class="tecxt-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"></c:remove>
						</c:if>

						<form action="add_appointment" method="post">
						
						<input type="hidden" name="userId" value="${userObj.id }">
							<div class="row g-3">

								<div class="col-md-6">
									<label class="form-label">Full Name</label> <input type="text"
										class="form-control" name="fullname" required>
								</div>

								<div class="col-md-6">
									<label class="form-label">Gender</label> <select
										class="form-select" name="gender">
										<option>Male</option>
										<option>Female</option>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label">Age</label> <input type="number"
										class="form-control" name="age">
								</div>

								<div class="col-md-6">
									<label class="form-label">Appointment Date</label> <input
										type="date" class="form-control" name="app_date">
								</div>

								<div class="col-md-6">
									<label class="form-label">Email</label> <input type="email"
										class="form-control" name="email">
								</div>

								<div class="col-md-6">
									<label class="form-label">Phone No</label> <input type="text"
										class="form-control" name="phNo">
								</div>

								<div class="col-md-6">
									<label class="form-label">Diseases</label> <input type="text"
										class="form-control" name="disease">
								</div>

								<div class="col-md-6">
									<label class="form-label">Doctor</label> <select
										class="form-select" name="doctorId">
										<%
										DoctorDao dao = new DoctorDao(DBConnect.getConn());
										List<Doctor>list=dao.getAllDoctor();
										for(Doctor d:list){%>
											<option value="<%=d.getId()%>"><%=d.getFullName() %>(<%=d.getSpecialist() %>)</option>
										<%
										}
										%>
									</select>
								</div>

								<div class="col-12">
									<label class="form-label">Full Address</label>
									<textarea class="form-control" rows="3" name="address"></textarea>
								</div>

								<c:if test="${ empty userObj}">
									<a href="user_login.jsp"></a>
								</c:if>

								
								<c:if test="${not empty userObj }">
									<button class="btn submit-btn w-100 mt-3 text-white">
										Submit</button>
								</c:if>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>
</body>
</html>