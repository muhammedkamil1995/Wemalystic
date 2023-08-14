component{
    this.name = "Wemalytics";

    public void function onApplicationStart(){
        application.name = "Wemalytics MIS";
        application.dateInitialized = now();
        application.developmentMode = true;
    }

    public void function onRequest(targetPage){
        if( url.keyExists('restart') ){
            applicationStop();
            location(arguments.targetPage, false);
        }

        param name = "url.view" default = "";
        param name = "reporting_month" default = "";

        // @dev TEMP: to cancel out reporting month until implemented
        if( reporting_month.len() ){
            reporting_month = "";
        }

        include arguments.targetPage;
    }

    param name = "url.startdate" default="01-#DateFormat(now(),'mmm-yyyy')#";
    param name = "url.enddate" default="#DaysInMonth(Now())#-#DateFormat(now(),'mmm-yyyy')#";
    param name = "url.monthend" default="#DaysInMonth(now())#-#DateFormat(now(),'mmm-yyyy')#";
    param name = "url.view" default="";
    param name = "url.searchtype" default="";
    param name = "url.records_per_page" default="100";
    param name = "url.records_start" default="1";
}