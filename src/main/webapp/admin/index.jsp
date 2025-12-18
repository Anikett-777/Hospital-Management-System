<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp"%>
</head>
<style>
body {
	background: #f4f7fb;
}

.dashboard-title {
	color: #0369a1;
	font-weight: 700;
}

.stat-card {
	border: none;
	border-radius: 16px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease;
}

.stat-card:hover {
	transform: translateY(-6px);
}

.icon-box {
	width: 55px;
	height: 55px;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 24px;
}

.bg-doctor {
	background: linear-gradient(135deg, #0ea5e9, #0369a1);
}

.bg-user {
	background: linear-gradient(135deg, #22c55e, #15803d);
}

.bg-appointment {
	background: linear-gradient(135deg, #6366f1, #4338ca);
}

.bg-specialist {
	background: linear-gradient(135deg, #f97316, #c2410c);
}

.stat-number {
	font-size: 28px;
	font-weight: 700;
	color: #0f172a;
}

.stat-label {
	color: #64748b;
	font-size: 14px;
}

.hospital-modal {
	border-radius: 14px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.hospital-modal .form-control {
	border-radius: 10px;
}

.hospital-modal .btn-primary {
	background: linear-gradient(135deg, #0ea5e9, #0369a1);
	border: none;
}
</style>
<body>
	<%@include file="admin_navbar.jsp"%>

	<c:if test="${empty adminObj}">
	
		<c:redirect url="../admin_login.jsp"></c:redirect>

	</c:if>


	<div class="container py-5">


		<h3 class="dashboard-title mb-4">Admin Dashboard</h3>

		<c:if test="${not empty succMsg }">
			<p class="tecxt-center text-success fs-5">${succMsg}</p>
			<c:remove var="succMsg" scope="session"></c:remove>
		</c:if>

		<!--If Data not Inserted  -->
		<c:if test="${not empty errorMsg }">
			<p class="tecxt-center text-danger fs-5">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"></c:remove>
		</c:if>

		<div class="row g-4">

			<!-- Doctors -->
			<div class="col-lg-3 col-md-6">
				<div class="card stat-card p-4">
					<div class="d-flex align-items-center gap-3">
						<div class="icon-box bg-doctor">
							<i class="bi bi-heart-pulse"></i>
						</div>
						<div>
							<div class="stat-number">45</div>
							<div class="stat-label">Doctors</div>
						</div>
					</div>
				</div>
			</div>
			
			

			<!-- Users -->
			<div class="col-lg-3 col-md-6">
				<div class="card stat-card p-4">
					<div class="d-flex align-items-center gap-3">
						<div class="icon-box bg-user">
							<i class="bi bi-people-fill"></i>
						</div>
						<div>
							<div class="stat-number">320</div>
							<div class="stat-label">Users</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Appointments -->
			<div class="col-lg-3 col-md-6">
				<div class="card stat-card p-4">
					<div class="d-flex align-items-center gap-3">
						<div class="icon-box bg-appointment">
							<i class="bi bi-calendar-check-fill"></i>
						</div>
						<div>
							<div class="stat-number">128</div>
							<div class="stat-label">Appointments</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Specialists -->
			<div class="col-lg-3 col-md-6">
				<div class="card stat-card p-4" data-bs-toggle="modal"
					data-bs-target="#addSpecialistModal">
					<div class="d-flex align-items-center gap-3">
						<div class="icon-box bg-specialist">
							<i class="bi bi-award-fill"></i>
						</div>
						<div>
							<div class="stat-number">18</div>
							<div class="stat-label">Specialists</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<div class="modal fade" id="addSpecialistModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content hospital-modal">

				<!-- Header -->
				<div class="modal-header border-0">
					<h5 class="modal-title d-flex align-items-center gap-2">
						<i class="bi bi-award-fill text-primary"></i> Add Specialist
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Body -->
				<div class="modal-body">
					<form action="../add_specialist" method="post">

						<div class="mb-3">
							<label class="form-label">Specialist Name</label> <input
								type="text" class="form-control"
								placeholder="e.g. Cardiology" name="specName">
						</div>
						
						<div class="mb-3">
							<button class="btn btn-primary" type="submit">Add Specialist</button>
						</div>

					</form>
				</div>

				<!-- Footer -->
				<div class="modal-footer border-0">
					<button class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
					
				</div>

			</div>
		</div>
	</div>

</body>
</html>