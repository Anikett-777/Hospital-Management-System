<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<%@ include file="components/allcss.jsp"%>
<style>

/* FULL PAGE CENTER WRAPPER */
.login-wrapper {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #34d399, #059669);
}

/* GLASS CARD */
.login-card {
	background: rgba(255, 255, 255, 0.12);
	backdrop-filter: blur(12px);
	border-radius: 20px;
	padding: 40px;
	width: 100%;
	max-width: 380px;
	border: 1px solid rgba(255, 255, 255, 0.22);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
}

.login-card h3 {
	font-weight: 700;
	color: #fff;
}

.form-control {
	background: rgba(255, 255, 255, 0.25);
	border: none;
	color: #fff;
}

.form-control::placeholder {
	color: #eee;
}

.input-group-text {
	background: rgba(255, 255, 255, 0.25);
	border: none;
	color: #fff;
}

.login-btn {
	background-color: #ff914d; /* Admin Theme Color */
	border: none;
	font-weight: 600;
}

.login-btn:hover {
	background-color: #ff7a26;
}

a {
	color: #ffb88c;
	text-decoration: none;
}

a:hover {
	color: #ff9f68;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="login-wrapper">

		<div class="login-card text-center text-white">

			<!-- ADMIN ICON -->
			<div class="mb-3">
				<i class="bi bi-shield-lock-fill fs-1" style="color: #ffb86c;"></i>
			</div>

			<h3>User Register</h3>
		<!-- 	<p class="text-light">Secure admin access panel</p> -->
		<!--If Data Insterted Successfully  -->
		<c:if test="${not empty succMsg }">
			<p class="tecxt-center text-success fs-3">${succMsg}</p>
			<c:remove var="succMsg" scope="session"></c:remove>
		</c:if>
		
		<!--If Data not Inserted  -->
		<c:if test="${not empty errorMsg }">
			<p class="tecxt-center text-danger fs-3">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"></c:remove>
		</c:if>
		

			<form action="user_regsiter" method="post">

				<!-- Username -->
				<div class="input-group mb-3">
					<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
					<input type="text" class="form-control"
						placeholder="Enter Full Name" name="fullName">
				</div>
				
				<!--Email  -->
				<div class="input-group mb-3">
					<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
					<input type="email" class="form-control"
						placeholder="Enter Your Email" name="email">
				</div>

				<!-- Password -->
				<div class="input-group mb-4">
					<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
					<input type="password" class="form-control" placeholder="Password" name="password">
				</div>

				<button type="submit" class="btn login-btn w-100 py-2 mb-3">Register</button>

			</form>

		</div>

	</div>

</body>
</html>