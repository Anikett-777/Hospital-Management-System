<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@page import="com.entity.Appointment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp"%>
</head>
<style>
.comment-card {
	border: none;
	border-radius: 14px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

.comment-title {
	font-weight: 600;
	color: #0f172a;
}

.form-control {
	border-radius: 10px;
	background-color: #f1f5f9;
	border: 1px solid #e2e8f0;
}

.form-control:focus {
	box-shadow: none;
	border-color: #0ea5e9;
	background-color: #ffffff;
}

.submit-btn {
	background: linear-gradient(135deg, #0ea5e9, #0369a1);
	color: #fff;
	border: none;
	border-radius: 10px;
	padding: 10px 40px;
	font-weight: 500;
}

.submit-btn:hover {
	opacity: 0.95;
}
</style>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="doctor_navbar.jsp"%>

	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">

				<div class="card comment-card p-4">
					<h4 class="text-center mb-4 comment-title">Patient Comment</h4>
					<% int id = Integer.parseInt(request.getParameter("id"));
					AppoinmentDao dao = new AppoinmentDao(DBConnect.getConn());
					Appointment ap = dao.getAppointmentById(id);
					%>
					<form action="../update_status" method="post">

						<div class="row g-3">
							<div class="col-md-6">
								<label class="form-label">Patient Name</label> <input
									type="text" class="form-control" value=" <%=ap.getFullName() %>" readonly>
							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label> <input type="text"
									class="form-control" value="<%=ap.getAge() %>" readonly>
							</div>

							<div class="col-md-6">
								<label class="form-label">Mob No</label> <input type="text"
									class="form-control" value="<%=ap.getPhNo()%>" readonly>
							</div>

							<div class="col-md-6">
								<label class="form-label">Diseases</label> <input type="text"
									class="form-control" value="<%=ap.getDiseases() %>" readonly>
							</div>

							<div class="col-12">
								<label class="form-label">Comment</label>
								<textarea class="form-control" rows="4"
									placeholder="Write your medical comment here..." name="comment"
									required></textarea>
							</div>
							
							<input type="hidden" name="id" value="<%=ap.getId() %>">
							<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

							<div class="col-12 text-center mt-3">
								<button class="btn submit-btn px-5">Submit</button>
							</div>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>