<?php
require_once 'config/config.php';

if (isset($_SESSION["user"])) {
  $id = $_SESSION["user"];
  $result = query("SELECT * FROM users WHERE id_user = $id")[0];
  if ($result['roles'] == 'ADMIN') {
    header("Location: admin");
  } elseif ($result["roles"] == 'OWNER') {
    header("Location: owner");
  }
}

if (isset($_SESSION["driver"])) {
  header("Location: driver");
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>KIA Bamboo Art</title>

  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
  <link href="assets/style/main.css" rel="stylesheet" />
</head>

<body>
  <!-- navbar -->

  <nav class="navbar navbar-expand-lg navbar-light navbar-store" data-aos="fade-down">
    <div class="container">
      <a href="index.php" class="navbar-brand">
        <img src="assets/images/logo-kia.png" class="w-50" alt="logo" />
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a href="index.php" class="nav-link">Home</a>
          </li>
          <li class="nav-item">
            <a href="products.php" class="nav-link">Product</a>
          </li>
          <li class="nav-item active">
            <a href="" class="nav-link">Karyawan</a>
          </li>
          <li class="nav-item active">
            <a href="" class="nav-link">Galeri</a>
          </li>
          <li class="nav-item">
            <a href="about.php" class="nav-link">About Us</a>
          </li>
          <?php
          if (!isset($_SESSION["login"]) && !isset($_SESSION["user"])) : ?>
            <li class="nav-item">
              <a href="register.php" class="nav-link">Sign Up</a>
            </li>
            <li class="nav-item">
              <a href="login.php" class="btn btn-success nav-link px-4 text-white">Sign In</a>
            </li>
          <?php else : ?>
            <li class="nav-item dropdown">
              <?php
              $id = $_SESSION["user"];
              $user = query("SELECT * FROM users WHERE id_user = $id")[0];
              ?>
              <a href="#" class="nav-link font-weight-bold" id="navbarDropdown" role="button" data-toggle="dropdown">
                <!-- <img
                      src="../assets/images/user_pc.png"
                      alt="profile"
                      class="rounded-circle mr-2 profile-picture"
                    /> -->
                Hi, <?= $user["name"]; ?>
              </a>
              <div class="dropdown-menu">
                <?php if ($user["roles"] == 'ADMIN') : ?>
                  <a href="admin" class="dropdown-item">
                    Dashboard
                  </a>
                <?php else : ?>
                  <a href="user" class="dropdown-item">
                    Dashboard
                  </a>
                <?php endif; ?>
                <div class="dropdown-divider"></div>
                <a href="logout.php" class="dropdown-item">logout</a>
              </div>
            </li>
            <li class="nav-item">
              <?php
              $id = $user["id_user"];
              $carts = rows("SELECT * FROM carts WHERE user_id = $id");
              ?>
              <?php if ($carts >= 1) : ?>
                <a href="cart.php" class="nav-link d-inline-block">
                  <img src="assets/images/shopping-cart-filled.svg" alt="cart-empty" />
                  <div class="cart-badge"><?= $carts; ?></div>
                </a>
              <?php else : ?>
                <a href="cart.php" class="nav-link d-inline-block">
                  <img src="assets/images/icon-cart-empty.svg" alt="cart-empty" />
                </a>
              <?php endif; ?>
            </li>
          <?php endif; ?>
        </ul>
      </div>
    </div>
  </nav>
  <!-- akhir navbar -->
  <br><br>
    <center><div class="">
        <b><h1>Galeri</h1></b>
    </div></center>
  <br><br>
  <!-- Galeri Card -->
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-4">
        <div class="card" style="width: 18rem;">
          <img src="assets/images/1.jpg" class="card-img-top" alt="test-gambar">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
      </div>
    </div>
    <div class="container mt-5">
    <div class="row">
      <div class="col-md-4">
        <div class="card" style="width: 18rem;">
          <img src="assets/images/1.jpg" class="card-img-top" alt="test-gambar">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="assets/vendor/jquery/jquery.slim.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
  <script src="assets/js/navbar-scroll.js"></script>
</body>

</html>