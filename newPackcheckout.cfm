<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .card-custom {
            background-color: #2b2b2b;
            border: none;
            border-radius: 10px;
            padding: 20px;
            color: #fff;
        }
        .card-custom .list-group-item {
            background-color: #3b3b3b;
            color: #fff;
        }
        .btn-custom {
            background-color: #17a2b8;
            color: white;
            border-radius: 50px;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #138496;
        }
        .text-muted-custom {
            color: #aaa;
        }
    </style>
</head>
<body class="bg-dark text-white">
    <cfoutput>
    
    <!-- Fetch user and package information -->
    <cfquery name="userInfo">
        SELECT * 
        FROM registration 
        WHERE id = <cfqueryparam value="#session.userID#" cfsqltype="cf_sql_integer">
    </cfquery>
    
    <cfquery name="packInfo">
        SELECT * 
        FROM newpack
        WHERE npId = <cfqueryparam value="#npID#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!-- Check if form has been submitted -->

    
<!--- <cfdump var="#insertOrder#"><cfabort> --->
    <!-- Form for checkout -->
    <div class="container my-5">
        <main>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="../static/logo.png" alt="Logo" width="100" height="50">
                <h2>Checkout Form</h2>
            </div>

            <form action="" method="POST">
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <div class="card card-custom">
                            <h4 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-primary">Order Details</span>
                            </h4>
                            
                            <ul class="list-group mb-3">
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">Product Name</h6>
                                        <small class="text-muted-custom">#packInfo.npName# Package</small>
                                    </div>
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">Product Category</h6>
                                        <small class="text-muted-custom">#packInfo.npCat# Based</small>
                                    </div>
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">Product Rate</h6>
                                        <small class="text-muted-custom">#packInfo.npRate# INR</small>
                                    </div>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-body-tertiary">
                                    <div class="text-success">
                                        <h6 class="my-0">Product Discount Rate <br> (After 10% Discount)</h6>
                                        <small>Coupon = AAA</small>
                                    </div>
                                    <span class="text-success">#packInfo.npRate * 0.90# INR</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Total (INR)</span>
                                    <strong>#packInfo.npRate * 0.90# INR</strong>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">User Details</h4>
                        <div class="card card-custom">
                            <div class="row g-0">
                                <!-- Full Name -->
                                <div class="col-5 col-md-3 bg-primary border-bottom border-white border-3 rounded-start">
                                    <div class="p-4 fw-bold">
                                        <i class="fas fa-user"></i> Full Name
                                    </div>
                                </div>
                                <div class="col-7 col-md-9 bg-secondary border-bottom border-white border-3 rounded-end">
                                    <div class="p-4">#userInfo.fullname#</div>
                                </div>

                                <!-- Phone -->
                                <div class="col-5 col-md-3 bg-primary border-bottom border-white border-3 rounded-start">
                                    <div class="p-4 fw-bold">
                                        <i class="fas fa-phone"></i> Phone
                                    </div>
                                </div>
                                <div class="col-7 col-md-9 bg-secondary border-bottom border-white border-3 rounded-end">
                                    <div class="p-4">#userInfo.phone#</div>
                                </div>

                                <!-- Address -->
                                <div class="col-5 col-md-3 bg-primary border-bottom border-white border-3 rounded-start">
                                    <div class="p-4 fw-bold">
                                        <i class="fas fa-map-marker-alt"></i> Address
                                    </div>
                                </div>
                                <div class="col-7 col-md-9 bg-secondary border-bottom border-white border-3 rounded-end">
                                    <div class="p-4">#userInfo.city#</div>
                                </div>

                                <!-- Email -->
                                <div class="col-5 col-md-3 bg-primary border-bottom border-white border-3 rounded-start">
                                    <div class="p-4 fw-bold">
                                        <i class="fas fa-envelope"></i> Email
                                    </div>
                                </div>
                                <div class="col-7 col-md-9 bg-secondary border-bottom border-white border-3 rounded-end">
                                    <div class="p-4">#userInfo.email#</div>
                                </div>
                            </div>
                        </div>

                        <br>
                        <h4 class="mb-5 mt-2">Payment</h4>
                        
                        <!-- Buttons -->
                        <div class="d-flex justify-content-between text-light">
                            <button class="btn btn-secondary btn-custom" type="button" onclick="history.back()">Previous</button>
                            <button class="btn btn-primary btn-custom text-light" type="submit" name="submit"><a href="category/FinalCheckout.cfm?npID=#npID#"> Continue to checkout</a></button>
                        </div>
                    </div>
                </div>
            </form>

        </main>

        <footer class="my-5 pt-5 text-body-secondary text-center text-small">
            <p class="mb-1 text-white">2017/2024 GYMMS</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="##" class="text-white">Privacy</a></li>
                <li class="list-inline-item"><a href="##" class="text-white">Terms</a></li>
                <li class="list-inline-item"><a href="##" class="text-white">Support</a></li>
            </ul>
        </footer>
    </div>
    </cfoutput>
</body>
</html>
