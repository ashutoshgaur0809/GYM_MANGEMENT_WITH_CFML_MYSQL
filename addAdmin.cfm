<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-dark">
    <table class="bg-dark body-wrap" style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; width: 100%; background-color: #f6f6f6; margin: 0;" bgcolor="#f6f6f6">
        <tbody>
            <tr style="margin: 0;">
                <td style="margin: 0;"></td>
                <td class="container" width="600" style="max-width: 600px; margin: 0 auto;">
                    <div class="content" style="max-width: 600px; margin: 0 auto; padding: 20px;">
                        <table class="main" width="100%" cellpadding="0" cellspacing="0" style="border-radius: 3px; background-color: #fff; border: 1px solid #e9e9e9;">
                            <tbody>
                                <tr>
                                    <td style="font-size: 16px; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: #38414a; padding: 20px;" align="center">
                                        <a href="#" style="font-size:32px; color:#fff;">GYM MS</a><br>
                                        <span style="display: block; margin-top: 10px;">Warning: You're approaching Admin Panel Without Correct Passkey.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-wrap" style="padding: 20px;">
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tbody>
                                                <tr>
                                                    <td class="content-block" style="padding: 0 0 20px;">
                                                        If you do not have an <strong>authorized passkey</strong>, you can register or login as a user.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="content-block" style="padding: 0 0 20px;">
                                                        or you can provide right pass key..
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="content-block" style="padding: 0 0 20px;">
                                                        <a href="AdminRegistraion.cfm" class="btn btn-primary" style=" text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; display: inline-block; border-radius: 5px; padding: 8px 16px;">User Registration</a>
                                                        <a href="register.cfm" class="btn btn-success" style=" text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; display: inline-block; border-radius: 5px;  padding: 8px 16px;">Admin Registraion</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="content-block" style="padding: 0 0 20px;">
                                                        Thanks for choosing <b>GYM MS</b> 
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </td>
                <td style="margin: 0;"></td>
            </tr>
        </tbody>
    </table>
<cfoutput>


<cfquery name="checkAdminEmail">
    select email from adminreg where email = "#form.email#";
</cfquery>
<cfif checkAdminEmail.recordCount EQ 0>
    <cfif form.passkey EQ "xyz"> 
        <cfquery name="insertUser">
            INSERT INTO adminreg (fullname, email, phone, passkey) 
            VALUES ('#form.fullname#', '#form.email#', '#form.phone#', '#form.passkey#');
        </cfquery>
        <cflocation url="admin/adminLogin.cfm">
    </cfif>
<cfelse>
    <!-- Modal Trigger -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var emailExistsModal = new bootstrap.Modal(document.getElementById('emailExistsModal'));
            emailExistsModal.show();
        });
    </script>
  <!--- <cfelse>
  <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Warning!</strong> type right passkey?
        <a href="AdminRegistraion.cfm"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></a>
    </div> --->
    <!--- <cflocation url="AdminRegistraion.cfm">
    <p>Invalid passkey. Please try again.</p> --->
</cfif>
</cfoutput>

<!-- Modal HTML -->
<div class="modal fade" id="emailExistsModal" tabindex="-1" aria-labelledby="emailExistsModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="emailExistsModalLabel">Email Already Exists</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          The email '<cfoutput>#form.email#</cfoutput>' already exists. Please use a different email address.
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="window.location.href='AdminRegistraion.cfm';">OK</button>
        </div>
      </div>
    </div>
  </div>
  
  </body>
  </html>
  
</body>