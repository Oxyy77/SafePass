<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>Daftar - SafePass</title>

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

    <style>
      body {
        background-color: #1f2122;
        color: #fff;
        height: 100vh;
        display: flex;
        align-items: center;
      }
      .daftar-container {
        background: #27292a;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.5);
      }
      .daftar-image {
         background-image: url(assets/images/profile.jpg);
  background-position: center center;
  background-size: cover;
  min-height: inherit;
      min-height: 400px;
      
      }
      .daftar-form {
        padding: 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
      }
      .daftar-form h2 {
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
      .btn-daftar {
        background-color: #27292a;
        color: #fff;
        width: 100%;
      }
      .btn-daftar:hover {
        background-color: #e75e8d;
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
    <!-- ***** Header Area Start ***** -->
    <%@ include file="navbar.jsp" %>

    <!-- ***** Header Area End ***** -->

    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="row daftar-container">
            <!-- Kolom Kiri: Gambar -->
             
            <div
              class="col-lg-6 p- daftar-image d-none d-lg-block"
            ></div>

            <!-- Kolom Kanan: Form -->
            <div class="col-lg-6 daftar-form">
              <h2>Daftar</h2>

              <%
                String error = (String) request.getAttribute("errorMessage");
                if (error != null) {
              %>
              <div class="alert alert-danger">
                <%= error %>
              </div>
              <% } %>

              <form action="doRegister" method="post">
                <div class="mb-3">
                  <input
                    type="text"
                    class="form-control"
                    name="username"
                    placeholder="Username"
                    required
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="email"
                    class="form-control"
                    name="email"
                    placeholder="Email"
                    required
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="password"
                    class="form-control"
                    name="password"
                    placeholder="Password"
                    required
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="password"
                    class="form-control"
                    name="confirm_password"
                    placeholder="Konfirmasi Password"
                    required
                  />
                </div>
                <button type="submit" class="btn btn-daftar">
                  Daftar
                </button>
              </form>
              <p class="switch-link">
                Sudah punya akun? <a href="login.jsp">Login</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Scripts -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
