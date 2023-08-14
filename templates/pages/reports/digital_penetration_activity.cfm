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
        var sTable = document.getElementById('digital_penetration_activity').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=700,width=700');

        win.document.write('<html><head>');
        win.document.write('<title>digital_penetration_activity</title>');   // <title> FOR PDF HEADER.
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
            var elt = document.getElementById('digital_penetration_activity');
            var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
                             return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('digital_penetration_activity-sheet.' + (type || 'xlsx')));
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
  link.download = 'digital_penetration_activity'; // default name without extension
  document.body.appendChild(link);
  if (navigator.msSaveOrOpenBlob) navigator.msSaveOrOpenBlob(blob, 'digital_penetration_activity.doc'); // IE10-11
  else link.click(); // other browsers
  document.body.removeChild(link);
};

function downloadPPT() {
      // Get the HTML table element
      const table = document.getElementById('digital_penetration_activity');

      // Convert the table to a canvas element using HTML2Canvas
      html2canvas(table)
        .then(canvas => {
          // Create an offscreen anchor element to download the PPT file
          const link = document.createElement('a');
          link.href = canvas.toDataURL('pptx');
          

          // Set the download attribute and file name
          link.download = 'digital_penetration_activity.pptx';

          // Trigger the download
          link.click();
        });
    }

    // Attach the downloadPPT function to the download button click event
    const downloadButton = document.getElementById('digital_penetration_activity');
    downloadButton.addEventListener('click', downloadPPT);
    
</script>


<cfswitch expression="#url.view#">

    <cfdefaultcase>
        <cfsilent>
            <cfquery name="location" datasource="wemalytics">
                select * from cubes.dbo.facts_digital_penetration_activity#reporting_month#
                order by directorate_name,region_name
            </cfquery>

            <cfquery name="location_total" dbtype="query">
                select sum(number_of_accounts)number_of_accounts,sum(number_of_customers)number_of_customers
                ,sum(has_USSD)has_USSD,sum(New_USSD)New_USSD,sum(Active_USSD)Active_USSD
                ,sum(has_ALAT)has_ALAT,sum(New_ALAT)New_ALAT,sum(Active_ALAT)Active_ALAT 
                ,sum(has_ALAT_Business)has_ALAT_Business,sum(New_ALAT_Business)New_ALAT_Business,sum(Active_ALAT_Business)Active_ALAT_Business 
                ,sum(has_debit_card)has_debit_card,sum(New_debit_card)New_debit_card,sum(Active_debit_card)Active_debit_card 
                from location
            </cfquery>
        </cfsilent>

        <div class="row" id="digital_penetration_activity">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Digital Penetration & Activity</h4>
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
                                        <cfoutput query="location" group="directorate_name">
                                            <thead>
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">#location.directorate_name#</h4></th>
                                              </tr>
                                                <tr class="bg-primary text-dark" valign="middle" align="center">
                                                    <th rowspan = "2" width="1">S/N</th>
                                                    <th rowspan = "2">Region</th>
                                                    <th rowspan = "2">Customers</th>
                                                    <th colspan = "4" width="100">Debit Cards</th>
                                                    <th colspan = "4" width="100">ALAT</th>
                                                    <th colspan = "4" width="100">ALAT Business</th>
                                                    <th colspan = "4" width="100">USSD</th>
                                                    <th rowspan = "2" width="100">Insights</th>
                                                </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="location_sub_total" dbtype="query">
                                                    select sum(number_of_accounts)number_of_accounts,sum(number_of_customers)number_of_customers
                                                    ,sum(has_USSD)has_USSD,sum(New_USSD)New_USSD,sum(Active_USSD)Active_USSD
                                                    ,sum(has_ALAT)has_ALAT,sum(New_ALAT)New_ALAT,sum(Active_ALAT)Active_ALAT 
                                                    ,sum(has_ALAT_Business)has_ALAT_Business,sum(New_ALAT_Business)New_ALAT_Business,sum(Active_ALAT_Business)Active_ALAT_Business 
                                                    ,sum(has_debit_card)has_debit_card,sum(New_debit_card)New_debit_card,sum(Active_debit_card)Active_debit_card 
                                                    from location
                                                    where directorate_name='#trim(location.directorate_name)#'
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/regional&region_code=#location.region_code#">#location.region_name#</a></td>
                                                        <td>#Numberformat(location.number_of_customers,'999,999')#</td>
                                                        <td>#Numberformat(location.has_debit_card,'999,999')#</td>
                                                        <td>#Numberformat(location.New_debit_card,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_debit_card/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_debit_card/location.has_debit_card*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_ALAT,'999,999')#</td>
                                                        <td>#Numberformat(location.New_ALAT,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_ALAT/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_ALAT/location.has_ALAT*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_ALAT_Business,'999,999')#</td>
                                                        <td>#Numberformat(location.New_ALAT_Business,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_ALAT_Business/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_ALAT_Business/location.has_ALAT_Business*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_USSD,'999,999')#</td>
                                                        <td>#Numberformat(location.New_USSD,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_USSD/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_USSD/location.has_USSD*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&region_code=#location.region_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="2">#location.directorate_name#</th>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.number_of_customers,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_debit_card,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_debit_card,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_debit_card/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_debit_card/location_sub_total.has_debit_card*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_ALAT,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_ALAT,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_ALAT/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_ALAT/location_sub_total.has_ALAT*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_ALAT_Business,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_ALAT_Business,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_ALAT_Business/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_ALAT_Business/location_sub_total.has_ALAT_Business*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_USSD,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_USSD,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_USSD/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_USSD/location_sub_total.has_USSD*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&directorate_code=#location.directorate_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="20"><h4 class="p-3">Global Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="2"></th>
                                                <td class="fw-bold">#Numberformat(location_total.number_of_customers,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_debit_card,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_debit_card,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_debit_card/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_debit_card/location_total.has_debit_card,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_ALAT,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_ALAT,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_ALAT/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_ALAT/location_total.has_ALAT,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_ALAT_Business,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_ALAT_Business,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_ALAT_Business/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_ALAT_Business/location_total.has_ALAT_Business,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_USSD,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_USSD,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_USSD/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_USSD/location_total.has_USSD,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
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
                select * from cubes.dbo.facts_digital_penetration_activity_branch#reporting_month# 
                where region_code = '#url.region_code#'
                order by zone_name,branch_name
            </cfquery>

            <cfquery name="location_total" dbtype="query">
                select sum(number_of_accounts)number_of_accounts,sum(number_of_customers)number_of_customers
                ,sum(has_USSD)has_USSD,sum(New_USSD)New_USSD,sum(Active_USSD)Active_USSD
                ,sum(has_ALAT)has_ALAT,sum(New_ALAT)New_ALAT,sum(Active_ALAT)Active_ALAT 
                ,sum(has_ALAT_Business)has_ALAT_Business,sum(New_ALAT_Business)New_ALAT_Business,sum(Active_ALAT_Business)Active_ALAT_Business 
                ,sum(has_debit_card)has_debit_card,sum(New_debit_card)New_debit_card,sum(Active_debit_card)Active_debit_card 
                from location
            </cfquery>
        </cfsilent>

        <div class="row" id="digital_penetration_activity">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Digital Penetration & Activity</h4>
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
                                                <tr class="bg-primary text-dark" valign="top" align="center">
                                                    <th rowspan = "2" width="1">S/N</th>
                                                    <th rowspan = "2">Sol ID</th>
                                                    <th rowspan = "2">Branch</th>
                                                    <th rowspan = "2">Customers</th>
                                                    <th colspan = "4" width="100">Debit Cards</th>
                                                    <th colspan = "4" width="100">ALAT</th>
                                                    <th colspan = "4" width="100">ALAT Business</th>
                                                    <th colspan = "4" width="100">USSD</th>
                                                    <th rowspan = "2" width="100">Insights</th>
                                                </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="location_sub_total" dbtype="query">
                                                    select sum(number_of_accounts)number_of_accounts,sum(number_of_customers)number_of_customers
                                                    ,sum(has_USSD)has_USSD,sum(New_USSD)New_USSD,sum(Active_USSD)Active_USSD
                                                    ,sum(has_ALAT)has_ALAT,sum(New_ALAT)New_ALAT,sum(Active_ALAT)Active_ALAT 
                                                    ,sum(has_ALAT_Business)has_ALAT_Business,sum(New_ALAT_Business)New_ALAT_Business,sum(Active_ALAT_Business)Active_ALAT_Business 
                                                    ,sum(has_debit_card)has_debit_card,sum(New_debit_card)New_debit_card,sum(Active_debit_card)Active_debit_card 
                                                    from location 
                                                    where zone_name='#trim(location.zone_name)#'
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#location.branch_code#</td> 
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/branch&branch_code=#location.branch_code#">#location.branch_name#</a></td>
                                                        <td>#Numberformat(location.number_of_customers,'999,999')#</td>
                                                        <td>#Numberformat(location.has_debit_card,'999,999')#</td>
                                                        <td>#Numberformat(location.New_debit_card,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_debit_card/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_debit_card/location.has_debit_card,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_ALAT,'999,999')#</td>
                                                        <td>#Numberformat(location.New_ALAT,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_ALAT/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_ALAT/location.has_ALAT,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_ALAT_Business,'999,999')#</td>
                                                        <td>#Numberformat(location.New_ALAT_Business,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_ALAT_Business/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_ALAT_Business/location.has_ALAT_Business,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_USSD,'999,999')#</td>
                                                        <td>#Numberformat(location.New_USSD,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_USSD/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_USSD/location.has_USSD,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&branch_code=#location.branch_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#location.zone_name#</th>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.number_of_customers,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_debit_card,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_debit_card,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_debit_card/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_debit_card/location_sub_total.has_debit_card,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_ALAT,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_ALAT,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_ALAT/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_ALAT/location_sub_total.has_ALAT,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_ALAT_Business,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_ALAT_Business,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_ALAT_Business/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_ALAT_Business/location_sub_total.has_ALAT_Business,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_USSD,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_USSD,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_USSD/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_USSD/location_sub_total.has_USSD,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&zone_code=#location.zone_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="21"><h4 class="p-3">Regional Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <td class="fw-bold">#Numberformat(location_total.number_of_customers,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_debit_card,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_debit_card,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_debit_card/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_debit_card/location_total.has_debit_card,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_ALAT,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_ALAT,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_ALAT/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_ALAT/location_total.has_ALAT,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_ALAT_Business,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_ALAT_Business,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_ALAT_Business/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_ALAT_Business/location_total.has_ALAT_Business,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_USSD,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_USSD,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_USSD/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_USSD/location_total.has_USSD,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
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
                select * from cubes.dbo.facts_digital_penetration_activity_account_officer#reporting_month# 
                where branch_code = '#url.branch_code#'
                order by sbu_name,account_officer_name
            </cfquery>

            <cfquery name="location_total" dbtype="query">
                select sum(number_of_accounts)number_of_accounts,sum(number_of_customers)number_of_customers
                ,sum(has_USSD)has_USSD,sum(New_USSD)New_USSD,sum(Active_USSD)Active_USSD
                ,sum(has_ALAT)has_ALAT,sum(New_ALAT)New_ALAT,sum(Active_ALAT)Active_ALAT 
                ,sum(has_ALAT_Business)has_ALAT_Business,sum(New_ALAT_Business)New_ALAT_Business,sum(Active_ALAT_Business)Active_ALAT_Business 
                ,sum(has_debit_card)has_debit_card,sum(New_debit_card)New_debit_card,sum(Active_debit_card)Active_debit_card 
                from location
            </cfquery>
        </cfsilent>

        <div class="row" id="digital_penetration_activity">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Digital Penetration & Activity</h4>
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
                                                <tr class="bg-primary text-dark" valign="top" align="center">
                                                    <th rowspan = "2" width="1">S/N</th>
                                                    <th rowspan = "2">AO Code</th>
                                                    <th rowspan = "2">Account Officer</th>
                                                    <th rowspan = "2">Customers</th>
                                                    <th colspan = "4" width="100">Debit Cards</th>
                                                    <th colspan = "4" width="100">ALAT</th>
                                                    <th colspan = "4" width="100">ALAT Business</th>
                                                    <th colspan = "4" width="100">USSD</th>
                                                    <th rowspan = "2" width="100">Insights</th>
                                                </tr>
                                                <tr class="bg-primary text-dark" align="center">
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                    <th>Count</th>
                                                    <th>New</th>
                                                    <th>%Adopt</th>
                                                    <th>%Active</th>
                                                </tr>
                                            </thead>
                                                <cfquery name="location_sub_total" dbtype="query">
                                                    select sum(number_of_accounts)number_of_accounts,sum(number_of_customers)number_of_customers
                                                    ,sum(has_USSD)has_USSD,sum(New_USSD)New_USSD,sum(Active_USSD)Active_USSD
                                                    ,sum(has_ALAT)has_ALAT,sum(New_ALAT)New_ALAT,sum(Active_ALAT)Active_ALAT 
                                                    ,sum(has_ALAT_Business)has_ALAT_Business,sum(New_ALAT_Business)New_ALAT_Business,sum(Active_ALAT_Business)Active_ALAT_Business 
                                                    ,sum(has_debit_card)has_debit_card,sum(New_debit_card)New_debit_card,sum(Active_debit_card)Active_debit_card 
                                                    from location 
                                                    where sbu_name='#trim(location.sbu_name)#'
                                                </cfquery>
                                                <cfset rownumber = 0 />
                                                <cfoutput> 
                                                    <cfset rownumber = rownumber + 1 />
                                                    <tr>
                                                        <td>#rownumber#</td>
                                                        <td>#location.account_officer_code#</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/accounts&account_officer_code=#location.account_officer_code#">#location.account_officer_name#</a></td>
                                                        <td>#Numberformat(location.number_of_customers,'999,999')#</td>
                                                        <td>#Numberformat(location.has_debit_card,'999,999')#</td>
                                                        <td>#Numberformat(location.New_debit_card,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_debit_card/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_debit_card/location.has_debit_card,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_ALAT,'999,999')#</td>
                                                        <td>#Numberformat(location.New_ALAT,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_ALAT/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_ALAT/location.has_ALAT,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_ALAT_Business,'999,999')#</td>
                                                        <td>#Numberformat(location.New_ALAT_Business,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_ALAT_Business/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_ALAT_Business/location.has_ALAT_Business,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td>#Numberformat(location.has_USSD,'999,999')#</td>
                                                        <td>#Numberformat(location.New_USSD,'999,999')#</td>
                                                        <td><cftry>#Numberformat(location.has_USSD/location.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><cftry>#Numberformat(location.Active_USSD/location.has_USSD,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                        <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&account_officer_code=#location.account_officer_code#">View</a></td>
                                                    </tr>
                                                </cfoutput>
                                                <strong><tr class="bg-primary-soft-header text-dark"></strong>
                                                    <th colspan="3">#location.sbu_name#</th>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.number_of_customers,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_debit_card,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_debit_card,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_debit_card/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_debit_card/location_sub_total.has_debit_card,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_ALAT,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_ALAT,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_ALAT/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_ALAT/location_sub_total.has_ALAT,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_ALAT_Business,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_ALAT_Business,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_ALAT_Business/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_ALAT_Business/location_sub_total.has_ALAT_Business,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.has_USSD,'999,999')#</td>
                                                    <td class="fw-bold">#Numberformat(location_sub_total.New_USSD,'999,999')#</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.has_USSD/location_sub_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td class="fw-bold"><cftry>#Numberformat(location_sub_total.Active_USSD/location_sub_total.has_USSD,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                    <td><a href="reports/#url.report#/#(url.keyExists('report_periord') ? url.report_period : dateformat(now(), 'ddMMYYYY'))#/insights&sbu_code=#location.sbu_code#">View</a></td>
                                                </tr>
                                        </cfoutput>
                                        <cfoutput> 
                                              <tr>
                                                <th colspan="21"><h4 class="p-3">Regional Total</h4></th>
                                              </tr>
                                            <strong><tr style class="bg-primary-soft-header text-dark"></strong>
                                                <th colspan="3"></th>
                                                <td class="fw-bold">#Numberformat(location_total.number_of_customers,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_debit_card,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_debit_card,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_debit_card/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_debit_card/location_total.has_debit_card,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_ALAT,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_ALAT,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_ALAT/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_ALAT/location_total.has_ALAT,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_ALAT_Business,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_ALAT_Business,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_ALAT_Business/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_ALAT_Business/location_total.has_ALAT_Business,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold">#Numberformat(location_total.has_USSD,'999,999')#</td>
                                                <td class="fw-bold">#Numberformat(location_total.New_USSD,'999,999')#</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.has_USSD/location_total.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
                                                <td class="fw-bold"><cftry>#Numberformat(location_total.Active_USSD/location_total.has_USSD,'999,999')#<cfcatch>0</cfcatch></cftry>%</td>
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


    <cfcase value="accounts">
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
        
            <cfquery name="inactive" datasource="wemalytics">
                select top 1000 *, datediff(d,last_transaction_date,getdate()) - 90 days_inactive
                from dim_account#reporting_month# 
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                and datediff(d,last_transaction_date,getdate()) between 91 and 180 
                and acct_cls_flg = 'N' and scheme_type in ('ODA','SBA','CAA')
                order by  datediff(d,last_transaction_date,getdate()) desc
            </cfquery> 

            <cfquery name="dornant" datasource="wemalytics">
                select top 1000 *,datediff(d,last_transaction_date,getdate()) - 180 days_dormant
                from dim_account#reporting_month# 
                where 1 = 1 
                <cfif IsDefined("url.directorate_code")> and directorate_code = '#url.directorate_code#'
                <cfelseif IsDefined("url.region_code")> and region_code = '#url.region_code#'
                <cfelseif IsDefined("url.zone_code")> and zone_code = '#url.zone_code#'
                <cfelseif IsDefined("url.branch_code")> and branch_code = '#url.branch_code#'
                <cfelseif IsDefined("url.sbu_code")> and sbu_code = '#url.sbu_code#'
                <cfelseif IsDefined("url.account_officer_code")> and account_officer_code = '#url.account_officer_code#' 
                </cfif>
                and datediff(d,last_transaction_date,getdate()) > 180 
                and acct_cls_flg = 'N' and scheme_type in ('ODA','SBA','CAA')
                order by  datediff(d,last_transaction_date,getdate()) desc
            </cfquery>
        </cfsilent>

        <div class="row" id="digital_penetration_activity">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Digital Penetration & Activity <sup><cfoutput>#titles.entity_name#</cfoutput></sup></h4>
                        </div>
                        <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab1" role="tab" aria-selected="true">Inactive</a>
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
                                                <th width="100">Product</th>
                                                <th width="100">Ledger</th>
                                                <th width="100">Last Transacted</th>
                                                <th width="100">Days Inactive</th>
                                            </tr>
                                        </thead>
                                        <cfset rownumber = 0 />
                                        <cfoutput query="inactive"> 
                                            <cfset rownumber = rownumber + 1 />
                                            <tr>
                                                <td>#rownumber#</td>
                                                <td>#inactive.account_number#</td>
                                                <td>#inactive.account_name#</td>
                                                <td>#inactive.product_name#</td>
                                                <td>#Numberformat(inactive.ledger_balance/1000,'999,999')#</td>
                                                <td>#Dateformat(inactive.last_transaction_date,'mmmm d, yyyy')#</td>
                                                <td>#Numberformat(inactive.days_inactive,'999,999')#</td>
                                            </tr>
                                        </cfoutput>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade show" id="tab2" role="tabpanel">
                                <div class="table-responsive border rounded mb-2">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr class="bg-primary text-dark">
                                                <th width="1">S/N</th>
                                                <th>Account No</th>
                                                <th>Account Name</th>
                                                <th width="100">Product</th>
                                                <th width="100">Ledger</th>
                                                <th width="100">Last Transacted</th>
                                                <th width="100">Days Dormant</th>
                                            </tr>
                                        </thead>
                                        <cfset rownumber = 0 />
                                        <cfoutput query="dornant"> 
                                            <cfset rownumber = rownumber + 1 />
                                            <tr>
                                                <td>#rownumber#</td>
                                                <td>#dornant.account_number#</td>
                                                <td>#dornant.account_name#</td>
                                                <td>#dornant.product_name#</td>
                                                <td>#Numberformat(dornant.ledger_balance/1000,'999,999')#</td>
                                                <td>#Dateformat(dornant.last_transaction_date,'mmmm d, yyyy')#</td>
                                                <td>#Numberformat(dornant.days_dormant,'999,999')#</td>
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
            const element = document.getElementById('digital_penetration_activity');
            htmlpdf()
            .from(element)
            .save();

        }
    })
</script>