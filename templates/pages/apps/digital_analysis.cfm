<div class="my-2">
    <button onclick="history.back()" type="button" class="btn">
        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-arrow-back-up" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"> <path stroke="none" d="M0 0h24v24H0z" fill="none"/> <path d="M9 13l-4 -4l4 -4m-4 4h11a4 4 0 0 1 0 8h-1" /> </svg>
        Back
    </button>
<div class="download" style="float: right">
  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" >
   <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
  </button>
  <ul class="dropdown-menu">
    <li><a onclick="ExportToExcel(); return false;" href="#" class="download-item">Download Excel</a></li>
    <li><a onclick="createPDF(); return false;" href="#" class="download-item">Download Pdf</a></li>
    <li><a onclick="export2Word(window.loans); return false;" href="#" class="download-item">Download Ms-word</a></li>
    <li><a onclick="downloadPPT(); return false;" id="loans" href="#" class="download-item">Download powerpoint</a></li>
  </ul>
</div>
</div>


<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://unpkg.com/docxtemplater"></script>
<script src="https://unpkg.com/html-to-docx"></script>
<script src="PptxGenJS/dist/pptxgen.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

<script>
    function createPDF() {
        var sTable = document.getElementById('digital_analysis').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=700,width=700');

        win.document.write('<html><head>');
        win.document.write('<title>digital_analysis</title>');   // <title> FOR PDF HEADER.
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
        win.document.write('</body></html>');
	    html1pdf()
            .from(element)
            .save();

    }

    function ExportToExcel(type, fn, dl) {
            var elt = document.getElementById('digital_analysis');
            var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
                             return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('digital_analysis-sheet.' + (type || 'xlsx')));
        }

function export2Word(element) {

  var html, link, blob, url, css;

  css = (
    '<style>' +
    '@page WordSection1{size: 40cm 29.7cm;}' +
    'div.WordSection1 {page: WordSection1;}' +
    '</style>'
  );

  html = element.innerHTML;
  blob = new Blob(['\ufeff', css + html], {
    type: 'application/msword'
  });
  url = URL.createObjectURL(blob);
  link = document.createElement('A');
  link.href = url;
  link.download = 'digital_analysis'; // default name without extension
  document.body.appendChild(link);
  if (navigator.msSaveOrOpenBlob) navigator.msSaveOrOpenBlob(blob, 'digital_analysis.doc'); // IE10-11
  else link.click(); // other browsers
  document.body.removeChild(link);
};

function downloadPPT() {
      // Get the HTML table element
      const table = document.getElementById('digital_analysis');

      // Convert the table to a canvas element using HTML2Canvas
      html2canvas(table)
        .then(canvas => {
          // Create an offscreen anchor element to download the PPT file
          const link = document.createElement('a');
          link.href = canvas.toDataURL('pptx');
          

          // Set the download attribute and file name
          link.download = 'digital_analysis.pptx';

          // Trigger the download
          link.click();
        });
    }

    // Attach the downloadPPT function to the download button click event
    const downloadButton = document.getElementById('digital_analysis');
    downloadButton.addEventListener('click', downloadPPT);
    
</script>

<cfparam name="url.p_context" default="1" type="integer" />
<cfparam name="url.filter_b" default="1" type="integer" />
<cfparam name="url.filter_e" default="1" type="integer" />
<cfparam name="url.filter_d" default="1" type="integer" />
<cfparam name="url.e_startdate" default="#url.startdate#" type="date" />
<cfparam name="url.e_enddate" default="#url.enddate#" type="date" />
<cfparam name="url.entity_code" default="000" type="string" />
<cfset show_branch_selection=false />

<cfif IsDefined("url.branch_code")>
    <cfset url.entity_code=url.branch_code />
</cfif>

<cfquery name="f" datasource="wemalytics">
    select * from wvx_dim_branches where branch_code = '#url.entity_code#'
</cfquery>

<cfif f.recordcount eq 0>
    <cfset url.view='select' />
</cfif>


<cfswitch expression="#url.view#">
    <cfdefaultcase>

        <cfif url.p_context eq 1>
            <cfset context_title="Debit Cards" />
            <cfset context_query="number_of_debit_cards = 0" />
        <cfelseif url.p_context eq 2>
            <cfset context_title="USSD" />
            <cfset context_query="has_USSD = 0" />
        <cfelseif url.p_context eq 3>
            <cfset context_title="ALAT" />
            <cfset context_query="has_ALAT = 0 " />
        <cfelseif url.p_context eq 4>
            <cfset context_title="ALAT Business" />
            <cfset context_query="has_ALAT_Business = 0 " />
        <cfelseif url.p_context eq 5>
            <cfset context_title="Balance" />
            <cfset context_query="ledger_balance = 0 " />
        </cfif>

        <cfquery name="e_d" datasource="wemalytics">
            select branch_name entity_name,branch_code entity_code from wvx_dim_branches where branch_code = '#url.entity_code#'
        </cfquery> 
        
        <cfif e_d.recordcount eq 0>
            <cfquery name="e_d" datasource="wemalytics">
                select account_officer_name entity_name,account_officer_code entity_code from wvx_dim_account_officers
                where account_officer_code = '#url.entity_code#'
            </cfquery>
        </cfif> 


        <cfquery name="a" datasource="wemalytics">
            select count(1) total_record
            from alat.dbo.dim_digital_account
            where #iif(len(url.entity_code) eq 3,DE("branch_code"),DE("account_officer_code"))# in ('#url.entity_code#')
            <cfif IsDefined("url.e_startdate") and IsDefined("url.e_enddate")>
                and account_opening_date between
                <cfqueryparam cfsqltype="cf_sql_date" value="#url.e_startdate#" /> and
                <cfqueryparam cfsqltype="cf_sql_date" value="#url.e_enddate#" />
                <cfelse>
                    and account_opening_date >= dateadd(year,datediff(year,0,getdate()),0)
            </cfif>
            and #context_query#
            <cfif url.filter_b eq 0 and p_context eq 1>
                and ledger_balance > 1000
                <cfelseif url.filter_b eq 0>
                    and ledger_balance > 0
            </cfif>
            <cfif url.filter_d eq 0>
                and ledger_balance = 0
            </cfif>

        </cfquery>

        <cfquery name="b" datasource="wemalytics">
            select *
            from alat.dbo.dim_digital_account
            where #iif(len(url.entity_code) eq 3,DE("branch_code"),DE("account_officer_code"))# in ('#url.entity_code#')
            <cfif IsDefined("url.e_startdate") and IsDefined("url.e_enddate")>
                and account_opening_date between
                <cfqueryparam cfsqltype="cf_sql_date" value="#url.e_startdate#" /> and
                <cfqueryparam cfsqltype="cf_sql_date" value="#url.e_enddate#" />
            <cfelse>
                    and account_opening_date >= dateadd(year,datediff(year,0,getdate()),0)
            </cfif>
            and #context_query#
            <!--- If viewing funded account (filter_b = 0) and it's debit card, ledger balance - minimum balance must be able to buy a card at N1,000 --->
            <cfif url.filter_b eq 0 and p_context eq 1>
                and ledger_balance > 1000
                <!--- For all others, legder balance just need to be greater than zero --->
                <cfelseif url.filter_b eq 0>
                    and ledger_balance > 0
            </cfif>
            <!--- zero ledger balance --->
            <cfif url.filter_d eq 0>
                and ledger_balance = 0
            </cfif>
            order by account_opening_date desc
        </cfquery>


        <div class="row" id="digital_analysis">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Digital Analysis ('000) | <cfoutput>This Report is from #Dateformat(url.e_startdate,'mmmm d, yyyy')# To #Dateformat(url.e_enddate,'mmmm d, yyyy')#</cfoutput></h4>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="tabContent-deposits">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td style="background-color:#FFF; color:black; font-weight:bold; font-size:12pt;border:none;">
                                                <cfoutput>#NumberFormat(a.total_record,'999,999')# New Customers without #context_title# <cfif
                                                    len(url.entity_code) eq 3>at #e_d.entity_name# [#e_d.entity_code#]<cfelse>opened by
                                                    #e_d.entity_name# [#e_d.entity_code#]</cfif>
                                                </cfoutput>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" nowrap="nowrap" valign="bottom"
                                                style="border:none;padding:0;padding-bottom:10px;">
                                                <cfoutput>
                                                    <b>Change Context:</b>
                                                    <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=1&filter_b=#url.filter_b#<cfif IsDefined("url.e_startdate") and
                                                        IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                        </cfif>">Debit Cards</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                                    <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=2&filter_b=#url.filter_b#<cfif IsDefined("url.e_startdate") and
                                                        IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                        </cfif>">USSD</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                                    <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=3&filter_b=#url.filter_b#<cfif IsDefined("url.e_startdate") and
                                                        IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                        </cfif>">ALAT</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                                    <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=4&filter_b=#url.filter_b#<cfif IsDefined("url.e_startdate") and
                                                        IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                        </cfif>">ALAT Business</a>
                                                </cfoutput>
                                                <cfoutput>
                                                    <br /><b>Filter:</b>
                                                    <cfif url.filter_b eq 0>
                                                        <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=#p_context#&filter_b=1&filter_e=#url.filter_e#<cfif IsDefined("url.e_startdate") and
                                                            IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                    </cfif>">Show all Accounts</a>
                                                    <cfelse>
                                                        <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=#p_context#&filter_b=0&filter_e=#url.filter_e#<cfif IsDefined("url.e_startdate") and
                                                            IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                            </cfif>">Show Funded Accounts</a>
                                                        </cfif>
                                                        &nbsp;&nbsp;|&nbsp;&nbsp;
                                                        <cfif url.filter_e eq 0>
                                                            <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=#p_context#&filter_b=#url.filter_b#&filter_e=1<cfif IsDefined("url.e_startdate") and
                                                                IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                        </cfif>">Show all Accounts</a>
                                                        <cfelse>
                                                            <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=#p_context#&filter_b=#url.filter_b#&filter_e=0<cfif IsDefined("url.e_startdate") and
                                                                IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                                </cfif>">Show Accounts with Emails</a>
                                                            </cfif>
                                                            &nbsp;&nbsp;|&nbsp;&nbsp;
                                                            <a href="apps/#url.app#&branch_code=#url.entity_code#&p_context=5&filter_b=#url.filter_b#<cfif IsDefined("url.e_startdate") and
                                                                IsDefined("url.e_enddate")>&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#
                                                                </cfif>">Show Accounts with Zero Balance</a>
                                                </cfoutput>
                                            </td>

                                            <td align="right" colspan="5" style="border:none;padding-left:0;border-right:none;padding:0;">
                                                <cfoutput>
                                                    <form id="frm_card" method="get" action="apps/#url.app#" style="width:100%;border:none;">
                                                        <input type="hidden" name="branch_code" value="#url.entity_code#" />
                                                        <input type="hidden" name="p_context" value="#url.p_context#" />
                                                        <input type="hidden" name="filter_b" value="#url.filter_b#" />
                                                        <div class="col-lg-6" style="width:500px;">
                                                            <input required name="e_startdate" type="date" id="e_startdate"
                                                                value="<cfif IsDefined("url.e_startdate")>#Dateformat(url.e_startdate,'d-mmm-yyyy')#</cfif>"
                                                            class="form-control flatpickr-input" style="width:200px;height:36px;float:left">
                                                            <input required name="e_enddate" type="date" id="e_enddate"
                                                                value="<cfif IsDefined("url.e_startdate")>#Dateformat(url.e_enddate,'d-mmm-yyyy')#</cfif>"
                                                            class="form-control flatpickr-input" style="width:200px;height:36px;float:left">
                                                            <input name="searchbtn" type="submit" value="View" style="width:100px;height:36px;background-color:##5c2484;color:white;">
                                                        </div>
                                                    </form>
                                                </cfoutput>
                                            </td>
                                        </tr>
                                        <cfif b.recordcount gt 0>
                                            <table style="width:100%;" id="without_eproducts" class="datatable-buttons table table-bordered dt-responsive nowrap w-80 dataTable no-footer dtr-inline collapsed"
                                                role="grid">
                                                <thead>
                                                    <tr class="bg-primary text-dark">
                                                        <td width="30">#</td>
                                                        <td class="myModal" width="80">Account</td>
                                                        <td class="myModal">Customer Name</td>
                                                        <td class="myModal" width="100">Opened</td>
                                                        <td class="myModal" width="150">Account Officer</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <cfoutput query="b">
                                                        <tr valign="top">
                                                            <td class="tab_left">#b.currentrow#</td>
                                                            <td>#left(b.account_number,3)#*****#right(b.account_number,2)#</td>
                                                            <td>#Left(b.account_name,35)#</td>
                                                            <td nowrap>#DateFormat(b.account_opening_date,'d-mmm-yyyy')#</td>
                                                            <td nowrap>#b.account_officer_name#</td>
                                                        </tr>
                                                    </cfoutput>
                                                </tbody>
                                            </table>
                                            <cfelse>
                                                <tr valign="top">
                                                    <td colspan="5" style="padding:0;padding-top:40px;border:none;font-size:25px;">There are
                                                        no data matching your search criteria.</td>
                                                </tr>
                                        </cfif>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </cfdefaultcase>

    <!--- Select a branch to view if you don't have a viable default branch --->
    <cfcase value="select">
        <cfquery name="q" datasource="wemalytics" cachedwithin="#CreateTimeSpan(0,12,0,0)#">
            select
            a.branch_code,a.branch_name,a.branch_head,a.zone_code,a.zone_name,a.region_code,a.region_name,a.directorate_code,a.directorate_name
            ,count(1)accounts
            ,sum(case when a.number_of_debit_cards = 0 then 1 else 0 end)no_number_of_debit_cards
            ,sum(case when (has_ALAT = 0) then 1 else 0 end)no_ALAT
            ,sum(case when (has_ALAT_Business = 0) then 1 else 0 end)no_ALAT_Business
            ,sum(case when a.has_USSD = 0  then 1 else 0 end)no_ussd
            ,sum(case when ledger_balance = 0 then 1 else 0 end) no_balance
            ,dateadd(week,datediff(week,0,getdate())-1,0) e_startdate,dateadd(week,datediff(week,0,getdate()),0)
            e_enddate
            from alat.dbo.dim_digital_account a
            where account_opening_date between '#url.e_startdate#' and '#url.e_enddate#'
            and a.branch_code not in ('000')
            <!---<cfif IsDefined("session.userdetails.canviewdivision")>and
                a.directorate_code='#session.userdetails.canviewdivision#'</cfif>
            <cfif IsDefined("session.userdetails.canviewregion")>and a.region_code='#session.userdetails.canviewregion#'
            </cfif>
            <cfif IsDefined("session.userdetails.canviewzone")>and a.zone_code='#session.userdetails.canviewzone#'
            </cfif>--->
            group by
            a.branch_code,a.branch_name,a.branch_head,a.zone_code,a.zone_name,a.region_code,a.region_name,a.directorate_code,a.directorate_name
            order by a.directorate_name,a.region_name,a.zone_name,a.branch_code
        </cfquery>


        <div class="row" id="digital_analysis">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Digital Analysis('000) | <cfoutput>This Report is from #Dateformat(url.e_startdate,'mmmm d, yyyy')# To #Dateformat(url.e_enddate,'mmmm d, yyyy')#</cfoutput></h4>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="tabContent-deposits">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td style="background-color:#FFF; color:black; font-weight:bold; font-size:12pt;border:none;">
                                                Search For Prefered Branch and click On Any Of The Numbers To See Details Plus Toggle
                                                Between Dates</td>
                                            <td align="right" style="border:none;padding-left:0;border-right:none;padding:0;border:none;">
                                                <cfoutput>
                                                    <form id="frm_card" method="get" action="apps/#url.app#" style="width:100%;border:none;">
                                                        <div class="col-lg-6" style="width:500px;">
                                                            <input required name="e_startdate" type="date" id="e_startdate" value="<cfif IsDefined("url.e_startdate")>#Dateformat(url.e_startdate,'d-mmm-yyyy')#</cfif>"
                                                            class="form-control flatpickr-input" style="width:200px;height:36px;float:left">
                                                            <input required name="e_enddate" type="date" id="e_enddate" value="<cfif IsDefined("url.e_startdate")>#Dateformat(url.e_enddate,'d-mmm-yyyy')#</cfif>"
                                                            class="form-control flatpickr-input" style="width:200px;height:36px;float:left">
                                                            <input name="searchbtn" type="submit" value="View" style="width:100px;height:36px;background-color:black;color:white;">
                                                        </div>
                                                    </form>
                                                </cfoutput>
                                            </td>
                                        </tr>
                                    </table>
                                    <cfoutput query="q" group="directorate_name">
                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <!--- <tr>
                                                        <td colspan="13" style="color:##5c2484;font-size:20px;font-weight:bold">
                                                            <cfif IsDefined("session.userdetails.canviewdivision")>
                                                                #q.directorate_name#
                                                                <cfelseif IsDefined("session.userdetails.canviewregion")>
                                                                    #q.region_name#
                                                                    <cfelseif IsDefined("session.userdetails.canviewzone")>
                                                                        #q.zone_name#
                                                                        <cfelse>
                                                                            #q.directorate_name#
                                                            </cfif>
                                                        </td>
                                                    </tr>--->
                                                    <tr>
                                                        <th colspan="10"><h4 class="p-3">#q.directorate_name#</h4></th>
                                                    </tr>
                                                    <tr class="bg-primary text-dark">
                                                        <td nowrap="nowrap">Branch Code</td>
                                                        <td class="myModal">Branch Name</td>
                                                        <td class="myModal">Zone Name</td>
                                                        <td class="myModal">Region Name</td>
                                                        <td class="myModal" width="150">Accounts Opened</td>
                                                        <td class="myModal" width="150">Without Debit Cards</td>
                                                        <td class="myModal" width="150">Without USSD</td>
                                                        <td class="myModal" width="150">Without ALAT</td>
                                                        <td class="myModal" width="150">Without ALAT Business</td>
                                                        <td class="myModal" width="150">Zero Balance</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <cfoutput>
                                                        <tr valign="top">
                                                            <td class="tab_left myModal">#q.branch_code#</td>
                                                            <td class="myModal" nowrap="nowrap">#q.branch_name#</td>
                                                            <td class="myModal" nowrap="nowrap">#q.zone_name#</td>
                                                            <td class="myModal" nowrap="nowrap">#q.region_name#</td>
                                                            <td class="myModal">#NumberFormat(q.accounts,'999,999')#</td>
                                                            <td class="myModal"><a
                                                                    href="apps/#url.app#&entity_code=#q.branch_code#&p_context=1&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#">#NumberFormat(q.no_number_of_debit_cards,'999,999')#</a>
                                                            </td>
                                                            <td><a
                                                                    href="apps/#url.app#&entity_code=#q.branch_code#&p_context=2&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#">#NumberFormat(q.no_ussd,'999,999')#</a>
                                                            </td>
                                                            <td><a
                                                                    href="apps/#url.app#&entity_code=#q.branch_code#&p_context=3&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#">#NumberFormat(q.no_ALAT,'999,999')#</a>
                                                            </td>
                                                            <td><a
                                                                    href="apps/#url.app#&entity_code=#q.branch_code#&p_context=4&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#">#NumberFormat(q.no_ALAT_Business,'999,999')#</a>
                                                            </td>
                                                            <td><a
                                                                    href="apps/#url.app#&entity_code=#q.branch_code#&p_context=5&e_startdate=#DateFormat(url.e_startdate,'d-mmm-yyyy')#&e_enddate=#DateFormat(url.e_enddate,'d-mmm-yyyy')#">#NumberFormat(q.no_balance,'999,999')#</a>
                                                            </td>
                                                        </tr>
                                                    </cfoutput>
                                                </tbody>
                                                <tr>
                                                    <td colspan="13" style="border:none;border-right:none;height:30px;">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                </cfoutput>
        </div>
        </div>
    </div>
</div>
</div>
</cfcase>

</cfswitch>

<!-- modal -->

<div class="modal" backdrop="static" tabindex="-1" id="modalD">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
    </div>
  </div>
</div>


 <!-- Styles -->
<script>
    window.addEventListener('DOMContentLoaded', function() {
        const myModal = document.getElementsByClassName('myModal')
        const close = document.querySelector('.btn-close')
        
        // const modal = document.getElementByID('modalD')
        var modal = document.getElementById("modalD");

        // var modals = new bootstrap.Modal(document.getElementsByClassName('modal'));

        // shown.bs.modal

        Array.from(myModal).forEach(btn => {
            btn.addEventListener('click', () => {
                // alert(JSON.stringify(modal))
                modal.style.display = 'block'
                // modal.classList.add("show")
                // alert('don')
                // modal.show()
                // $(modal).modal({backdrop: true});
            })

        })

        close.addEventListener('click', () => {
            modal.style.display = 'none'
           
        })

        function generatePDF() {
            const element = document.getElementById('digital_analysis');
            htmlpdf()
            .from(element)
            .save();

        }
    })
</script>