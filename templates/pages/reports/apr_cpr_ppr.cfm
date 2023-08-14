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
    <li><a onclick="export2Word(window.apr_cpr_ppr); return false;" href="#" class="download-item">Download Ms-word</a></li>
    <li><a onclick="downloadPPT(event); return false;" href="#" class="download-item">Download powerpoint</a></li>
  </ul>
</div>
</div>

<!--<script src="https://cdn.jsdelivr.net/npm/pptxgenjs@3.12.0/dist/pptxgen.bundle.js"></script>-->
<script src="https://cdn.jsdelivr.net/npm/pptxgenjs/dist/pptxgen.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/pptxgenjs@3.12.0/dist/pptxgen.bundle.js"></script>

<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://unpkg.com/docxtemplater"></script>
<script src="https://unpkg.com/html-to-docx"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>




<script>
    function createPDF() {
        var sTable = document.getElementById('apr_cpr_ppr').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=700,width=700');

        win.document.write('<html><head>');
        win.document.write('<title>apr_cpr_ppr</title>');   // <title> FOR PDF HEADER.
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
            var elt = document.getElementById('apr_cpr_ppr');
            var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
                             return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('apr_cpr_ppr-sheet.' + (type || 'xlsx')));
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
  link.download = 'apr_cpr_ppr'; // default name without extension
  document.body.appendChild(link);
  if (navigator.msSaveOrOpenBlob) navigator.msSaveOrOpenBlob(blob, 'document.doc'); // IE10-11
  else link.click(); // other browsers
  document.body.removeChild(link);
};



function downloadPPT(event) {
  event.preventDefault();

  // Create a new Presentation
  var pres = new PptxGenJS();

  // Get the HTML table element report_table
  var table = document.getElementById('report_table');

  // Convert the HTML table to an array of arrays representing rows and cells
  var tableData = [];
  var rows = table.rows;
  for (var i = 0; i < rows.length; i++) {
    var cells = rows[i].cells;
    var rowData = [];
    for (var j = 0; j < cells.length; j++) {
      var cell = cells[j];
      var cellContent = cell.innerText;
      rowData.push(cellContent);
    }
    tableData.push(rowData);
  }

  // Define the dimensions and spacing of each cell
  var cellWidth = 2; // Width of each cell
  var cellHeight = 1; // Height of each cell
  var cellSpacing = 0.5; // Spacing between cells

  var slideHeight = 7.5; // Height of each slide in inches
  var maxRowsPerSlide = Math.floor((slideHeight - 1) / (cellHeight + cellSpacing)); // Maximum rows per slide

  var currentSlide;
  var currentRow = 0;

  // Iterate over the table rows
  for (var i = 0; i < rows.length; i++) {
    var cells = rows[i].cells;

    // Check if a new slide needs to be created
    if (currentRow % maxRowsPerSlide === 0) {
      currentSlide = pres.addSlide();
      currentRow = 0;
    }

    // Iterate over the cells in each row
    for (var j = 0; j < cells.length; j++) {
      var cell = cells[j];

      // Get the text content of the cell
      var cellContent = cell.innerText;

      // Calculate the position of the cell
      var xPos = j * (cellWidth + cellSpacing);
      var yPos = currentRow * (cellHeight + cellSpacing);

      // Add the text content to the slide
      currentSlide.addText(cellContent, { x: xPos, y: yPos, w: cellWidth, h: cellHeight });
    }

    currentRow++;
  }

  // Save the presentation
  pres.writeFile({ fileName: 'Sample_Presentation.pptx' });
}









   
    
</script>


<cfswitch expression="#url.view#">

    <cfdefaultcase>
        <cfsilent>
            <cfquery name="location" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit#reporting_month#
                order by directorate_name,region_name
            </cfquery>
        </cfsilent>

        <div class="row" id="apr_cpr_ppr">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Account/Customer/Product Profitability</h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Location</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="tabContent-deposits">
                        
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered" id="report_table">
                                        <cfoutput query="location" group="directorate_name">
                                            <thead>
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">#location.directorate_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" valign="middle">
                                                    <th width="1">S/N</th>
                                                    <th>Region</th>
                                                    <th width="100">View</th>
                                                </tr>
                                            </thead>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/regional&region_code=#location.region_code#">#location.region_name#</a></td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&region_code=#location.region_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="2">#location.directorate_name#</th>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&directorate_code=#location.directorate_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="2"></th>
                                                <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&directorate_code=#location.directorate_code#">View</a></td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </cfdefaultcase>

    <cfcase value="regional">
        <cfsilent>
            <cfquery name="location" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_region#reporting_month# 
                where region_code = '#url.region_code#'
                order by zone_name,branch_name
            </cfquery>
        </cfsilent>

        <div class="row" id="apr_cpr_ppr">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Account/Customer/Product Profitability</h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Location</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="tabContent-deposits">
                        
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="location" group="zone_name">
                                            <thead>
                                              <tr>
                                                <th colspan="21"><h4 class="p-3">#location.zone_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" valign="top">
                                                    <th width="1">S/N</th>
                                                    <th width="50">Sol ID</th>
                                                    <th>Branch</th>
                                                    <th width="100">Insights</th>
                                                </tr>
                                            </thead>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#location.branch_code#</td> 
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch&branch_code=#location.branch_code#">#location.branch_name#</a></td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&branch_code=#location.branch_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#location.zone_name#</th>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&zone_code=#location.zone_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </cfcase> 

    <cfcase value="branch">
        <cfsilent>
            <cfquery name="location" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_sbu#reporting_month# 
                where branch_code = '#url.branch_code#'
                order by sbu_name,account_officer_name
            </cfquery>
        </cfsilent>

        <div class="row" id="apr_cpr_ppr">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Account/Customer/Product Profitability</h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Location</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="tabContent-deposits">
                        
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="location" group="sbu_name">
                                            <thead>
                                              <tr>
                                                <th colspan="21"><h4 class="p-3">#location.sbu_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" valign="top">
                                                    <th width="1">S/N</th>
                                                    <th width="50">AO Code</th>
                                                    <th>Account Officer</th>
                                                    <th width="100">Insights</th>
                                                </tr>
                                            </thead>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#location.account_officer_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/accounts&account_officer_code=#location.account_officer_code#">#location.account_officer_name#</a></td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&account_officer_code=#location.account_officer_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#location.sbu_name#</th>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&sbu_code=#location.sbu_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </cfcase>


    <cfcase value="insights" >
        <cfsilent>
            <cfquery name="titles" datasource="wemalytics">
                select top 1 
                <cfif IsDefined("url.directorate_code")> 'Directorate' entity_level,directorate_code entity_code,directorate_name entity_name
                <cfelseif IsDefined("url.region_code")> 'Region' entity_level,region_code entity_code,region_name entity_name
                <cfelseif IsDefined("url.zone_code")> 'Zone' entity_level,zone_code entity_code,zone_name entity_name
                <cfelseif IsDefined("url.branch_code")>  'Branch' entity_level,branch_code entity_code,branch_name entity_name
                <cfelseif IsDefined("url.sbu_code")>  'SBU' entity_level,sbu_code entity_code,sbu_name entity_name
                <cfelseif IsDefined("url.account_officer_code")> 'Account Officer' entity_level,account_officer_code entity_code,account_officer_name entity_name 
                <cfelse> 'Global Bank' entity_level,'Wema' entity_code,'Wema Bank' entity_name
                </cfif>
                from wvx_dim_account_officers 
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
            </cfquery>    
        
            <cfquery name="apr" datasource="wemalytics">
                select top 1000 *
                from dim_apr#reporting_month# 
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif> 
                order by profit_amount desc
            </cfquery> 

            <cfquery name="cpr" datasource="wemalytics">
                select top 1000 customer_ID,customer_name,count(1) no_of_accounts,sum(ledger_balance)ledger_balance
                ,sum(average_credit_balance)average_credit_balance,sum(average_debit_balance)average_debit_balance,sum(interest_expense)interest_expense,sum(interest_income)interest_income
                ,sum(account_maintenance_fee)account_maintenance_fee,sum(off_balance_sheet_fees)off_balance_sheet_fees,sum(ebusiness_income)ebusiness_income,sum(fx)fx,sum(Other_Income)Other_Income
                ,sum(total_fees)total_fees,sum(gross_pool_contribution_borrowing)gross_pool_contribution_borrowing,sum(pool_income_expense)pool_income_expense,sum(regulatory)regulatory,sum(regulatory_expense)regulatory_expense
                ,sum(regulatory_income)regulatory_income,sum(ndic)ndic,sum(gllp)gllp,sum(sllp)sllp,sum(pool_contribution_borrowing)pool_contribution_borrowing,sum(nrff)nrff
                ,sum(amcon)amcon,sum(subsidy)subsidy,sum(total_expenses)total_expenses,sum(profit_amount)profit_amount 
                from dim_apr#reporting_month# 
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                group by customer_ID,customer_name 
                order by sum(profit_amount) desc
            </cfquery>

            <cfquery name="ppr" datasource="wemalytics">
                select top 1000 product_code,product_name,count(1) no_of_accounts,sum(ledger_balance)ledger_balance
                ,sum(average_credit_balance)average_credit_balance,sum(average_debit_balance)average_debit_balance,sum(interest_expense)interest_expense,sum(interest_income)interest_income
                ,sum(account_maintenance_fee)account_maintenance_fee,sum(off_balance_sheet_fees)off_balance_sheet_fees,sum(ebusiness_income)ebusiness_income,sum(fx)fx,sum(Other_Income)Other_Income
                ,sum(total_fees)total_fees,sum(gross_pool_contribution_borrowing)gross_pool_contribution_borrowing,sum(pool_income_expense)pool_income_expense,sum(regulatory)regulatory,sum(regulatory_expense)regulatory_expense
                ,sum(regulatory_income)regulatory_income,sum(ndic)ndic,sum(gllp)gllp,sum(sllp)sllp,sum(pool_contribution_borrowing)pool_contribution_borrowing,sum(nrff)nrff
                ,sum(amcon)amcon,sum(subsidy)subsidy,sum(total_expenses)total_expenses,sum(profit_amount)profit_amount 
                from dim_apr#reporting_month# 
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                group by product_code,product_name 
                order by sum(profit_amount) desc
            </cfquery>
        </cfsilent>

        <div class="row" id="apr_cpr_ppr">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Account/Customer/Product Profitability <sup><cfoutput>#titles.entity_name#</cfoutput></sup></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Account</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab2" role="tab" aria-selected="true">Customer</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab3" role="tab" aria-selected="true">Product</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="tabContent-deposits">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr class="bg-primary text-dark">
                                                <th width="1">S/N</th>
                                                <th>Account No</th>
                                                <th>Account Name</th>
                                                <th width="100">Ledger</th>
                                                <th width="100">AvG Credit</th>
                                                <th width="100">AvG Debit</th>
                                                <th width="100">Pool Contribution</th>
                                                <th width="100">Int Income</th>
                                                <th width="100">Int Expense</th>
                                                <th width="100">Pool Income/Expense</th>
                                                <th width="100">NRFF</th>
                                                <th width="100">Fee Income</th>
                                                <th width="100">AMCON</th>
                                                <th width="100">NDIC</th>
                                                <th width="100">Profit</th>
                                            </tr>
                                        </thead>
                                        <cfset rownumber = 0 />
                                        <cfoutput query="apr"> 
                                            <cfset rownumber = rownumber + 1 />
                                            <tr>
                                                <td>#rownumber#</td>
                                                <td>#apr.account_number#</td>
                                                <td>#apr.account_name#</td>
                                                <td>#Numberformat(apr.ledger_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.average_credit_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.average_debit_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.pool_contribution_borrowing/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.interest_income/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.interest_expense/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.pool_income_expense/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.nrff/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.total_fees/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.amcon/1000,'(999,999)')#</td>
                                                <td>#Numberformat(apr.ndic/1000,'(999,999)')#</td>
                                                <td class="fw-bold">#Numberformat(apr.profit_amount/1000,'(999,999)')#</td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade show active" id="tab2" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr class="bg-primary text-dark">
                                                <th width="1">S/N</th>
                                                <th>Customer ID</th>
                                                <th>Customer Name</th>
                                                <th width="100">Ledger</th>
                                                <th width="100">AvG Credit</th>
                                                <th width="100">AvG Debit</th>
                                                <th width="100">Pool Contribution</th>
                                                <th width="100">Int Income</th>
                                                <th width="100">Int Expense</th>
                                                <th width="100">Pool Income/Expense</th>
                                                <th width="100">NRFF</th>
                                                <th width="100">Fee Income</th>
                                                <th width="100">AMCON</th>
                                                <th width="100">NDIC</th>
                                                <th width="100">Profit</th>
                                            </tr>
                                        </thead>
                                        <cfset rownumber = 0 />
                                        <cfoutput query="cpr"> 
                                            <cfset rownumber = rownumber + 1 />
                                            <tr>
                                                <td>#rownumber#</td>
                                                <td>#cpr.customer_ID#</td>
                                                <td>#cpr.customer_name#</td>
                                                <td>#Numberformat(cpr.ledger_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.average_credit_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.average_debit_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.pool_contribution_borrowing/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.interest_income/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.interest_expense/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.pool_income_expense/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.nrff/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.total_fees/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.amcon/1000,'(999,999)')#</td>
                                                <td>#Numberformat(cpr.ndic/1000,'(999,999)')#</td>
                                                <td class="fw-bold">#Numberformat(cpr.profit_amount/1000,'(999,999)')#</td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade show active" id="tab3" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr class="bg-primary text-dark">
                                                <th width="1">S/N</th>
                                                <th>Code</th>
                                                <th>Preoduct Name</th>
                                                <th width="100">Ledger</th>
                                                <th width="100">AvG Credit</th>
                                                <th width="100">AvG Debit</th>
                                                <th width="100">Pool Contribution</th>
                                                <th width="100">Int Income</th>
                                                <th width="100">Int Expense</th>
                                                <th width="100">Pool Income/Expense</th>
                                                <th width="100">NRFF</th>
                                                <th width="100">Fee Income</th>
                                                <th width="100">AMCON</th>
                                                <th width="100">NDIC</th>
                                                <th width="100">Profit</th>
                                            </tr>
                                        </thead>
                                        <cfset rownumber = 0 />
                                        <cfoutput query="ppr"> 
                                            <cfset rownumber = rownumber + 1 />
                                            <tr>
                                                <td>#rownumber#</td>
                                                <td>#ppr.product_code#</td>
                                                <td>#ppr.product_name#</td>
                                                <td>#Numberformat(ppr.ledger_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.average_credit_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.average_debit_balance/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.pool_contribution_borrowing/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.interest_income/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.interest_expense/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.pool_income_expense/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.nrff/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.total_fees/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.amcon/1000,'(999,999)')#</td>
                                                <td>#Numberformat(ppr.ndic/1000,'(999,999)')#</td>
                                                <td class="fw-bold">#Numberformat(ppr.profit_amount/1000,'(999,999)')#</td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>
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
            const element = document.getElementById('apr_cpr_ppr');
            htmlpdf()
            .from(element)
            .save();

        }
    })
</script>