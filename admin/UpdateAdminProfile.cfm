<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Dark Theme Custom Styles -->
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
        }

        .form-control,
        .btn-primary {
            background-color: #333;
            color: #fff;
            border: none;
        }

        .form-control:focus {
            background-color: #444;
            color: #fff;
            border: 1px solid #555;
            box-shadow: none;
        }

        .btn-primary {
            background-color: #1a73e8;
            border-color: #1a73e8;
        }

        .btn-primary:hover {
            background-color: #135ab6;
            border-color: #135ab6;
        }

        .modal-header,
        .modal-body {
            background-color: #1f1f1f;
            border: none;
        }

        .container {
            background-color: #1f1f1f;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>

<body>
    <cfoutput>
        <cfset id = 0>
        <cfset fullname = "">
        <cfset email = "">
        <cfset phone = "">
        <cfset passkey = "">
        <cfset showNewPasskey = false>
       

        <cfif structKeyExists(url, "id") and url.id GT 0>
            <cfquery name="Get_Emp_By_Id">
                SELECT id, fullname, email, phone, passkey 
                FROM adminreg
                WHERE id = #url.id#;
            </cfquery>

            <cfif Get_Emp_By_Id.recordCount GT 0>
                <cfset fullname = #Get_Emp_By_Id.fullname#>
                <cfset email = #Get_Emp_By_Id.email#>
                <cfset phone = #Get_Emp_By_Id.phone#>
                <cfset passkey = #Get_Emp_By_Id.passkey#>
                <cfset id = Get_Emp_By_Id.id>
            </cfif>
        </cfif>

        <!-- Update Query -->
        <cfif structKeyExists(form, "ID") and form.ID GT 0>
            <!-- Check if the current passkey matches -->
            <cfif form.current_passkey eq passkey>
                <!-- If a new passkey is provided, update it -->
                <cfif structKeyExists(form, "new_passkey") and len(trim(form.new_passkey))>
                    <cfquery name="UpdateEmp">
                        UPDATE adminreg
                        SET
                            fullname = "#form.fullname#",
                            email = "#form.email#",
                            phone = "#form.phone#",
                            passkey = "#form.new_passkey#"
                        WHERE id = #form.ID#;
                    </cfquery>
                    <script>
                        alert("Info Updated successfully !");
                        window.location.href = "AdminProfile.cfm?id=#url.id#";
                    </script>
                <!-- Otherwise, update the details without changing the passkey -->
                <cfelse>
                    <cfquery name="UpdateEmp">
                        UPDATE adminreg
                        SET
                            fullname = "#form.fullname#",
                            email = "#form.email#",
                            phone = "#form.phone#",
                            passkey = "#form.new_passkey#"
                        WHERE id = #form.ID#;
                    </cfquery>
                    <script>
                        alert("Info Updated successfully !");
                        window.location.href = "AdminProfile.cfm?id=#url.id#";
                    </script>
                </cfif>
            <!-- If the current passkey does not match, show an alert -->
            <cfelse>
                <script>
                    alert("Current passkey is incorrect. Please try again.");
                </script>
            </cfif>
        </cfif>
        
        

        <div class="container">
            <div class="modal-header">
                <h5 class="modal-title p-5" id="exampleModalLabel">Update in Table</h5>
            </div>
            <div class="modal-body">
                <div class="container mt-3">
                    <cfform name="insertEmp" method="post" action="##">
                        <cfinput type="hidden" name="ID" class="form-control" value="#ID#">

                        Full Name:
                        <cfinput type="text" name="fullname" class="form-control" value="#fullname#">
                        <br><br>
                        Email:
                        <cfinput type="text" name="email" class="form-control" value="#email#">
                        <br><br>

                        Phone:
                        <cfinput type="text" name="phone" class="form-control" value="#phone#">
                        <br><br>

                        Enter Current passkey:
                        <cfinput type="password" name="current_passkey" class="form-control" value="">
                        <br><br>

                        New passkey:
                        <cfinput type="password" name="new_passkey" class="form-control" value="">
                        <br><br>
                        </div>
<!--- 
                        <cfif structKeyExists(form, "current_passkey") and form.current_passkey eq passkey >
                            <script>
                                $(document).ready(function() {
                                    $("##newpasskeySection").show();
                                });
                            </script>
                        </cfif> --->

                        <!-- New passkey Section, initially hidden -->
                       

                        <cfinput type="submit" name="btnSubmit" value="Submit" class="btn btn-primary">
                    </cfform>
                </div>
            </div>
        </div>
    </cfoutput>
</body>

</html>
