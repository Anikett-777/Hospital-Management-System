<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@ include file="components/allcss.jsp" %>
</head>
<style>

.carousel-item img {
  height: 90vh;
  object-fit: cover;
  filter: brightness(70%);
  background-size:;
}

.carousel-caption h2 {
  font-size: 3rem;
  text-shadow: 0px 0px 10px #000;
}

.carousel-caption p {
  font-size: 1.25rem;
  text-shadow: 0px 0px 10px #000;
}

/* Our Services CSS */
.service-box {
  padding: 20px;
}

.service-icon {
  width: 50px;
  height: 50px;
  filter: brightness(0) saturate(100%) invert(55%) sepia(45%) saturate(500%)
          hue-rotate(120deg) brightness(95%) contrast(90%);
}




/*	Footer  */
.navbar {
  letter-spacing: 1px;
}

.nav-link {
  font-size: 0.9rem;
  color: #ddd !important;
}

.nav-link:hover {
  color: #00d4a7 !important; /* mint hover color */
}

.extra-links .nav-link {
  font-size: 0.8rem;
}
</style>
<body>
<%@include file="components/navbar.jsp" %>


<!-- Carousel Start -->
<div id="hospitalCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">

  <!-- Indicators -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#hospitalCarousel" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#hospitalCarousel" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#hospitalCarousel" data-bs-slide-to="2"></button>
  </div>

  <!-- Slides -->
  <div class="carousel-inner">

    <!-- Slide 1 -->
    <div class="carousel-item active">
      <img src="images/img05.jfif"class="d-block w-100" alt="Hospital">
      <div class="carousel-caption d-none d-md-block">
        <h2 class="fw-bold text-light">Advanced Healthcare Services</h2>
        <p>Your health is our top priority.</p>
      </div>
    </div>

    <!-- Slide 2 -->
    <div class="carousel-item">
      <img src="images/img06.jfif" class="d-block w-100" alt="Doctors">
      <div class="carousel-caption d-none d-md-block">
        <h2 class="fw-bold text-light">Expert Doctors & Staff</h2>
        <p>Highly trained medical professionals at your service.</p>
      </div>
    </div>

    <!-- Slide 3 -->
    <div class="carousel-item">
      <img src="images/img07.jfif" class="d-block w-100" alt="Medical Equipment">
      <div class="carousel-caption d-none d-md-block">
        <h2 class="fw-bold text-light">Modern Medical Facilities</h2>
        <p>World-class technology for better treatment.</p>
      </div>
    </div>

  </div>

  <!-- Controls -->
  <button class="carousel-control-prev" type="button" data-bs-target="#hospitalCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>

  <button class="carousel-control-next" type="button" data-bs-target="#hospitalCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>

</div>
<!-- Carousel End -->




	<!-- Our Services -->
<section class="py-5 bg-light">
  <div class="container">

    <!-- Section Title -->
    <div class="text-center mb-5">
      <h2 class="fw-bold">Our Services</h2>
      <p class="text-muted">TO CHOOSE FROM</p>
    </div>

    <!-- Services Grid -->
    <div class="row g-4">

      <!-- Cardiology -->
      <div class="col-md-4">
        <div class="service-box text-center">
          <img src="icons/heart.svg" class="service-icon mb-3" alt="">
          <i class="fa-regular fa-heart"></i><h5 class="fw-bold">Cardiology</h5>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lorem maximus malesuada.</p>
        </div>
      </div>

      <!-- Gastroenterology -->
      <div class="col-md-4">
        <div class="service-box text-center">
          <img src="icons/stomach.svg" class="service-icon mb-3" alt="">
          <h5 class="fw-bold">Gastroenterology</h5>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lorem maximus malesuada.</p>
        </div>
      </div>

      <!-- Medical Lab -->
      <div class="col-md-4">
        <div class="service-box text-center">
          <img src="icons/lab.svg" class="service-icon mb-3" alt="">
          <h5 class="fw-bold">Medical Lab</h5>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lorem maximus malesuada.</p>
        </div>
      </div>

      <!-- Dental Care -->
      <div class="col-md-4">
        <div class="service-box text-center">
          <img src="icons/tooth.svg" class="service-icon mb-3" alt="">
          <h5 class="fw-bold">Dental Care</h5>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lorem maximus malesuada.</p>
        </div>
      </div>

      <!-- Surgery -->
      <div class="col-md-4">
        <div class="service-box text-center">
          <img src="icons/surgery.svg" class="service-icon mb-3" alt="">
          <h5 class="fw-bold">Surgery</h5>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lorem maximus malesuada.</p>
        </div>
      </div>

      <!-- Neurology -->
      <div class="col-md-4">
        <div class="service-box text-center">
          <img src="icons/brain.svg" class="service-icon mb-3" alt="">
          <h5 class="fw-bold">Neurology</h5>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lorem maximus malesuada.</p>
        </div>
      </div>

    </div>
  </div>
</section>

<%@include file="components/footer.jsp" %>

	
</body>

</html>