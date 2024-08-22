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
</head>

<body class="bg-dark">
<cfoutput>
  <cfquery name="checkEmail">
    SELECT email 
    FROM registration 
    WHERE email = '#form.email#';
  </cfquery>

  <cfif checkEmail.recordCount EQ 0>
    <cfquery name="insertUser">
      INSERT INTO registration (fullname, email, phone, city, password, date)
      VALUES (
          '#form.fullname#', 
          '#form.email#', 
          '#form.phone#', 
          '#form.city#', 
          '#form.password#', 
          <cfqueryparam value="#CreateODBCDate(Now())#" cfsqltype="cf_sql_date">
      );
  </cfquery>
    <cflocation url="sign_in.cfm">
  <cfelse>
    <!-- Modal Trigger -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var emailExistsModal = new bootstrap.Modal(document.getElementById('emailExistsModal'));
            emailExistsModal.show();
        });
    </script>

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
        <button type="button" class="btn btn-primary" onclick="window.location.href='register.cfm';">OK</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
