<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
  />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />
  <style>
        body {
            /* background-image: url('navbar_bg.jpg'); Replace with your image path */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            /* background-color: #f8f9fa; Fallback color */
        }

        .navbar{
            /* background-image: linear-gradient(to right, #f16a6a, #fab88e); */
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .modal-content {
            border-radius: 8px;
        }
        .table thead th {
            background-color: #007bff;
            color: white;
            text-align: center;
            font-weight: bold;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2; /* Zebra striping */
        }
        .table tbody tr:hover {
            background-color: #e6f7ff; /* Hover effect */
            cursor: pointer;
        }
        .table td, .table th {
            padding: 15px;
            text-align: center;
            border: 1px solid #dee2e6;
        }
        .table {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .container {
            /* background-color: hsl(37, 100%, 70%); Light orange-yellow for contrast */
            padding: 20px;
            /* border-radius: 8px; */
            /* box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */
        }
        .btn-primary, .btn-warning, .btn-danger {
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 16px;
            text-transform: uppercase;
            font-weight: bold;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-warning {
            background-color: #ffc107;
            border: none;
        }
        .btn-warning:hover {
            background-color: #e0a800;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .btn-danger:hover {
            background-color: #c82333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn a {
            color: white;
            text-decoration: none;
        }
        .btn a:hover {
            color: #dcdcdc;
        }
  
        .card {
            transition: transform 0.4s ease, box-shadow 0.5s ease;
        }

        .card:hover {
          border: 5px solid hsl(58, 100%, 50%);
          box-shadow: 0 0 10px rgba(0, 123, 255, 0.5); 
          transform: scale(1.05);
          /* filter: brightness(1.3) contrast(2); */
          cursor: pointer;
                }

        .card-title {
            transition: color 0.3s ease;
        }

        .card:hover .card-title {
            color: #f1556c;
        }

        .card-text span {
            transition: color 0.3s ease;
        }

        .card:hover .card-text span {
            color: #f1556c;
        }


        .round-image-container {
            position: absolute;
            top: 50%;
            right: 0;
            transform: translateY(-50%);
            z-index: 10; /* Ensures the image is above other content */
          }

          .round-image {
            width: 150px; /* Adjust the size as needed */
            height: 150px;
            border-radius: 50%; /* Makes the image round */
            object-fit: cover; /* Ensures the image covers the circle */
          }
    </style>
</head>
<body class="bg-dark text-light" id="bodyContainer">
    <!-- Navbar -->
    <cfif NOT structKeyExists(session, "userID")>
        <cflocation url="sign_in.cfm">
    </cfif>
    
    <cfif structKeyExists(session, "userID") and structKeyExists(session,"name")>
        <cfoutput>
      <!--- <cfdump var="#session#"><cfabort> --->
            <div id="alertPlaceholder"></div>

            <!--- <h1>Welcome, #session.userID#!</h1> --->
            <!--- <h1>Welcome, #session.name#!</h1> --->
            <nav class="navbar bg-dark navbar-expand-lg sticky-top">
                <div class="container">
                  <!-- Logo on the left -->
                  <a class="navbar-brand text-light" href="##" id="fire_icon">
                  
                    <span style="font-family: Arial; font-size: 24px;">GYM <i class="fa-solid fa-dumbbell"></i> MS</span><br>
                    <span style="font-family: Arial; font-size: 14px;">Gym Management System</span>
                </a>
              
                  <!-- Toggler button for small screens -->
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
              
                  <!-- Navbar items on the right -->
                  <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent"  style="flex-grow: 0";>
                    <ul class="navbar-nav">
                      
                      <li class="nav-item">
                        <a class="nav-link text-light" href="##">
                          <h5>Home</h5>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link text-light" href="about.cfm">
                          <h5>About</h5>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link text-light" href="newArrival.cfm">
                          <h5>New Arrivals</h5>
                        </a>
                    </li>
                      
                      
                      
                    </ul>

                    <!--- Query to fetch data --->
                    <cfquery name="userInfo">
                      select * from registration where id = #session.userID#
                     </cfquery>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <p> #userInfo.fullname#</p>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                          <li><a class="dropdown-item " href="userProfile.cfm">Profile</a></li>
                        
                          <li><hr class="dropdown-divider"></li>
                          <button id="logoutBtn" class="btn btn-primary btn-lg">   <i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</button>
                        
                          
                        </div>
                        </ul>
                      </div>
              
                  <!-- Search and buttons aligned to the right -->
                </div>
             
              </nav>
              <!--- Modal --->
              <!-- Logout Confirmation Modal -->
                <div class="modal fade " id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
                    <div class="modal-dialog bg-dark">
                        <div class="modal-content bg-dark">
                            <div class="modal-header bg-dark">
                                <h5 class="modal-title " id="logoutModalLabel">Logout Confirmation</h5>
                                <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body ">
                                <p ><strong>Warning!</strong> Are you sure you want to logout?</p>
                            </div>
                            <div class="modal-footer">

                                
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                <button id="confirmLogout" type="button" class="btn btn-success">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
              <!-- carsoul  -->
            <!-- Carousel -->
        <div class="container-lm">
        <div id="demo" class="carousel slide" data-bs-ride="carousel">
        
          <!-- Indicators/dots -->
          <div class="carousel-indicators">
            <button type="button" data-bs-target="##demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="##demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="##demo" data-bs-slide-to="2"></button>
          </div>
          
          <!-- The slideshow/carousel -->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="../static/carsoul_gym_bg_1.jpg" alt="Los Angeles" class="d-block" style="width:100%; height:950px">
              <div class="carousel-caption text-start ">
                <h1 class="font-italic display-5 mb-4 font-weight-bold text-uppercase" style="color: ##cccccc;">
                    <span style="color: ##ffff99;">H</span>USTLE FOR MUSCLE
                </h1>
                
              </div>
            </div>
            <div class="carousel-item">
              <img src="../static/carsoul_gym_bg_2.jpg" alt="Chicago" class="d-block" style="width:100%; height:950px ">
              <div class="carousel-caption text-start">
                <h1 class="font-italic display-5 mb-4 font-weight-bold text-uppercase" style="color:white;">
                    <span style="color: ##ffff99;">T</span>o be extraordinary
                </h1>
                
              </div>
            </div>
            <div class="carousel-item">
              <img src="../static/Designer.jpeg" alt="New York" class="d-block" style="width:100%; height:950px">
              <div class="carousel-caption text-start">
                <h1 class="font-italic display-5 mb-4 font-weight-bold text-uppercase" style="color: white;">
                    <span style="color: ##ffff99;">B</span>e bold, be fit
                </h1>
                
              </div> 
            </div>
          </div>
        </div>
          
          <!-- Left and right controls/icons -->
          <button class="carousel-control-prev" type="button" data-bs-target="##demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="##demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>
        
        
        <!--- Title --->
        <!--- <img src="../static/Designer (2).png" class="img-fluid" style="width:100%; " alt="Responsive image"> --->
        
        <!--- Categories --->
        <h1 class="text-center mb-4 mt-5 text-light">Categories</h1>
        <div class="container-fluid">
            <div class="album mt-5 mx-auto">
              <div class="container-fluid">
                <!-- Your card content -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                  <!-- Card 1 -->
                  <a href="category/cat_Duration.cfm" style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm ">
                      <img src="/static/cat1.png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">Fixed Duration Based</h5>
                        
                      </div>
                    </div>
                  </div>
                </a>
                  <!-- Card 2 -->
                  <a  href="category/cat_access.cfm" style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm ">
                      <img src="/static/cat2.png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">Fixed Access Based</h5>
                       
                      </div>
                    </div>
                  </div>
                </a>
                <a  href="category/cat_Service.cfm" style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm">
                      <img src="/static/cat3.png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">Fixed Service Based</h5>
                      
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </a>
              
            </div>
          </div>
        
        <!--- Pricing Plan --->
        
        <h1 class="text-center mb-4 mt-5 text-light">Package</h1>
        <div class="container-fluid">
            <div class="album mt-5 mx-auto">
              <div class="container-fluid">
                <!-- Your card content -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                  <!-- Card 1 -->
                  <a style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm ">
                      <img src="../static/../static/Designer (3).png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">Basic</h5>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; 8-Week Training Plan</span>
                        </p>
                        <p class="card-text">
                          <span style="color: red; font-weight: bold;">&##10060; Ongoing Support</span>
                        </p>
                        <p class="card-text">
                          <span style="color: red; font-weight: bold;">&##10060; Nutritional Plan</span>
                        </p>
                      </div>
                    </div>
                  </div></a>
                  <!-- Card 2 -->
                  <a style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm ">
                      <img src="../static/Designer (4).png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">Standard</h5>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; 8-Week Training Plan</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Ongoing Support</span>
                        </p>
                        <p class="card-text">
                          <span style="color: red; font-weight: bold;">&##10060; Nutritional Plan</span>
                        </p>
                      </div>
                    </div>
                  </div></a>
                  <!-- Card 3 -->
                  <a style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm">
                      <img src="../static/Designer (5).png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">Premium</h5>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; 8-Week Training Plan</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Ongoing Support</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Nutritional Plan</span>
                        </p>
                      </div>
                    </div>
                  </div></a>
                  <a style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm">
                      <img src="../static/Designer (5).png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">3 Month</h5>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; 8-Week Training Plan</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Ongoing Support</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Nutritional Plan</span>
                        </p>
                      </div>
                    </div>
                  </div></a>
                  <a style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm">
                      <img src="../static/Designer (5).png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">6 Month</h5>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; 8-Week Training Plan</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Ongoing Support</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Nutritional Plan</span>
                        </p>
                      </div>
                    </div>
                  </div></a>
                  <a style="text-decoration: none;">
                  <div class="col">
                    <div class="card shadow-sm">
                      <img src="../static/Designer (5).png" class="card-img-top" alt="">
                      <div class="card-body">
                        <h5 class="card-title">12 Month</h5>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; 8-Week Training Plan</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Ongoing Support</span>
                        </p>
                        <p class="card-text">
                          <span style="color: green; font-weight: bold;">&##9989; Nutritional Plan</span>
                        </p>
                      </div>
                    </div>
                  </div></a>
                </div>
              </div>
              
            </div>
          </div>
        <img src="../static/Designer (2).png" class="img-fluid" style="width:100%; " alt="Responsive image">
          

        </cfoutput>
    <cfelse>
        <p>Error: User ID is not found in the session.</p>
    </cfif>
     
    

</body>

<!--- <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> --->
 <script>
        // Trigger the modal on logout button click
        document.getElementById('logoutBtn').addEventListener('click', function() {
            var logoutModal = new bootstrap.Modal(document.getElementById('logoutModal'));
            logoutModal.show();
        });

        // Handle the logout confirmation
        document.getElementById('confirmLogout').addEventListener('click', function() {
            // Perform the logout action
            window.location.href = 'register.cfm'; // Change this to your actual logout URL
        });
    </script>
</script>
</html>