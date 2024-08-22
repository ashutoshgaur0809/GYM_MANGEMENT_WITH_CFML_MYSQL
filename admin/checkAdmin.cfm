<cfoutput>
  

    <cfset email = trim(FORM.email)>
    <cfset passkey = trim(FORM.passkey)>
    <cfquery name="getAdmin">
        SELECT id, fullname, email
        FROM adminreg
        WHERE 
        email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="100">
        AND passkey = <cfqueryparam value="#form.passkey#" cfsqltype="cf_sql_varchar" maxlength="100">
    </cfquery>
    <!--- <cfdump var="#getUser.recordcount#"> <cfabort> --->
  
    <cfif getAdmin.recordcount EQ 1>
        <cfset SESSION.userID = getAdmin.id>
        <cfset SESSION.name = getAdmin.fullname>
        <cfset SESSION.email = getAdmin.email>

        <!--- after login page --->
        

        <!--- <cfdump var="#session.name#"> <cfabort> --->
        <cflocation url="../src/index.cfm?id=#getAdmin.id#" addToken="false">
    <cfelse>
        <script>
            alert('Invalid email or password. Please try again.');
            history.back();
        </script>
    </cfif>

    <!--- <script>
        alert('An error occurred while processing your login. Please try again.');
        history.back();
    </script> --->

</cfoutput>
