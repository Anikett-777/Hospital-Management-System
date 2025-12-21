<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Update</title>
<%@ include file="components/allcss.jsp"%>
</head>
<style>
.change-pass-section {
	background: #f4f8fb;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.change-card {
	border: none;
	border-radius: 16px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
	padding: 35px;
	background: #fff;
	width: 100%;
	max-width: 420px;
}

.change-title {
	font-weight: 600;
	color: #0f172a;
}

.form-control {
	border-radius: 10px;
	background: #f1f5f9;
	border: 1px solid #e2e8f0;
}

.form-control:focus {
	box-shadow: none;
	border-color: #0ea5e9;
	background: #fff;
}

.change-btn {
	background: linear-gradient(135deg, #0ea5e9, #0369a1);
	color: #fff;
	border: none;
	border-radius: 10px;
	padding: 12px;
	font-weight: 500;
}

.change-btn:hover {
	opacity: 0.95;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="change-pass-section">
		<div class="change-card">

			             

			<h4 class="text-center mb-4 change-title">Change Password</h4>

			<!-- Success Message -->
			<c:if test="${not empty succMsg}">
				<p class="text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" />
			</c:if>

			<!-- Error Message -->
			<c:if test="${not empty errorMsg}">
				<p class="text-center text-danger">${errorMsg}</p>
				<c:remove var="errorMsg" />
			</c:if>

			<form action="change_password" method="post">

				<div class="mb-3">
					<label class="form-label">Enter New Password</label> <input
						type="password" name="newPassword" class="form-control" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Enter Old Password</label> <input
						type="password" name="oldPassword" class="form-control" required>
				</div>

				<input type="hidden" value="${userObj.id}" name="uid">
				<button class="btn change-btn w-100 mt-3">Update Password</button>
			</form>

		</div>
	</div>
</body>
</html>