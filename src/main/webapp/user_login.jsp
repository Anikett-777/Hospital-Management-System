<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@ include file="components/allcss.jsp"%>
<style>

/* FULL PAGE LOGIN WRAPPER */
.login-wrapper {
	height: 100vh; /* Full screen */
	display: flex; /* Center only this */
	justify-content: center;
	align-items: center;
	background:
		url("https://images.unsplash.com/photo-1586773860418-d37222d8fce3")
		center/cover no-repeat;
}

/* LOGIN CARD */
.login-card {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(10px);
	border-radius: 20px;
	padding: 40px;
	border: 1px solid rgba(255, 255, 255, 0.2);
	box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
	width: 100%;
	max-width: 380px;
}

.form-control {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: #fff;
}

.form-control::placeholder {
	color: #eee;
}

.input-group-text {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: #fff;
}

.login-btn {
	background-color: #00d4a7;
	border: none;
	font-weight: 600;
}

.login-btn:hover {
	background-color: #00b98a;
}
li{
 list-style:none;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="login-wrapper">

		<div class="login-card text-center text-white">

			<div class="mb-3">
				<i class="bi bi-hospital fs-1 text-success"></i>
			</div>

			<h3 class="fw-bold">User Login</h3>
			<p class="text-light">Access your account securely</p>

			<form>

				<!-- Email -->
				<div class="input-group mb-3">
					<span class="input-group-text"><i class="bi bi-envelope"></i></span>
					<input type="email" class="form-control" placeholder="Email">
				</div>

				<!-- Password -->
				<div class="input-group mb-4">
					<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
					<input type="password" class="form-control" placeholder="Password">
				</div>

				<button type="submit" class="btn login-btn w-100 py-2 mb-3">Login</button>

				<br>Don't have any an Account <a href="signup.jsp" class="text-decoration-none">
				create one</a>

			</form>

		</div>
	</div>

</body>
</html>