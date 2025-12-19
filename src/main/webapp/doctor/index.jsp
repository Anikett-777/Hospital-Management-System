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

.stat-card {
	border: none;
	border-radius: 16px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease;
}

.stat-card:hover {
	transform: translateY(-6px);
}

.dashboard-title {
	color: #0369a1;
	font-weight: 700;
}
</style>
<body>

	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="doctor_navbar.jsp"%>
	<h3 class="dashboard-title mb-4">Admin Dashboard</h3>
	<div class="container py-5">
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
		</div>
	</div>
</body>
</html>