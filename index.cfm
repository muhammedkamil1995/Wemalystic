<!DOCTYPE html>
<html lang="en" dir="ltr">
    <cfinclude  template="templates/resources/head.cfm">

    <body class="">
        <!--- Preloader --->
        <cfif !application.developmentMode>
            <div id="loading">
                <div class="loader simple-loader">
                    <div class="loader-body ">
                        <img src="assets/images/wema-logo.png" width="100" alt="loader" class="image-loader img-fluid ">
                    </div>
                </div>
            </div>
        </cfif>
        
        <!--- Main Navbar (Left) --->
        <cfinclude  template="templates/skeletons/navbar-left.cfm">

        <!--- Main Container --->
        <main class="main-content">
            <div class="position-relative <cfif !url.keyExists('app') && !url.keyExists('report')>wemalytics-banner</cfif>">
                <cfinclude  template="templates/skeletons/topbar.cfm">
                <cfif !url.keyExists('app') && !url.keyExists('report')>
                    <cfinclude  template="templates/skeletons/dashboard-banner.cfm">
                </cfif>
            </div>
            <!-- page_layout -->
            <div class="content-inner container-fluid pb-0" id="">
                <cfparam name="url.report" default=""/>
                <cfparam name="url.app" default=""/>
              

                <cfif url.keyExists('app') && url.app.len()>
                    <cfinclude template="templates/pages/apps/#url.app#.cfm"/>
                <cfelseif url.keyExists('report') && url.report.len()>
                    <cfinclude template="templates/pages/reports/#url.report#.cfm"/>
                <cfelse>
                    <cfinclude template="templates/pages/dashboard.cfm"/>
                </cfif>
            </div>
            
            <cfinclude  template="templates/skeletons/footer.cfm">
        </main>
        
        <!--- Script Resources --->
        <cfinclude  template="templates/resources/scripts.cfm">        
    </body>
</html>
