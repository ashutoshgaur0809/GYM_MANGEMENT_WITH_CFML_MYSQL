
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>GYM MS Admin</title>
    <!-- plugins:css -->
    
    <link rel="stylesheet" href="assets/vendors/feather/feather.css">
    <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- <link rel="stylesheet" href="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css"> -->
    <link rel="stylesheet" href="assets/vendors/datatables.net-bs5/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="assets/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />

    <style>
      body {
          background-color: #1E1E2D;
          color: hsl(0, 0%, 0%);
      }
      .navbar, .sidebar, .footer {
          background-color: #2D2F40;
      }
      .sidebar .nav-link {
          color: hsl(221, 24%, 87%);
      }
      .sidebar .nav-link:hover, .sidebar .nav-link.active {
          background-color: hsl(234, 24%, 83%);
      }
      .main-panel {
          background-color: #1E1E2D;
          padding: 20px;
      }
      .card {
          background-color: #50579c;
          border:5px solid hsl(0, 0%, 100%);
          border-radius: 10px;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
          color: #F8F9FA;
      }
      .card h3 {
          color: #F8F9FA;
      }
      .card-body {
          padding: 20px;
      }
      .footer {
          border-top: 1px solid #3A3B4E;
          padding: 10px 0;
      }
      .icon-size {
          font-size: 1.5rem;
          margin-right: 8px;
      }
      .card:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 20px hsla(204, 55%, 64%, 0.98);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }
  </style>
  </head>
  <body class="bg-dark text-light">
  <cfoutput>
    
    <cfquery name="getAdmin">
      select * from adminreg where id = #url.id#
    </cfquery>


 
    <div class="container-scroller">
      
      <!-- partial:partials/_navbar.html -->
  <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
    <!--- <a class="navbar-brand brand-logo me-5" href="index.html"><img src="assets/images/logo.svg" class="me-2" alt="logo" /></a> --->
    <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo-mini.svg" alt="logo" /></a>
  </div>
  <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
    <span class="">GYM MS <i class="fa fa-dumbbell"></i></span>
   
    <ul class="navbar-nav navbar-nav-right">
      
      <li class="nav-item nav-profile dropdown">
        <a class="nav-link dropdown-toggle" href="##" data-bs-toggle="dropdown" id="profileDropdown">
          <i class="fa fa-user"></i>
        </a>

        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
          <p class="dropdown-item"> #getAdmin.fullname#</p>
          <a class="dropdown-item" href="../admin/AdminProfile.cfm?id=#url.id#">
            <i class="ti-settings text-primary"></i> Settings </a>
          <a class="dropdown-item" href="../AdminRegistraion.cfm">
            <i class="ti-power-off text-primary"></i> Logout </a>
        </div>
      </li>
      
    </ul>
    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
      <span class="icon-menu"></span>
    </button>
  </div>
</nav>
      <!-- partial -->
  <div class="container-fluid page-body-wrapper text-light">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link" href="##">
        <i class="icon-grid menu-icon  text-light"></i>
        <span class="menu-title">Dashboard</span>
      </a>
    </li>
    <li class="nav-item"> 
      <a class="nav-link" href="../admin/catAdmin.cfm?id=#url.id#">
          <i class="icon-layout menu-icon text-light"></i>
          <span class="menu-title">Category</span>
      </a>
  </li>
    <li class="nav-item"> 
      <a class="nav-link" href="../admin/packAdmin.cfm?id=#url.id#">
          <i class="icon-columns menu-icon text-light"></i>
          <span class="menu-title">Packages</span>
      </a>
  </li>
    <li class="nav-item"> 
      <a class="nav-link" href="../admin/addPack.cfm?id=#url.id#">
          <i class="icon-columns menu-icon text-light"></i>
          <span class="menu-title">Add Package</span>
      </a>
  </li>
    <li class="nav-item"> 
      <a class="nav-link" href="../admin/booking.cfm?id=#url.id#">
          <i class="icon-columns menu-icon text-light"></i>
          <span class="menu-title">Booking History</span>
      </a>
  </li>
   </ul>
</nav>
        <!-- Dashboard-->
        <div class="main-panel bg-dark text-light">
          <div class="content-wrapper bg-dark">
              <!-- Welcome Section -->
            
      
              <!-- Image and Dashboard Stats -->
              <div class="row">
                <div class="col-md-6 grid-margin text-center mt-5">
                    <h1 class="display-1">Welcome</h1>
                    <h1 class="display-1"> #getAdmin.fullname#</h1>
                    <h3 class="font-weight-bold display-1">Admin Panel</h3>
                </div>
                  <!-- Image Section -->
                  <div class="col-md-6 grid-margin">
                      <div class="">
                          <div class="card-people">
                              <img src="../static/dashboard.jpeg" alt="people" class="img">
                          </div>
                      </div>
                  </div>
                 
             
                  
              <div class="col-md-12 grid-margin transparent">
                <!--- 1st row --->
                <div class="row">
                  <div class="col-md-4 mb-4 stretch-card transparent">
                    <div class="card card-tale">
                      <div class="card-body">
                        <h3 class="mb-4">Number Of Users</h3>
                        <cfquery name="numUser">
                          SELECT COUNT(id) AS NumberOfUser FROM registration;
                        </cfquery>
                        <p class="fs-30 mb-2">#numUser.NumberOfUser#</p>
                        
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4   mb-4 stretch-card transparent">
                    <div class="card card-light-danger">
                      <div class="card-body">
                        <h3 class="mb-4">Number Of Booking</h3>
                        <cfquery name="numUser">
                          SELECT COUNT(id) AS NumberOfUser FROM registration;
                        </cfquery>
                        <p class="fs-30 mb-2">#numUser.NumberOfUser#</p>
                        
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-4 stretch-card transparent">
                    <div class="card card-dark-blue">
                      <div class="card-body">
                        <h3 class="mb-4">Number of Package</h3>
                        <cfquery name="numPack">
                          SELECT COUNT(pId) AS NumberOfPack FROM product;
                        </cfquery>
                        <cfquery name="numNewPack">
                          SELECT COUNT(npId) AS NumberOfPack FROM newpack;
                        </cfquery>
                         <p class="fs-30 mb-2">#numPack.NumberOfPack + numNewPack.NumberOfPack#</p>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!--- 2nd Row --->
                <div class="row">
                  
                  <div class="col-md-4 mb-4 stretch-card transparent">
                    <div class="card card-tale">
                      <div class="card-body">
                        <h3 class="mb-4">Total Orders</h3>
                        <cfquery name="numPack">
                          SELECT COUNT(oid) AS TotalOrder FROM  `order`;
                        </cfquery>
                         <p class="fs-30 mb-2">#numPack.TotalOrder#</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-4 stretch-card transparent">
                    <div class="card card-light-danger">
                      <div class="card-body">
                        <h3 class="mb-4">
                          Total Partial Payments
                        </h3>
                        <cfquery name="partailPaymentUser">
                          SELECT COUNT(oid) AS NumberOfUser FROM `order` where status = "0";
                        </cfquery>
                        <p class="fs-30 mb-2">#partailPaymentUser.NumberOfUser#</p>
                        
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-4 stretch-card transparent">
                    <div class="card card-tale">
                      <div class="card-body">
                        <h3 class="mb-4">Total Full Payments</h3>
                        <cfquery name="fullPaymentUser">
                          SELECT COUNT(oid) AS TotalOrder FROM  `order` where status = "1";
                        </cfquery>
                         <p class="fs-30 mb-2">#fullPaymentUser.TotalOrder#</p>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!--- 3nd Row --->
                <div class="row">
                  
                </div>

                <!--- 4rd Row --->
                <div class="row">
                  <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                    <div class="card card-dark-blue">
                      <div class="card-body">
                        <h3 class="mb-4">Number of Category</h3>
                        <cfquery name="numCat">
                          SELECT COUNT(cId) AS NumberOfCat FROM category;
                        </cfquery>
                         <p class="fs-30 mb-2">#numCat.NumberOfCat#</p>
                        
                      </div>
                    </div>
                    
                  </div>
                  <div class="col-md-6 stretch-card transparent">
                    <div class="card card-light-danger">
                      <div class="card-body">
                        <h3 class="mb-4">Number of Admin</h3>

                        <cfquery name="numAdmin">
                        select count(id) as NumberOfAdmin from adminreg

                        </cfquery>
                        <p class="fs-30 mb-2">#numAdmin.NumberOfAdmin#</p>
              
                      </div>
                    </div>
                  </div>

                
                </div>
              </div>
            </div>
                
           
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
  <div class="d-sm-flex justify-content-center justify-content-sm-between">
    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright  2024. GYM MS</span>
  </div>
</footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/chart.umd.js"></script>
    <script src="assets/vendors/datatables.net/jquery.dataTables.js"></script>
    <!-- <script src="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script> -->
    <script src="assets/vendors/datatables.net-bs5/dataTables.bootstrap5.js"></script>
    <script src="assets/js/dataTables.select.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/Chart.roundedBarCharts.js"></script> 
    <!-- End custom js for this page-->
   </cfoutput>
  </body>
</html>