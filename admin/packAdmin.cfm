<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-9/assets/css/registration-9.css"
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style></style>
<body class="bg-dark">
    <cfoutput>


        <!--- Query to fetch data --->
        <cfquery name="getPackage">
            select * from product 
            
        </cfquery>
        <div class="container mt-3">
            <a href="../src/index.cfm?id=#url.id#"><i class="fa fa-arrow-left" style="color: white;"></i></a>
            <br>
    
                <h2 class="text-center bg-light">Fixed Packages</h2>
                
                <!-- Product Table -->
                <table class="table table-bordered mt-2">
                    <thead>
                        <tr>
                            <th>PRODUCT ID</th>
                            <th>PRODUCT NAME</th>
                            <th>CATEGORY NAME</th>
                            <th>PRODUCT RATE</th>
                            <th>ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="getPackage">
                            <tr>
                                <td>#pId#</td>
                                <td>#pName#</td>
                                <td>#cName#</td>
                                <td>#NumberFormat(pRate, "9,99900")# INR</td>
                                <td>
                                    <button type="button" class="btn btn-warning"> <a href="updateProductRate.cfm?pId=#pId#&id=#url.id#" style="color: white; text-decoration:none">Update</a> </button>
                                </td>
                           
                                
                            </tr>
                        </cfloop>
                    </tbody>
                </table>

                <div class="mt-5">
                    <canvas id="productRateChart"></canvas>
                </div>
            </div>
            
            <script>
                // Prepare data for the chart from ColdFusion query
                var productNames = [
                    <cfoutput query="getPackage">"#pName#"<cfif currentRow LT recordCount>,</cfif></cfoutput>
                ];
                var productRates = [
                    <cfoutput query="getPackage">#pRate#<cfif currentRow LT recordCount>,</cfif></cfoutput>
                ];
            
                // Create the chart
                var ctx = document.getElementById('productRateChart').getContext('2d');
                var productRateChart = new Chart(ctx, {
                    type: 'line', // You can change this to 'line' if you prefer a line chart
                    data: {
                        labels: productNames,
                        datasets: [{
                            label: 'Product Rate',
                            data: productRates,
                            backgroundColor: 'rgba(75, 192, 192)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Product Rate ($)'
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Product Name'
                                }
                            }
                        }
                    }
                });
            </script>

    </cfoutput>
</body>
</html>