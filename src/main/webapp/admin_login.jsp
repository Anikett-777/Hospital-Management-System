<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin login</title>
<%@ include file="components/allcss.jsp"%>
</head>
<style>

/* FULL PAGE CENTER WRAPPER */
.login-wrapper {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background:linear-gradient(135deg, #34d399, #059669);
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

			<h3>Admin Login</h3>
			<p class="text-light">Secure admin access panel</p>

			<form>

				<!-- Username -->
				<div class="input-group mb-3">
					<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
					<input type="text" class="form-control"
						placeholder="Admin Username">
				</div>

				<!-- Password -->
				<div class="input-group mb-4">
					<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
					<input type="password" class="form-control" placeholder="Password">
				</div>

				<button type="submit" class="btn login-btn w-100 py-2 mb-3">Login</button>

				<p>Don't have an account ? <a href="signup.jsp">create one</a></p>

			</form>

		</div>

	</div>
</body>
</html>