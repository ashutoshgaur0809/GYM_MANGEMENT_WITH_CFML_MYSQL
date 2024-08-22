<cfoutput>
  

        <cfset email = trim(FORM.email)>
        <cfset password = trim(FORM.password)>
        <cfquery name="getUser">
            SELECT id, fullname, email, phone , city , password , date 
            FROM registration
            WHERE 
            email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="100">
            AND password = <cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar" maxlength="100">
        </cfquery>
        <!--- <cfdump var="#getUser.recordcount#"> <cfabort> --->
      
        <cfif getUser.recordcount EQ 1>
            <cfset SESSION.userID = getUser.id>
            <cfset SESSION.name = getUser.fullname>
            <cfset SESSION.email = getUser.email>
            <cfset SESSION.phone = getUser.phone>
            <cfset SESSION.city = getUser.city>
            <cfset SESSION.password = getUser.password>
            <cfset SESSION.date = getUser.date>

            <!--- after login page --->
            

            <!--- <cfdump var="#session#"> <cfabort> --->
            <cflocation url="afterLogin.cfm" addToken="false">
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
    