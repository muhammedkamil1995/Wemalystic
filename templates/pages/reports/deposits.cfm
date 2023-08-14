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
    <li><a onclick="exportHTML(); return false;" href="#" class="download-item">Download Ms-word</a></li>
    <li><a onclick="downloadPPT(event); return false;"  href="#" class="download-item">Download powerpoint</a></li>
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
        var sTable = document.getElementById('deposits').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=700,width=700');
        let date = new Date().toLocaleDateString();
        

        win.document.write('<html><head>');
        win.document.write(`<title>Deposits</title>`);   // <title> FOR PDF HEADER.
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
        win.document.write('</body></html>');
       
         
 

    }

    function ExportToExcel(type, fn, dl) {
            
            var elt = document.getElementById('deposits');
            var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
                             return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('deposits-sheet.' + (type || 'xlsx')));
                
        }

 function exportHTML(){
       var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' "+
            "xmlns:w='urn:schemas-microsoft-com:office:word' "+
            "xmlns='http://www.w3.org/TR/REC-html40'>"+
            "<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title></head><body>";
       var footer = "</body></html>";
       var sourceHTML = header+document.getElementById("deposits").innerHTML+footer;
       
       var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(sourceHTML);
       var fileDownload = document.createElement("a");
       document.body.appendChild(fileDownload);
       fileDownload.href = source;
       fileDownload.download = 'document.doc';
       fileDownload.click();
       document.body.removeChild(fileDownload);
    }


    



function downloadPPT(event) {
  event.preventDefault();

  // Create a new Presentation
  var pres = new PptxGenJS();

  // Get the HTML table element report_table
  var table = document.getElementById('deposit_pptx');

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
     <cfquery name = "dates" datasource = "wemalytics">
            select dateadd(d,-1,report_to_date)e_start_date,report_to_date e_end_date from settings_dates
        </cfquery>

        <cfif Not IsDefined("url.e_startdate")>
            <cfset url.e_startdate = dates.e_start_date />
        </cfif>

        <cfif Not IsDefined("url.e_enddate")>
            <cfset url.e_enddate = dates.e_end_date />
        </cfif>  

        <cfsilent>
            <cfquery name="location" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit#reporting_month#
                order by directorate_name,region_name
            </cfquery>

            <cfquery name="location_total" dbtype="query">
                select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense from location
                group by number_of_days,days_in_year
            </cfquery>

            <cfquery name="gl" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_class#reporting_month#
                order by directorate_name,region_name,deposit_class
            </cfquery>

            <cfquery name="gl_total" dbtype="query">
                select number_of_days,days_in_year,deposit_class,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense 
                from gl
                group by deposit_class,number_of_days,days_in_year
                order by deposit_class
            </cfquery>

            <cfquery name="segments" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_segment#reporting_month#
                order by directorate_name,region_name,balance_sheet_segment
            </cfquery>

            <cfquery name="segments_total" dbtype="query">
                select balance_sheet_segment,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense 
                from segments
                group by balance_sheet_segment
                order by balance_sheet_segment
            </cfquery>

            <cfquery name="mm" dbtype="query">
                select sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense from segments
            </cfquery>

            <cfquery name="cohort" datasource="wemalytics">
                select directorate_code,directorate_name,region_code,region_name,balance_band_rank,sum(no_of_accounts)no_of_accounts,sum(ledger_balance)ledger_balance,sum(total_accounts)total_accounts
                from cubes.dbo.fact_deposit_balance_band
                group by directorate_code,directorate_name,region_code,region_name,balance_band_rank
                order by directorate_name,region_name,balance_band_rank
            </cfquery>

            <cfquery name="cohort_total" dbtype="query">
                select balance_band_rank,sum(no_of_accounts)no_of_accounts,sum(ledger_balance)ledger_balance,sum(total_accounts)total_accounts
                from cohort
                group by balance_band_rank
                order by balance_band_rank
            </cfquery>
        </cfsilent>
        
        
        
        
        <div class="row"  id="deposits">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Deposits Report (N'000)</h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Location</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab2" role="tab" aria-selected="false">Class</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab3" role="tab" aria-selected="false">SBU</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab4" role="tab" aria-selected="false">Cohort</a>
                            </li>
                        </ul>
                    </div>

                    
                    <div class="card-body">
                        <div class="tab-content" id="tabContent-deposits">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered" id="deposit_pptx">
                                        <cfoutput query="location" group="directorate_name">
                                            <thead>
                                              <tr>
                                                <th class="myModal" colspan="10"><h4 class="p-3">#location.directorate_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-black">
                                                    <th width="1">S/N</th>
                                                    <th>Region</th>
                                                    <th class="myModal" width="100">Ledger</th>
                                                    <th class="myModal" width="100">Average</th>
                                                    <th class="myModal" width="100">Budget</th>
                                                    <th class="myModal" width="100">%Budget</th>
                                                    <th class="myModal"  width="100">Int Expense</th>
                                                    <th class="myModal" width="100">WACC</th>
                                                    <th class="myModal" width="100">Insights</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="location_sub_total" dbtype="query">
                                                    select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from location 
                                                    where directorate_name='#trim(location.directorate_name)#'
                                                    group by number_of_days,days_in_year
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/regional&region_code=#location.region_code#">#location.region_name#</a></td>
                                                        <td class="myModal">#Numberformat(location.ledger_balance/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.average_balance/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.target_value/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.target_performance,'999,999.9')#%</td>
                                                        <td class="myModal">#Numberformat(location.interest_expense/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.cost_of_funds,'999,999.9')#%</td>
                                                        <td class="myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&region_code=#location.region_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="2">#location.directorate_name#</th>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.ledger_balance/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.average_balance/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.target_value/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal"><cftry>#Numberformat(location_sub_total.average_balance/location_sub_total.target_value*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.interest_expense/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal"><cftry>#NumberFormat(val(location_sub_total.interest_expense)/val(location_sub_total.average_balance)*val(location_sub_total.days_in_year)/val(location_sub_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&directorate_code=#location.directorate_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="9"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="2"></th>
                                                <td class="fw-bold myModal">#Numberformat(location_total.ledger_balance/1000,'999,999')#</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.average_balance/1000,'999,999')#</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.target_value/1000,'999,999')#</td>
                                                <td class="fw-bold myModal"><cftry>#Numberformat(location_total.average_balance/location_total.target_value*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.interest_expense/1000,'999,999')#</td>
                                                <td class="fw-bold myModal"><cftry>#NumberFormat(val(location_total.interest_expense)/val(location_total.average_balance)*val(location_total.days_in_year)/val(location_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                <td></td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab2" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="gl" group="directorate_name">
                                            <thead>
                                              <tr>
                                                <th colspan="10"><h4 class="p-3">#gl.directorate_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>Region</th>
                                                    <th class="myModal" width="100">Call</th>
                                                    <th class="myModal" width="100">Demand</th>
                                                    <th class="myModal" width="100">Domiciliary</th>
                                                    <th class="myModal" width="100">Savings</th>
                                                    <th class="myModal" width="100">Time</th>
                                                    <th class="myModal" width="100">Total</th>
                                                    <th class="myModal" width="100">Low Cost</th>
                                                    <th class="myModal" width="100">LCD Ratio</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="gl_sub_total" dbtype="query">
                                                    select deposit_class,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from gl 
                                                    where directorate_name='#trim(gl.directorate_name)#'
                                                    group by deposit_class 
                                                    order by deposit_class
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group="region_name"> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/regional&region_code=#gl.region_code#">#gl.region_name#</a></td>
                                                        <cfset average_balance_total = 0 />
                                                        <cfset low_cost_average = 0 />
                                                        <cfoutput>
                                                            <cfset average_balance_total = average_balance_total + gl.average_balance />
                                                            <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl.deposit_class)>
                                                                <cfset low_cost_average = low_cost_average + gl.average_balance />
                                                            </cfif>
                                                            <td>#Numberformat(gl.average_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                        <td>#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                        <td>#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                        <td><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="2">#gl.directorate_name#</th>
                                                    <cfset average_balance_total = 0 />
                                                    <cfset low_cost_average = 0 />
                                                    <cfloop query="gl_sub_total">
                                                        <cfset average_balance_total = average_balance_total + gl_sub_total.average_balance />
                                                        <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl_sub_total.deposit_class)>
                                                            <cfset low_cost_average = low_cost_average + gl_sub_total.average_balance />
                                                        </cfif>
                                                        <td class="fw-bold">#Numberformat(gl_sub_total.average_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                    <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                            <tr>
                                                <th colspan="10"><h4 class="p-3">Global Total</h4></th>
                                            </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="2"></th>
                                                <cfset average_balance_total = 0 />
                                                <cfset low_cost_average = 0 />
                                                <cfloop query="gl_total">
                                                    <cfset average_balance_total = average_balance_total + gl_total.average_balance />
                                                    <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl_total.deposit_class)>
                                                        <cfset low_cost_average = low_cost_average + gl_total.average_balance />
                                                    </cfif>
                                                    <td class="fw-bold">#Numberformat(gl_total.average_balance/1000,'999,999')#</td>
                                                </cfloop>
                                                <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                        </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>
                            

                            <div class="tab-pane fade" id="tab3" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="segments" group="directorate_name">
                                            <thead>
                                              <tr>
                                                <th colspan="9"><h4 class="p-3">#segments.directorate_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>Region</th>
                                                    <th width="100">BDM</th>
                                                    <th width="100">Commercial</th>
                                                    <th width="100">Corporate</th>
                                                    <th width="100">Public Sector</th>
                                                    <th width="100">Retail</th>
                                                    <th width="100">Treasury</th>
                                                    <th width="100">Total</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="segments_sub_total" dbtype="query">
                                                    select balance_sheet_segment,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from segments 
                                                    where directorate_name='#trim(segments.directorate_name)#'
                                                    group by balance_sheet_segment 
                                                    order by balance_sheet_segment
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group="region_name"> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/regional&region_code=#segments.region_code#">#segments.region_name#</a></td>
                                                        <cfset average_balance_total = 0 />
                                                        <cfoutput>
                                                            <cfset average_balance_total = average_balance_total + segments.average_balance />
                                                            <td>#Numberformat(segments.average_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                        <td>#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="2">#segments.directorate_name#</th>
                                                    <cfset average_balance_total = 0 />
                                                    <cfloop query="segments_sub_total">
                                                        <cfset average_balance_total = average_balance_total + segments_sub_total.average_balance />
                                                        <td class="fw-bold">#Numberformat(segments_sub_total.average_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                    <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                            <tr>
                                                <th colspan="9"><h4 class="p-3">Global Total</h4></th>
                                            </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="2"></th>
                                                <cfset average_balance_total = 0 />
                                                <cfloop query="segments_total">
                                                    <cfset average_balance_total = average_balance_total + segments_total.average_balance />
                                                    <td class="fw-bold">#Numberformat(segments_total.average_balance/1000,'999,999')#</td>
                                                </cfloop>
                                                <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="cohorts-tab">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="cohort" group="directorate_name">
                                            <thead>
                                              <tr>
                                                <th colspan="16"><h4 class="p-3">#cohort.directorate_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th class="myModal" rowspan="2" width="1">S/N</th>
                                                    <th class="myModal" rowspan="2" align="left">Region</th>
                                                    <th class="myModal" colspan="2" width="100" align="center">BOP</th>
                                                    <th class="myModal" colspan="2" width="100" align="center">Mass Market</th>
                                                    <th class="myModal" colspan="2" width="100" align="center">Classic</th>
                                                    <th class="myModal" colspan="2" width="100" align="center">Mass Affluent</th>
                                                    <th class="myModal" colspan="2" width="100" align="center">Super Affluent</th>
                                                    <th class="myModal" colspan="2" width="100" align="center">HNI</th>
                                                    <th class="myModal" colspan="2" width="100" align="center">Ultra HNI</th>
                                                </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="cohort_sub_total" dbtype="query">
                                                    select balance_band_rank,sum(ledger_balance)ledger_balance,sum(no_of_accounts)no_of_accounts
                                                    from cohort 
                                                    where directorate_name='#trim(cohort.directorate_name)#'
                                                    group by balance_band_rank
                                                    order by balance_band_rank
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group = "region_name">
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/regional&region_code=#cohort.region_code#">#cohort.region_name#</a></td>
                                                        <cfoutput>
                                                            <td >#Numberformat(cohort.no_of_accounts,'999,999')#</td>
                                                            <td>#Numberformat(cohort.ledger_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="2">#cohort.directorate_name#</th>
                                                    <cfloop query="cohort_sub_total">
                                                            <td class="fw-bold">#Numberformat(cohort_sub_total.no_of_accounts,'999,999')#</td>
                                                            <td class="fw-bold">#Numberformat(cohort_sub_total.ledger_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="16"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="2"></th>
                                                <cfloop query="cohort_total">
                                                        <td class="fw-bold">#Numberformat(cohort_total.no_of_accounts,'999,999')#</td>
                                                        <td class="fw-bold">#Numberformat(cohort_total.ledger_balance/1000,'999,999')#</td>
                                                </cfloop>
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

            <cfquery name="location_total" dbtype="query">
                select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense from location
                group by number_of_days,days_in_year
            </cfquery>

            <cfquery name="gl" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_class_region#reporting_month# 
                 where region_code = '#url.region_code#'
                order by zone_name,branch_name,deposit_class
            </cfquery>

            <cfquery name="gl_total" dbtype="query">
                select
                number_of_days,days_in_year,deposit_class,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense 
                from gl
                group by deposit_class,number_of_days,days_in_year
                order by deposit_class
            </cfquery>

            <cfquery name="segments" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_segment_region#reporting_month# 
                 where region_code = '#url.region_code#'
                order by zone_name,branch_name,balance_sheet_segment
            </cfquery>

            <cfquery name="segments_total" dbtype="query">
                select
                number_of_days,days_in_year,balance_sheet_segment,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense 
                from segments
                group by balance_sheet_segment,number_of_days,days_in_year
                order by balance_sheet_segment
            </cfquery>

            <cfquery name="cohort" datasource="wemalytics">
                select zone_code,zone_name,branch_code,branch_name,balance_band_rank,sum(no_of_accounts)no_of_accounts,sum(ledger_balance)ledger_balance,sum(total_accounts)total_accounts
                from cubes.dbo.fact_deposit_balance_band 
                 where region_code = '#url.region_code#'
                group by zone_code,zone_name,branch_code,branch_name,balance_band_rank
                order by zone_name,branch_name,balance_band_rank
            </cfquery>

            <cfquery name="cohort_total" dbtype="query">
                select balance_band_rank,sum(no_of_accounts)no_of_accounts,sum(ledger_balance)ledger_balance,sum(total_accounts)total_accounts
                from cohort
                group by balance_band_rank
                order by balance_band_rank
            </cfquery>
        </cfsilent>

        <div class="row" id="deposits">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Deposits Report (N'000): <sup><cfoutput>#location.region_name#</cfoutput></sup></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Location</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab2" role="tab" aria-selected="false">Class</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab3" role="tab" aria-selected="false">SBU</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab4" role="tab" aria-selected="false">Cohort</a>
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
                                                <th colspan="10"><h4 class="p-3">#location.zone_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>Sol ID</th>
                                                    <th>Branch</th>
                                                    <th width="100">Ledger</th>
                                                    <th width="100">Average</th>
                                                    <th width="100">Budget</th>
                                                    <th width="100">%Budget</th>
                                                    <th width="100">Int Expense</th>
                                                    <th width="100">WACC</th>
                                                    <th width="100">Insights</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="location_sub_total" dbtype="query">
                                                    select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from location 
                                                    where zone_name='#trim(location.zone_name)#'
                                                    group by number_of_days,days_in_year
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#location.branch_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch&branch_code=#location.branch_code#">#location.branch_name#</a></td>
                                                        <td class="myModal">#Numberformat(location.ledger_balance/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.average_balance/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.target_value/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.target_performance,'999,999.9')#%</td>
                                                        <td class="myModal">#Numberformat(location.interest_expense/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.cost_of_funds,'999,999.9')#%</td>
                                                        <td class="myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&branch_code=#location.branch_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#location.zone_name#</th>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.ledger_balance/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.average_balance/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.target_value/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal"><cftry>#Numberformat(location_sub_total.average_balance/location_sub_total.target_value*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.interest_expense/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal"><cftry>#NumberFormat(val(location_sub_total.interest_expense)/val(location_sub_total.average_balance)*val(location_sub_total.days_in_year)/val(location_sub_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&zone_code=#location.zone_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="9"><h4 class="p-3">#location.region_name# Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <td class="fw-bold myModal">#Numberformat(location_total.ledger_balance/1000,'999,999')#</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.average_balance/1000,'999,999')#</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.target_value/1000,'999,999')#</td>
                                                <td class="fw-bold myModal"><cftry>#Numberformat(location_total.average_balance/location_total.target_value*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.interest_expense/1000,'999,999')#</td>
                                                <td class="fw-bold myModal"><cftry>#NumberFormat(val(location_total.interest_expense)/val(location_total.average_balance)*val(location_total.days_in_year)/val(location_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                <td></td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab2" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="gl" group="zone_name">
                                            <thead>
                                              <tr>
                                                <th colspan="11"><h4 class="p-3">#gl.zone_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>Sol ID</th>
                                                    <th>Branch</th>
                                                    <th width="100">Call</th>
                                                    <th width="100">Demand</th>
                                                    <th width="100">Domiciliary</th>
                                                    <th width="100">Savings</th>
                                                    <th width="100">Time</th>
                                                    <th width="100">Total</th>
                                                    <th width="100">Low Cost</th>
                                                    <th width="100">LCD Ratio</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="gl_sub_total" dbtype="query">
                                                    select deposit_class,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from gl 
                                                    where zone_name='#trim(gl.zone_name)#'
                                                    group by deposit_class 
                                                    order by deposit_class
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group="branch_name"> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#gl.branch_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch&branch_code=#gl.branch_code#">#gl.branch_name#</a></td>
                                                        <cfset average_balance_total = 0 />
                                                        <cfset low_cost_average = 0 />
                                                        <cfoutput>
                                                            <cfset average_balance_total = average_balance_total + gl.average_balance />
                                                            <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl.deposit_class)>
                                                                <cfset low_cost_average = low_cost_average + gl.average_balance />
                                                            </cfif>
                                                            <td>#Numberformat(gl.average_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                        <td>#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                        <td>#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                        <td><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#gl.zone_name#</th>
                                                    <cfset average_balance_total = 0 />
                                                    <cfset low_cost_average = 0 />
                                                    <cfloop query="gl_sub_total">
                                                        <cfset average_balance_total = average_balance_total + gl_sub_total.average_balance />
                                                        <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl_sub_total.deposit_class)>
                                                            <cfset low_cost_average = low_cost_average + gl_sub_total.average_balance />
                                                        </cfif>
                                                    <td class="fw-bold">#Numberformat(gl_sub_total.average_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                    <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                            <tr>
                                                <th colspan="10"><h4 class="p-3">#gl.region_name# Total</h4></th>
                                            </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <cfset average_balance_total = 0 />
                                                <cfset low_cost_average = 0 />
                                                <cfloop query="gl_total">
                                                    <cfset average_balance_total = average_balance_total + gl_total.average_balance />
                                                    <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl_total.deposit_class)>
                                                        <cfset low_cost_average = low_cost_average + gl_total.average_balance />
                                                    </cfif>
                                                    <td class="fw-bold">#Numberformat(gl_total.average_balance/1000,'999,999')#</td>
                                                </cfloop>
                                                <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab3" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="segments" group="zone_name">
                                            <thead>
                                              <tr>
                                                <th colspan="10"><h4 class="p-3">#segments.zone_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>Sol ID</th>
                                                    <th>Branch</th>
                                                    <th width="100">BDM</th>
                                                    <th width="100">Commercial</th>
                                                    <th width="100">Corporate</th>
                                                    <th width="100">Public Sector</th>
                                                    <th width="100">Retail</th>
                                                    <th width="100">Treasury</th>
                                                    <th width="100">Total</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="segments_sub_total" dbtype="query">
                                                    select balance_sheet_segment,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from segments 
                                                    where zone_name='#trim(segments.zone_name)#'
                                                    group by balance_sheet_segment 
                                                    order by balance_sheet_segment
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group="branch_name"> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#segments.branch_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch&branch_code=#segments.branch_code#">#segments.branch_name#</a></td>
                                                        <cfset average_balance_total = 0 />
                                                        <cfoutput>
                                                            <cfset average_balance_total = average_balance_total + segments.average_balance />
                                                            <td>#Numberformat(segments.average_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                        <td>#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#segments.zone_name#</th>
                                                    <cfset average_balance_total = 0 />
                                                    <cfloop query="segments_sub_total">
                                                        <cfset average_balance_total = average_balance_total + segments_sub_total.average_balance />
                                                        <td class="fw-bold">#Numberformat(segments_sub_total.average_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                    <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                            <tr>
                                                <th colspan="10"><h4 class="p-3">#segments.region_name# Total</h4></th>
                                            </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <cfset average_balance_total = 0 />
                                                <cfloop query="segments_total">
                                                    <cfset average_balance_total = average_balance_total + segments_total.average_balance />
                                                    <td class="fw-bold">#Numberformat(segments_total.average_balance/1000,'999,999')#</td>
                                                </cfloop>
                                                <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="cohorts-tab">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="cohort" group="zone_name">
                                            <thead>
                                              <tr>
                                                <th colspan="17"><h4 class="p-3">#cohort.zone_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th rowspan="2" width="1">S/N</th>
                                                    <th rowspan="2" align="left">Sol ID</th>
                                                    <th rowspan="2" align="left">Branch</th>
                                                    <th colspan="2" width="100" align="center">BOP</th>
                                                    <th colspan="2" width="100" align="center">Mass Market</th>
                                                    <th colspan="2" width="100" align="center">Classic</th>
                                                    <th colspan="2" width="100" align="center">Mass Affluent</th>
                                                    <th colspan="2" width="100" align="center">Super Affluent</th>
                                                    <th colspan="2" width="100" align="center">HNI</th>
                                                    <th colspan="2" width="100" align="center">Ultra HNI</th>
                                                </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="cohort_sub_total" dbtype="query">
                                                    select balance_band_rank,sum(ledger_balance)ledger_balance,sum(no_of_accounts)no_of_accounts
                                                    from cohort 
                                                    where zone_name='#trim(cohort.zone_name)#'
                                                    group by balance_band_rank
                                                    order by balance_band_rank
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group = "branch_name">
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#cohort.branch_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch&branch_code=#cohort.branch_code#">#cohort.branch_name#</a></td>
                                                        <cfoutput>
                                                            <td>#Numberformat(cohort.no_of_accounts,'999,999')#</td>
                                                            <td>#Numberformat(cohort.ledger_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#cohort.zone_name#</th>
                                                    <cfloop query="cohort_sub_total">
                                                            <td class="fw-bold">#Numberformat(cohort_sub_total.no_of_accounts,'999,999')#</td>
                                                            <td class="fw-bold">#Numberformat(cohort_sub_total.ledger_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="17"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <cfloop query="cohort_total">
                                                        <td class="fw-bold">#Numberformat(cohort_total.no_of_accounts,'999,999')#</td>
                                                        <td class="fw-bold">#Numberformat(cohort_total.ledger_balance/1000,'999,999')#</td>
                                                </cfloop>
                                            </tr>
                                        </cfoutput>
                                    </table>
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

            <cfquery name="location_total" dbtype="query">
                select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense from location
                group by number_of_days,days_in_year
            </cfquery>

            <cfquery name="gl" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_class_sbu#reporting_month# 
                where branch_code = '#url.branch_code#'
                order by sbu_name,account_officer_name,deposit_class
            </cfquery>

            <cfquery name="gl_total" dbtype="query">
                select
                number_of_days,days_in_year,deposit_class,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense 
                from gl
                group by deposit_class,number_of_days,days_in_year
                order by deposit_class
            </cfquery>

            <cfquery name="segments" datasource="wemalytics">
                select * from cubes.dbo.fact_deposit_segment_sbu#reporting_month# 
                where branch_code = '#url.branch_code#'
                order by sbu_name,account_officer_name,balance_sheet_segment
            </cfquery>

            <cfquery name="segments_total" dbtype="query">
                select
                number_of_days,days_in_year,balance_sheet_segment,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
                sum(target_value)target_value,sum(interest_expense)interest_expense 
                from segments
                group by balance_sheet_segment,number_of_days,days_in_year
                order by balance_sheet_segment
            </cfquery>

            <cfquery name="cohort" datasource="wemalytics">
                select sbu_code,sbu_name,account_officer_code,account_officer_name,balance_band_rank,sum(no_of_accounts)no_of_accounts,sum(ledger_balance)ledger_balance,sum(total_accounts)total_accounts
                from cubes.dbo.fact_deposit_balance_band 
                where branch_code = '#url.branch_code#'
                group by sbu_code,sbu_name,account_officer_code,account_officer_name,balance_band_rank
                order by sbu_name,account_officer_name,balance_band_rank
            </cfquery>

            <cfquery name="cohort_total" dbtype="query">
                select balance_band_rank,sum(no_of_accounts)no_of_accounts,sum(ledger_balance)ledger_balance,sum(total_accounts)total_accounts
                from cohort
                group by balance_band_rank
                order by balance_band_rank
            </cfquery>
        </cfsilent>

        <div class="row" id="deposits">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Deposits Report (N'000) <sup><cfoutput>#location.branch_name#</cfoutput></sup></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Location</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab2" role="tab" aria-selected="false">Class</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab3" role="tab" aria-selected="false">SBU</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab4" role="tab" aria-selected="false">Cohort</a>
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
                                                <th colspan="10"><h4 class="p-3">#location.sbu_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>AO Code</th>
                                                    <th>Account Officer</th>
                                                    <th width="100">Ledger</th>
                                                    <th width="100">Average</th>
                                                    <th width="100">Budget</th>
                                                    <th width="100">%Budget</th>
                                                    <th width="100">Int Expense</th>
                                                    <th width="100">WACC</th>
                                                    <th width="100">Insights</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="location_sub_total" dbtype="query">
                                                    select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from location 
                                                    where sbu_name='#trim(location.sbu_name)#'
                                                    group by number_of_days,days_in_year
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#location.account_officer_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/accounts&account_officer_code=#location.account_officer_code#">#location.account_officer_name#</a></td>
                                                        <td class="myModal">#Numberformat(location.ledger_balance/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.average_balance/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.target_value/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.target_performance,'999,999.9')#%</td>
                                                        <td class="myModal">#Numberformat(location.interest_expense/1000,'999,999')#</td>
                                                        <td class="myModal">#Numberformat(location.cost_of_funds,'999,999.9')#%</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&account_officer_code=#location.account_officer_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#location.sbu_name#</th>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.ledger_balance/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.average_balance/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.target_value/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal"><cftry>#Numberformat(location_sub_total.average_balance/location_sub_total.target_value*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold myModal">#Numberformat(location_sub_total.interest_expense/1000,'999,999')#</td>
                                                    <td class="fw-bold myModal"><cftry>#NumberFormat(val(location_sub_total.interest_expense)/val(location_sub_total.average_balance)*val(location_sub_total.days_in_year)/val(location_sub_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&sbu_code=#location.sbu_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="9"><h4 class="p-3">#location.branch_name# Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <td class="fw-bold myModal">#Numberformat(location_total.ledger_balance/1000,'999,999')#</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.average_balance/1000,'999,999')#</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.target_value/1000,'999,999')#</td>
                                                <td class="fw-bold myModal"><cftry>#Numberformat(location_total.average_balance/location_total.target_value*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                <td class="fw-bold myModal">#Numberformat(location_total.interest_expense/1000,'999,999')#</td>
                                                <td class="fw-bold myModal"><cftry>#NumberFormat(val(location_total.interest_expense)/val(location_total.average_balance)*val(location_total.days_in_year)/val(location_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</td>
                                                <td></td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab2" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="gl" group="sbu_name">
                                            <thead>
                                              <tr>
                                                <th colspan="11"><h4 class="p-3">#gl.sbu_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>AO Code</th>
                                                    <th>Accout Officer</th>
                                                    <th width="100">Call</th>
                                                    <th width="100">Demand</th>
                                                    <th width="100">Domiciliary</th>
                                                    <th width="100">Savings</th>
                                                    <th width="100">Time</th>
                                                    <th width="100">Total</th>
                                                    <th width="100">Low Cost</th>
                                                    <th width="100">LCD Ratio</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="gl_sub_total" dbtype="query">
                                                    select deposit_class,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from gl 
                                                    where sbu_name='#trim(gl.sbu_name)#'
                                                    group by deposit_class 
                                                    order by deposit_class
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group="account_officer_name"> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#gl.account_officer_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/accounts&account_officer_code=#gl.account_officer_code#">#gl.account_officer_name#</a></td>
                                                        <cfset average_balance_total = 0 />
                                                        <cfset low_cost_average = 0 />
                                                        <cfoutput>
                                                            <cfset average_balance_total = average_balance_total + gl.average_balance />
                                                            <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl.deposit_class)>
                                                                <cfset low_cost_average = low_cost_average + gl.average_balance />
                                                            </cfif>
                                                            <td>#Numberformat(gl.average_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                        <td>#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                        <td>#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                        <td><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#gl.sbu_name#</th>
                                                    <cfset average_balance_total = 0 />
                                                    <cfset low_cost_average = 0 />
                                                    <cfloop query="gl_sub_total">
                                                        <cfset average_balance_total = average_balance_total + gl_sub_total.average_balance />
                                                        <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl_sub_total.deposit_class)>
                                                            <cfset low_cost_average = low_cost_average + gl_sub_total.average_balance />
                                                        </cfif>
                                                        <td class="fw-bold">#Numberformat(gl_sub_total.average_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                    <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                            <tr>
                                                <th colspan="11"><h4 class="p-3">Global Total</h4></th>
                                            </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <cfset average_balance_total = 0 />
                                                <cfset low_cost_average = 0 />
                                                <cfloop query="gl_total">
                                                    <cfset average_balance_total = average_balance_total + gl_total.average_balance />
                                                    <cfif ListFindNoCase('Demand Deposits,Domiciliary Accounts,Savings Deposits',gl_total.deposit_class)>
                                                        <cfset low_cost_average = low_cost_average + gl_total.average_balance />
                                                    </cfif>
                                                    <td class="fw-bold">#Numberformat(gl_total.average_balance/1000,'999,999')#</td>
                                                </cfloop>
                                                <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(low_cost_average/1000,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(low_cost_average/average_balance_total*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry></td>
                                        </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab3" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="segments" group="sbu_name">
                                            <thead>
                                              <tr>
                                                <th colspan="10"><h4 class="p-3">#segments.sbu_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark">
                                                    <th width="1">S/N</th>
                                                    <th>AO Code</th>
                                                    <th>Accout Officer</th>
                                                    <th width="100">BDM</th>
                                                    <th width="100">Commercial</th>
                                                    <th width="100">Corporate</th>
                                                    <th width="100">Public Sector</th>
                                                    <th width="100">Retail</th>
                                                    <th width="100">Treasury</th>
                                                    <th width="100">Total</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="segments_sub_total" dbtype="query">
                                                    select balance_sheet_segment,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance
                                                    ,sum(target_value)target_value,sum(interest_expense)interest_expense 
                                                    from segments 
                                                    where sbu_name='#trim(segments.sbu_name)#'
                                                    group by balance_sheet_segment 
                                                    order by balance_sheet_segment
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group="account_officer_name"> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#segments.account_officer_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/accounts&account_officer_code=#segments.account_officer_code#">#segments.account_officer_name#</a></td>
                                                        <cfset average_balance_total = 0 />
                                                        <cfoutput>
                                                            <cfset average_balance_total = average_balance_total + segments.average_balance />
                                                            <td>#Numberformat(segments.average_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                        <td>#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#segments.sbu_name#</th>
                                                    <cfset average_balance_total = 0 />
                                                    <cfloop query="segments_sub_total">
                                                        <cfset average_balance_total = average_balance_total + segments_sub_total.average_balance />
                                                        <td class="fw-bold">#Numberformat(segments_sub_total.average_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                    <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                            <tr>
                                                <th colspan="10"><h4 class="p-3">Global Total</h4></th>
                                            </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <cfset average_balance_total = 0 />
                                                <cfloop query="segments_total">
                                                    <cfset average_balance_total = average_balance_total + segments_total.average_balance />
                                                    <td class="fw-bold">#Numberformat(segments_total.average_balance/1000,'999,999')#</td>
                                                </cfloop>
                                                <td class="fw-bold">#Numberformat(average_balance_total/1000,'999,999')#</td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="cohorts-tab">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="cohort" group="sbu_name">
                                            <thead>
                                              <tr>
                                                <th colspan="17"><h4 class="p-3">#cohort.sbu_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th rowspan="2" width="1">S/N</th>
                                                    <th rowspan="2" align="left">AO Code</th>
                                                    <th rowspan="2" align="left">Accoun Officer</th>
                                                    <th colspan="2" width="100" align="center">BOP</th>
                                                    <th colspan="2" width="100" align="center">Mass Market</th>
                                                    <th colspan="2" width="100" align="center">Classic</th>
                                                    <th colspan="2" width="100" align="center">Mass Affluent</th>
                                                    <th colspan="2" width="100" align="center">Super Affluent</th>
                                                    <th colspan="2" width="100" align="center">HNI</th>
                                                    <th colspan="2" width="100" align="center">Ultra HNI</th>
                                                </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                    <th>## ACs</th>
                                                    <th>Balance</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="cohort_sub_total" dbtype="query">
                                                    select balance_band_rank,sum(ledger_balance)ledger_balance,sum(no_of_accounts)no_of_accounts
                                                    from cohort 
                                                    where sbu_name='#trim(cohort.sbu_name)#'
                                                    group by balance_band_rank
                                                    order by balance_band_rank
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput group = "account_officer_name">
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#cohort.account_officer_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/accounts&account_officer_code=#cohort.account_officer_code#">#cohort.account_officer_name#</a></td>
                                                        <cfoutput>
                                                            <td>#Numberformat(cohort.no_of_accounts,'999,999')#</td>
                                                            <td>#Numberformat(cohort.ledger_balance/1000,'999,999')#</td>
                                                        </cfoutput>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#cohort.sbu_name#</th>
                                                    <cfloop query="cohort_sub_total">
                                                            <td class="fw-bold">#Numberformat(cohort_sub_total.no_of_accounts,'999,999')#</td>
                                                            <td class="fw-bold">#Numberformat(cohort_sub_total.ledger_balance/1000,'999,999')#</td>
                                                    </cfloop>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="17"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <cfloop query="cohort_total">
                                                        <td class="fw-bold">#Numberformat(cohort_total.no_of_accounts,'999,999')#</td>
                                                        <td class="fw-bold">#Numberformat(cohort_total.ledger_balance/1000,'999,999')#</td>
                                                </cfloop>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </cfcase>


    <cfcase value="accounts">
        <cfsilent>
            <cfquery name="accounts" datasource="wemalytics">
                select * from dim_deposit#reporting_month# 
                where account_officer_code = '#url.account_officer_code#'
                order by average_credit_balance desc
            </cfquery>
        </cfsilent>

        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Deposits Report (N'000) <sup><cfoutput>Account Listing for #accounts.account_officer_name#</cfoutput></sup></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#location" role="tab" aria-selected="true">Account Listing</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">

                        <div class="tab-content" id="tabContent-deposits">
                            
                            <div class="tab-pane fade show active" id="location" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr class="bg-primary text-dark">
                                                <th width="1">S/N</th>
                                                <th>Account No</th>
                                                <th>Account Name</th>
                                                <th width="100">Product</th>
                                                <th width="100">Ledger</th>
                                                <th width="100">Average</th>
                                                <th width="100">Int Expense</th>
                                                <th width="100">WACC</th>
                                            </tr>
                                        </thead>
                                        <cfset rownumber = 0 />
                                        <cfoutput query="accounts"> 
                                            <cfset rownumber = rownumber + 1 />
                                            <tr>
                                                <td>#rownumber#</td>
                                                <td>#accounts.account_number#</td>
                                                <td>#accounts.account_name#</td>
                                                <td>#accounts.product_name#</td>
                                                <td class="fw-bold">#Numberformat(accounts.ledger_balance/1000,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(accounts.average_credit_balance/1000,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(accounts.interest_expense/1000,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(accounts.credit_interest_rate,'999,999.9')#%</td>
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

            <cfquery name="top_customers" datasource="wemalytics">
                select top 20 customer_id,customer_name,sum(no_of_accounts)no_of_accounts,sum(ledger_balance) ledger_balance,sum(average_credit_balance) average_credit_balance
                from dim_top_deposit_customers 
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                group by customer_id,customer_name 
                order by sum(average_credit_balance) desc 
            </cfquery>    

            <cfquery name="expensive_deposits" datasource="wemalytics">
                select top 10 * from dim_deposit
                where average_credit_balance >= 10000000
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                order by credit_interest_rate desc 
            </cfquery>    

            <cfquery name="top_account_officers" datasource="wemalytics">
                select top 10 * from cubes.dbo.fact_deposit_sbu
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and 1 = 2
                </cfif>
                order by average_balance desc 
            </cfquery>    

            <cfquery name="top_branches" datasource="wemalytics">
                select top 10 *from cubes.dbo.fact_deposit_region
                where 1 = 1
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and 1 = 2
                <cfelseif IsDefined("url.sbu_code")> and 1 = 2
                <cfelseif IsDefined("url.account_officer_code")> and 1 = 2
                </cfif>
                order by average_balance desc 
            </cfquery>    

            <cfquery name="top_zones" datasource="wemalytics">
                select top 10 zone_code,zone_name,sum(average_balance)average_balance
                from cubes.dbo.fact_deposit_region
                where 1 = 1
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and 1 = 2
                <cfelseif IsDefined("url.branch_code")> and 1 = 2
                <cfelseif IsDefined("url.sbu_code")> and 1 = 2
                <cfelseif IsDefined("url.account_officer_code")> and 1 = 2
                </cfif> 
                group by zone_code,zone_name
                order by sum(average_balance) desc 
            </cfquery>    
        </cfsilent>

    <!-- Styles -->
    <style>
        #chart_top_branches {
        width: 100%;
        height: 500px;
        } 
    </style>
    <!-- Resources -->
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    
    <!-- Chart code -->
    <script>
        am5.ready(function() {
            var root = am5.Root.new("chart_top_branches");
        // Set themes
        root.setThemes([
            am5themes_Animated.new(root)
        ]);
        
        
        // Create chart
        var chart = root.container.children.push(am5percent.PieChart.new(root, {
        layout: root.verticalLayout
        }));
        // Create series
        var series = chart.series.push(am5percent.PieSeries.new(root, {
        valueField: "value",
        categoryField: "category"
        }));
        // Set data
        series.data.setAll([ 
            <cfoutput>
                <cfloop query="top_branches">
                    { value: #top_branches.average_balance#, category: "#top_branches.branch_name#" },
                </cfloop>
            </cfoutput>
        ]);
        // Create legend
        var legend = chart.children.push(am5.Legend.new(root, {
            centerX: am5.percent(50),
            x: am5.percent(50),
            marginTop: 15,
            marginBottom: 15
        }));
        legend.data.setAll(series.dataItems);
        // Play initial series animation
        series.appear(1000, 100);
        
        }); // end am5.ready()
    </script>

    <!-- Styles -->
    <style>
        #chart_top_zones {
        width: 100%;
        height: 500px;
        } 
    </style>
    
    <!-- Chart code -->
    <script>
        am5.ready(function() {
            var root2 = am5.Root.new("chart_top_zones");
        // Set themes
        root2.setThemes([
            am5themes_Animated.new(root2)
        ]);
        
        
        // Create chart
        var chart = root2.container.children.push(am5percent.PieChart.new(root2, {
            layout: root2.verticalLayout
        }));
        // Create series
        var series = chart.series.push(am5percent.PieSeries.new(root2, {
        valueField: "value",
        categoryField: "category"
        }));
        // Set data
        series.data.setAll([ 
            <cfoutput>
                <cfloop query="top_zones">
                    { value: #top_zones.average_balance#, category: "#top_zones.zone_name#" },
                </cfloop>
            </cfoutput>
        ]);
        // Create legend
        var legend = chart.children.push(am5.Legend.new(root2, {
            centerX: am5.percent(50),
            x: am5.percent(50),
            marginTop: 15,
            marginBottom: 15
        }));
        legend.data.setAll(series.dataItems);
        // Play initial series animation
        series.appear(1000, 100);
        
        }); // end am5.ready()
    </script>


        <div class="row" id="deposits" >
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Deposits Report (N'000) <sup><cfoutput>Insights for #titles.entity_name#</cfoutput></sup></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#location" role="tab" aria-selected="true">Insights</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">

                        <div class="tab-content" id="tabContent-deposits">
                            
                            <div class="tab-pane fade show active" id="location" role="tabpanel">

                                <div class="row">
                                    <div class="col-lg-8 col-xl-8">
                                        <div class="row">
                                            <div class="col-md-18">
                                                <div class="card">
                                                    <div class="flex-wrap card-header d-flex justify-content-between align-items-center">
                                                        <div class="header-title">
                                                            <h4>Top 20 Customers</h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="d-flex justify-content-between">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr class="bg-primary text-dark">
                                                                        <th width="1">S/N</th>
                                                                        <th width="100">Customer ID</th>
                                                                        <th width="100">Customer Name</th>
                                                                        <th width="100">#Accounts</th>
                                                                        <th width="100">Ledger</th>
                                                                        <th width="100">Average</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <cfset serial_number = 0 />
                                                                    <cfoutput query="top_customers">
                                                                        <cfset serial_number = serial_number + 1 />
                                                                        <tr>
                                                                            <td>#serial_number#</td>
                                                                            <td>#top_customers.customer_ID#</td>
                                                                            <td>#left(top_customers.customer_name,50)#</td>
                                                                            <td>#Numberformat(top_customers.no_of_accounts,'999,999')#</td>
                                                                            <td>#Numberformat(top_customers.ledger_balance/1000,'999,999')#</td>
                                                                            <td>#Numberformat(top_customers.average_credit_balance/1000,'999,999')#</td>
                                                                        </tr>
                                                                    </cfoutput>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-xl-4">
                                        <div class="card">
                                            <div class="flex-wrap card-header d-flex justify-content-between align-items-center">
                                                <div class="header-title">
                                                    <h4>Most Expensive Deposit (N'000)</h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="">
                                                    <cfoutput query="expensive_deposits">
                                                        <div class="d-flex justify-content-between mb-3 mt-4">
                                                            <div class="d-flex align-items-center" style="width: 100%">
                                                                <p class="ms-0 mb-0"><b>#expensive_deposits.account_name#</b><br /><sup style="color:red">#expensive_deposits.account_number#</sup></p>
                                                            </div>
                                                            <p class="mb-0"><b>#Numberformat(expensive_deposits.average_credit_balance/1000,'999,999')# <sup style="color:red">#Numberformat(expensive_deposits.credit_interest_rate,'999,999.9')#%</sup></b></p>
                                                        </div>
                                                        <div class="progress bg-primary-soft-header shadow-none w-100" style="height: 6px">
                                                            <div class="progress-bar bg-primary" data-toggle="progress-bar" role="progressbar" aria-valuenow="4.3" aria-valuemin="0" aria-valuemax="100" style="width: 4.3%; transition: width 2s ease 0s;"></div>
                                                        </div>
                                                    </cfoutput>

                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                </div>  
                                
                                <div class="row">
                                    <cfif top_branches.recordcount gt 0>
                                        <div class="col-lg-6 col-xl-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card card-block card-stretch card-height">
                                                        <div class="flex-wrap card-header d-flex justify-content-between align-items-center">
                                                            <div class="header-title">
                                                                <h4>Top Branches/Teams</h4>
                                                            </div>
                                                            <div id="chart_top_branches"></div>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </cfif>
                                   
                                    <cfif top_zones.recordcount gt 0>
                                        <div class="col-lg-6 col-xl-6">
                                            <div class="card">
                                                <div class="flex-wrap card-header d-flex justify-content-between align-items-center border-0 pb-0">
                                                    <div class="header-title">
                                                        <h4>Top Zones/Groups</h4>
                                                    </div>
                                                    <div id="chart_top_zones"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </cfif>
                                </div>

                                <div class="row">
                                    <cfif top_account_officers.recordcount gt 0>
                                        <div class="col-lg-8 col-xl-8">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="flex-wrap card-header d-flex justify-content-between align-items-center">
                                                            <div class="header-title">
                                                                <h4>Top Account Officers</h4>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-between">
                                                                <table class="table table-bordered">
                                                                    <thead>
                                                                        <tr class="bg-primary text-dark">
                                                                            <th width="1">S/N</th>
                                                                            <th width="100">AO Code</th>
                                                                            <th width="100">Customer Name</th>
                                                                            <th width="100">Ledger</th>
                                                                            <th width="100">Average</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <cfset serial_number = 0 />
                                                                        <cfoutput query="top_account_officers">
                                                                            <cfset serial_number = serial_number + 1 />
                                                                            <tr>
                                                                                <td>#serial_number#</td>
                                                                                <td>#top_account_officers.account_officer_code#</td>
                                                                                <td>#top_account_officers.account_officer_name#</td>
                                                                                <td>#Numberformat(top_account_officers.ledger_balance/1000,'999,999')#</td>
                                                                                <td>#Numberformat(top_account_officers.average_balance/1000,'999,999')#</td>
                                                                            </tr>
                                                                        </cfoutput>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </cfif>
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
             element.style.width = '700px';
             element.style.height = '900px';
        })

      
    })
</script>
