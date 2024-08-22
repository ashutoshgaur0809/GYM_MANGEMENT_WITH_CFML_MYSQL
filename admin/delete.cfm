<cfif structKeyExists(url, "npid") and url.npid GT 0 and url.del EQ 1>
    <!--- Fetch the category of the package to be deleted --->
    <cfquery name="getPackageCategory">
        SELECT npCat 
        FROM newpack 
        WHERE npID = <cfqueryparam value="#url.npid#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!--- Delete the package --->
    <cfquery name="delEmp">
        DELETE FROM newpack 
        WHERE npID = <cfqueryparam value="#url.npid#" cfsqltype="cf_sql_integer">;
    </cfquery>

    <!--- Decrement the cPack value based on the category of the deleted package --->
    <cfif getPackageCategory.npCat EQ "Duration" OR getPackageCategory.npCat EQ "Access" OR getPackageCategory.npCat EQ "Service">
        <cfquery name="decCategoryPack">
            UPDATE category 
            SET cPack = cPack - 1
            WHERE cName = <cfqueryparam value="#getPackageCategory.npCat#" cfsqltype="cf_sql_varchar">
        </cfquery>
    </cfif>

    <!--- Redirect to the addPack.cfm page --->
    <cflocation url="addPack.cfm?&id=#url.id#">
</cfif>
