<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper@7/swiper-bundle.min.css"
    />
    <!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->  <style>
    body {
      background-color: #1f2122;
      color: #fff;
      height: 100vh;
      display: flex;
      align-items: center;
    }
    .login-container {
      background: #27292a;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 6px 20px rgba(0,0,0,0.5);
    }
    .login-image {

      min-height: 400px;
      
    }
    .login-form {
      padding: 40px;
      display: flex;
      flex-direction: column;
        justify-content: center;
    }
    .login-form h2 {
      margin-bottom: 25px;
      color: #fff;
    }
    .form-control {
      background-color: #1f2122;
      border: none;
      color: #fff;
    }
    .form-control:focus {
      background-color: #1f2122;
      color: #fff;
      box-shadow: 0 0 5px #e75e8d;
    }
    .btn-login {
      background-color: #e75e8d;
      color: #fff;
      width: 100%;
    }
    .btn-login:hover {
      background-color: #ff77a5;
    }
    .switch-link {
      margin-top: 15px;
      color: #bbb;
    }
    .switch-link a {
      color: #e75e8d;
      text-decoration: none;
    }
    .switch-link a:hover {
      text-decoration: underline;
    }
  </style>
  </head>

  <body>
    <!-- ***** Preloader Start ***** -->
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <!-- ***** Preloader End ***** -->

    <!-- ***** Header Area Start ***** -->
    <%@ include file="navbar.jsp" %>

    <!-- ***** Header Area End ***** -->

   <div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="row login-container">
        <!-- Kolom Kiri: Gambar -->
        <div class="col-lg-6 p-3 login-image d-none d-lg-block">
            <div class="main-banner" ></div>
        </div>

        <!-- Kolom Kanan: Form -->
        <div class="col-lg-6 login-form">
          <h2>Login</h2>
          <form action="doLogin" method="post">
            <div class="mb-3">
              <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
              <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-login">Login</button>
          </form>

          <% String error = (String) request.getAttribute("errorMessage");
            if (error != null) { %>
          <div style="color: red;"><%= error %></div>
          <% } %>

          <p class="switch-link">Belum punya akun? <a href="register.jsp">Daftar</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/popup.js"></script>
    <script src="assets/js/custom.js"></script>
  </body>
</html>
