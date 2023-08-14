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
        var sTable = document.getElementById('income_movement').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=700,width=700');
        let date = new Date().toLocaleDateString();
        

        win.document.write('<html><head>');
        win.document.write(`<title>income_movement</title>`);   // <title> FOR PDF HEADER.
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
        win.document.write('</body></html>');
       
         
 

    }

    function ExportToExcel(type, fn, dl) {
            
            var elt = document.getElementById('income_movement');
            var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
                             return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('income_movement-sheet.' + (type || 'xlsx')));
                
        }

 function exportHTML(){
       var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' "+
            "xmlns:w='urn:schemas-microsoft-com:office:word' "+
            "xmlns='http://www.w3.org/TR/REC-html40'>"+
            "<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title></head><body>";
       var footer = "</body></html>";
       var sourceHTML = header+document.getElementById("income_movement").innerHTML+footer;
       
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
  var table = document.getElementById('income_movement');

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
  pres.writeFile({ fileName: 'income_movement.pptx' });
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
            <cfquery name="income" datasource="wemalytics">
                select a.*,isnull(b.amount,0)starting_amount,isnull(c.amount,0)ending_amount
                ,isnull(c.amount,0)-isnull(b.amount,0)net_movement
                from wvx_dim_regions a 
                left join (
                    select region_code,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_startdate#' 
                    group by region_code
                )b on a.region_code = b.region_code
                left join (
                    select region_code,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_enddate#' 
                    group by region_code
                )c on a.region_code = c.region_code
                where 1 = 1 
                order by directorate_name,region_name
            </cfquery> 

            <cfquery name="income_total" dbtype="query">
                select sum(starting_amount) starting_amount,sum(ending_amount) ending_amount,sum(net_movement) net_movement 
                from income 
            </cfquery> 
        </cfsilent>

        <div class="row" id="income_movement">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Income Movement | <cfoutput>Between #Dateformat(url.e_startdate,'mmmm d, yyyy')# And #Dateformat(url.e_enddate,'mmmm d, yyyy')#</cfoutput></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">income</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <table class="table table-bordered">
                            <tr>
                                <td style="background-color:#FFF; color:black; font-weight:bold; font-size:12pt;border:none;">
                                    Search For Prefered Branch and click On Any Of The Numbers To See Details Plus Toggle
                                    Between Dates
                                </td>
                                <td align="right" style="border:none;padding-left:0;border-right:none;padding:0;border:none;">
                                    <cfoutput>
                                        <form id="frm_card" method="get" action="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#" style="width:100%;border:none;">
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
                        <div class="tab-content" id="tabContent-income">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="income" group="directorate_name">
                                            <thead>
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">#income.directorate_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" valign="middle">
                                                    <th width="30">S/N</th>
                                                    <th>Region</th>
                                                    <th width="100">Start Amount</th>
                                                    <th width="100">End Amount</th>
                                                    <th width="100">Net Movement</th>
                                                    <th width="50">View</th>
                                                </tr>
                                            </thead> 
                                                <cfquery name="income_sub_total" dbtype="query">
                                                    select directorate_code,directorate_name,sum(starting_amount) starting_amount,sum(ending_amount) ending_amount,sum(net_movement) net_movement 
                                                    from income 
                                                    where directorate_code = '#income.directorate_code#' 
                                                    group by directorate_code,directorate_name
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/regional&region_code=#income.region_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">#income.region_name#</a></td>
                                                        <td>#Numberformat(income.starting_amount,'(999,999)')#</td>
                                                        <td>#Numberformat(income.ending_amount,'(999,999)')#</td>
                                                        <td<cfif income.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income.net_movement,'(999,999)')#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&region_code=#income.region_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="2">#income.directorate_name#</th>
                                                    <td class="fw-bold myModal">#Numberformat(income_sub_total.starting_amount,'(999,999)')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(income_sub_total.ending_amount,'(999,999)')#</td>
                                                    <td class="fw-bold myModal"<cfif income_sub_total.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income_sub_total.net_movement,'(999,999)')#</td>
                                                    <td class="fw-bold myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&directorate_code=#income.directorate_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="2"></th>
                                                <td class="fw-bold myModal">#Numberformat(income_total.starting_amount,'(999,999)')#</td>
                                                <td class="fw-bold myModal">#Numberformat(income_total.ending_amount,'(999,999)')#</td>
                                                <td class="fw-bold myModal"<cfif income_total.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income_total.net_movement,'(999,999)')#</td>
                                                <td class="fw-bold myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&directorate_code=#income.directorate_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
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
            <cfquery name="income" datasource="wemalytics">
                select a.*,isnull(b.amount,0)starting_amount,isnull(c.amount,0)ending_amount
                ,isnull(c.amount,0)-isnull(b.amount,0)net_movement
                from wvx_dim_branches a 
                left join (
                    select branch_code,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_startdate#'  
                    group by branch_code
                )b on a.branch_code = b.branch_code
                left join (
                    select branch_code,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_enddate#' 
                    group by branch_code
                )c on a.branch_code = c.branch_code
                where 1 = 1 
                and a.region_code = '#url.region_code#'
                order by zone_name,branch_name
            </cfquery> 

            <cfquery name="income_total" dbtype="query">
                select sum(starting_amount) starting_amount,sum(ending_amount) ending_amount,sum(net_movement) net_movement 
                from income 
            </cfquery> 
        </cfsilent>

        <div class="row" id="income_movement">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Income Movement:<sup><cfoutput>#income.region_name#</cfoutput></sup> | <cfoutput>Between #Dateformat(url.e_startdate,'mmmm d, yyyy')# And #Dateformat(url.e_enddate,'mmmm d, yyyy')#</cfoutput></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">income</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <table class="table table-bordered">
                            <tr>
                                <td style="background-color:#FFF; color:black; font-weight:bold; font-size:12pt;border:none;">
                                    Search For Prefered Branch and click On Any Of The Numbers To See Details Plus Toggle
                                    Between Dates
                                </td>
                                <td align="right" style="border:none;padding-left:0;border-right:none;padding:0;border:none;">
                                    <cfoutput>
                                        <form id="frm_card" method="get" action="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/Regional<cfif IsDefined("url.region_code")>&region_code=#url.region_code#</cfif>" style="width:100%;border:none;">
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
                        <div class="tab-content" id="tabContent-income">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="income" group="zone_name">
                                            <thead>
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">#income.zone_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" valign="middle">
                                                    <th width="30">S/N</th>
                                                    <th width="50">Sol ID</th>
                                                    <th>Branch</th>
                                                    <th width="100">Start Amount</th>
                                                    <th width="100">End Amount</th>
                                                    <th width="100">Net Movement</th>
                                                    <th width="50">View</th>
                                                </tr>
                                            </thead> 
                                                <cfquery name="income_sub_total" dbtype="query">
                                                    select zone_code,zone_name,sum(starting_amount) starting_amount,sum(ending_amount) ending_amount,sum(net_movement) net_movement 
                                                    from income 
                                                    where zone_code = '#income.zone_code#' 
                                                    group by zone_code,zone_name
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#income.branch_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch&Branch_code=#income.Branch_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">#income.Branch_name#</a></td>
                                                        <td>#Numberformat(income.starting_amount,'(999,999)')#</td>
                                                        <td>#Numberformat(income.ending_amount,'(999,999)')#</td>
                                                        <td<cfif income.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income.net_movement,'(999,999)')#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&Branch_code=#income.Branch_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#income.zone_name#</th>
                                                    <td class="fw-bold myModal">#Numberformat(income_sub_total.starting_amount,'(999,999)')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(income_sub_total.ending_amount,'(999,999)')#</td>
                                                    <td class="fw-bold myModal"<cfif income_sub_total.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income_sub_total.net_movement,'(999,999)')#</td>
                                                    <td class="fw-bold myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&zone_code=#income.zone_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <td class="fw-bold myModal">#Numberformat(income_total.starting_amount,'(999,999)')#</td>
                                                <td class="fw-bold myModal">#Numberformat(income_total.ending_amount,'(999,999)')#</td>
                                                <td class="fw-bold myModal"<cfif income_total.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income_total.net_movement,'(999,999)')#</td>
                                                <td class="fw-bold myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&region_code=#income.region_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
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
            <cfquery name="income" datasource="wemalytics">
                select a.*,isnull(b.amount,0)starting_amount,isnull(c.amount,0)ending_amount
                ,isnull(c.amount,0)-isnull(b.amount,0)net_movement
                from wvx_dim_account_officers a 
                left join (
                    select account_officer_code,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_startdate#'  
                    group by account_officer_code
                )b on a.account_officer_code = b.account_officer_code
                left join (
                    select account_officer_code,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_enddate#' 
                    group by account_officer_code
                )c on a.account_officer_code = c.account_officer_code
                where 1 = 1 
                and a.branch_code = '#url.branch_code#'
                order by sbu_name,a.account_officer_code
            </cfquery> 

            <cfquery name="income_total" dbtype="query">
                select sum(starting_amount) starting_amount,sum(ending_amount) ending_amount,sum(net_movement) net_movement 
                from income 
            </cfquery> 
        </cfsilent>

        <div class="row" id="income_movement">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Income Movement:<sup><cfoutput>#income.branch_name#</cfoutput></sup> | <cfoutput>Between #Dateformat(url.e_startdate,'mmmm d, yyyy')# And #Dateformat(url.e_enddate,'mmmm d, yyyy')#</cfoutput></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">income</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <table class="table table-bordered">
                            <tr>
                                <td style="background-color:#FFF; color:black; font-weight:bold; font-size:12pt;border:none;">
                                    Search For Prefered Branch and click On Any Of The Numbers To See Details Plus Toggle
                                    Between Dates
                                </td>
                                <td align="right" style="border:none;padding-left:0;border-right:none;padding:0;border:none;">
                                    <cfoutput>
                                        <form id="frm_card" method="get" action="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch<cfif IsDefined("url.branch_code")>&branch_code=#url.branch_code#</cfif>" style="width:100%;border:none;">
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
                        <div class="tab-content" id="tabContent-income">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <cfoutput query="income" group="sbu_name">
                                            <thead>
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">#income.sbu_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" valign="middle">
                                                    <th width="30">S/N</th>
                                                    <th width="50">AO Code</th>
                                                    <th>Account Officer</th>
                                                    <th width="100">Start Amount</th>
                                                    <th width="100">End Amount</th>
                                                    <th width="100">Net Movement</th>
                                                    <th width="50">View</th>
                                                </tr>
                                            </thead> 
                                                <cfquery name="income_sub_total" dbtype="query">
                                                    select sbu_code,sbu_name,sum(starting_amount) starting_amount,sum(ending_amount) ending_amount,sum(net_movement) net_movement 
                                                    from income 
                                                    where sbu_code = '#income.sbu_code#' 
                                                    group by sbu_code,sbu_name
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#income.account_officer_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&account_officer_code=#income.account_officer_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">#income.account_officer_name#</a></td>
                                                        <td>#Numberformat(income.starting_amount,'(999,999)')#</td>
                                                        <td>#Numberformat(income.ending_amount,'(999,999)')#</td>
                                                        <td<cfif income.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income.net_movement,'(999,999)')#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&account_officer_code=#income.account_officer_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#income.sbu_name#</th>
                                                    <td class="fw-bold myModal">#Numberformat(income_sub_total.starting_amount,'(999,999)')#</td>
                                                    <td class="fw-bold myModal">#Numberformat(income_sub_total.ending_amount,'(999,999)')#</td>
                                                    <td class="fw-bold myModal"<cfif income_sub_total.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income_sub_total.net_movement,'(999,999)')#</td>
                                                    <td class="fw-bold myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&sbu_code=#income.sbu_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <td class="fw-bold myModal">#Numberformat(income_total.starting_amount,'(999,999)')#</td>
                                                <td class="fw-bold myModal">#Numberformat(income_total.ending_amount,'(999,999)')#</td>
                                                <td class="fw-bold myModal"<cfif income_total.net_movement lt 0> style="color:red"</cfif>>#Numberformat(income_total.net_movement,'(999,999)')#</td>
                                                <td class="fw-bold myModal"><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&branch_code=#income.branch_code#<cfif IsDefined("url.e_startdate")>&e_startdate=#url.e_startdate#</cfif><cfif IsDefined("url.e_enddate")>&e_enddate=#url.e_enddate#</cfif>">View</a></td>
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


    <cfcase value="insights"> 
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

            <cfquery name="net" datasource="wemalytics">
                select a.*,isnull(b.amount,0)starting_amount,isnull(c.amount,0)ending_amount
                ,isnull(c.amount,0)-isnull(b.amount,0)net_movement
                from dim_income_class a 
                left join (
                    select income_class,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_startdate#' 
                    <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                    <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                    <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                    <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                    <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                    <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                    </cfif> 
                    group by income_class
                )b on a.income_class = b.income_class
                left join (
                    select income_class,sum(tran_amt)amount from stg.dbo.stg_income_raw_master  
                    where tran_date <='#url.e_enddate#' 
                    <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                    <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                    <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                    <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                    <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                    <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                    </cfif> 
                    group by income_class
                )c on a.income_class = c.income_class
                where 1 = 1 
                order by isnull(c.amount,0)-isnull(b.amount,0) desc
            </cfquery> 

            <cfquery name="total_net" dbtype="query"> 
                select sum(ending_amount - starting_amount) net_movement from net
            </cfquery> 

            <cfquery name="top_gainers" datasource="wemalytics">
                select top 20 * from stg.dbo.stg_income_raw_master  
                where tran_date between '#url.e_startdate#' and '#url.e_enddate#' 
                and part_tran_type = 'C' 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                order by tran_amt desc 
            </cfquery>

            <cfquery name="top_losers" datasource="wemalytics">
                select top 20 * from stg.dbo.stg_income_raw_master  
                where tran_date between '#url.e_startdate#' and '#url.e_enddate#' 
                and part_tran_type = 'D' 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                order by tran_amt desc 
            </cfquery>

        </cfsilent> 

        <div class="row" id="income_movement">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Income Movement <cfoutput><sup>#titles.entity_name#</sup> | Between #Dateformat(url.e_startdate,'mmmm d, yyyy')# And #Dateformat(url.e_enddate,'mmmm d, yyyy')#</cfoutput></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Income</a>
                            </li>
                        </ul>
                    </div>


                    <div class="card-body">
                        <div class="tab-content" id="tabContent-income">
                            <table class="table table-bordered">
                                <tr>
                                    <td style="background-color:#FFF; color:black; font-weight:bold; font-size:12pt;border:none;">
                                        Search For Prefered Branch and click On Any Of The Numbers To See Details Plus Toggle
                                        Between Dates
                                    </td>
                                    <td align="right" style="border:none;padding-left:0;border-right:none;padding:0;border:none;">
                                        <cfoutput>
                                            <form id="frm_card" method="get" action="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights<cfif IsDefined("url.directorate_code")>&directorate_code=#url.directorate_code#<cfelseif IsDefined("url.region_code")>&region_code=#url.region_code#<cfelseif IsDefined("url.zone_code")>&zone_code=#url.zone_code#<cfelseif IsDefined("url.branch_code")>&branch_code=#url.branch_code#<cfelseif IsDefined("url.sbu_code")>&sbu_code=#url.sbu_code#<cfelseif IsDefined("url.account_officer_code")>&account_officer_code=#url.account_officer_code#</cfif>" style="width:100%;border:none;">
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

                            <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table style="width:30%" class="table table-bordered">
                                        <tr>
                                            <td width="200">
                                                <h4 class="p-3"><cfoutput>Net Movement: <sup style="color:<cfif total_net.net_movement lt 0>red<cfelse>green</cfif>"><i>#Numberformat(total_net.net_movement,'(999,999)')#</i></sup></cfoutput></h4>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="5"><h4 class="p-3">Quick Summary</h4></th>
                                                        </tr>
                                                        <tr class="bg-primary text-dark">
                                                            <th width="1">S/N</th>
                                                            <th>Income Class</th>
                                                            <th>Start</th>
                                                            <th>End</th>
                                                            <th width="100">Net</th>
                                                        </tr>
                                                    </thead>
                                                    <cfset rownumber = 0 />
                                                    <cfoutput query="net">
                                                        <cfset rownumber = rownumber + 1 />
                                                        <tr>
                                                            <td>#rownumber#</td>
                                                            <td>#net.income_class#</td>
                                                            <td>#Numberformat(net.starting_amount,'(999,999)')#</td>
                                                            <td>#Numberformat(net.ending_amount,'(999,999)')#</td>
                                                            <td>#Numberformat(net.net_movement,'(999,999)')#</td>
                                                        </tr>
                                                    </cfoutput>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr valign="top">
                                            <td width="400">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="6"><h4 class="p-3">Top Transactions</h4></th>
                                                        </tr>
                                                        <tr class="bg-primary text-dark">
                                                            <th width="1">S/N</th>
                                                            <th>ID</th>
                                                            <th>Date</th>
                                                            <th width="100">Narration</th>
                                                            <th width="100">Anount</th>
                                                        </tr>
                                                    </thead>
                                                    <cfset rownumber = 0 />
                                                    <cfoutput query="top_gainers">
                                                        <cfset rownumber = rownumber + 1 />
                                                        <tr>
                                                            <td>#rownumber#</td>
                                                            <td>#top_gainers.tran_ID#</td>
                                                            <td>#Dateformat(top_gainers.tran_date,'mmmm d, yyyy')#</td>
                                                            <td>#top_gainers.tran_particular#</td>
                                                            <td>#Numberformat(top_gainers.tran_amt,'(999,999)')#</td>
                                                        </tr>
                                                    </cfoutput>
                                                </table>
                                            </td>
                                            <td width="400">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="6"><h4 class="p-3">Top Reversals</h4></th>
                                                        </tr>
                                                        <tr class="bg-primary text-dark">
                                                            <th width="1">S/N</th>
                                                            <th>ID</th>
                                                            <th>Date</th>
                                                            <th width="100">Narration</th>
                                                            <th width="100">Anount</th>
                                                        </tr>
                                                    </thead>
                                                    <cfset rownumber = 0 />
                                                    <cfoutput query="top_losers">
                                                        <cfset rownumber = rownumber + 1 />
                                                        <tr>
                                                            <td>#rownumber#</td>
                                                            <td>#top_losers.tran_ID#</td>
                                                            <td>#Dateformat(top_losers.tran_date,'mmmm d, yyyy')#</td>
                                                            <td>#top_losers.tran_particular#</td>
                                                            <td>#Numberformat(top_losers.tran_amt,'(999,999)')#</td>
                                                        </tr>
                                                    </cfoutput>
                                                </table>
                                            </td>
                                        </tr>
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
            const element = document.getElementById('income_movement');
            htmlpdf()
            .from(element)
            .save();

        }
    })
</script>