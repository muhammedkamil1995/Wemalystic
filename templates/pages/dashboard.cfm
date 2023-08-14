<cfquery name="location" datasource="wemalytics">
    select * from cubes.dbo.fact_deposit#reporting_month#
    order by directorate_name,region_name
</cfquery>

<cfquery name="location_total" dbtype="query">
    select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
    sum(target_value)target_value,sum(interest_expense)interest_expense from location
    group by number_of_days,days_in_year
</cfquery>

<cfquery name="risk_location" datasource="wemalytics">
    select * from cubes.dbo.fact_loan#reporting_month#
    order by directorate_name,region_name
</cfquery>

<cfquery name="risk_location_total" dbtype="query">
    select number_of_days,days_in_year,sum(ledger_balance)ledger_balance,sum(average_balance)average_balance,
    sum(target_value)target_value,sum(interest_income)interest_income from risk_location
    group by number_of_days,days_in_year
</cfquery>

<cfquery name="income" datasource="wemalytics">
    select sum(amount)amount from cubes.dbo.fact_income#reporting_month#
</cfquery>

<cfquery name="location_account_statistics" datasource="wemalytics">
    select * from cubes.dbo.fact_account_statistics#reporting_month#
    order by directorate_name,region_name
</cfquery>

<cfquery name="location_account_statistics_total" dbtype="query">
    select sum(account_opened)account_opened,sum(is_funded)is_funded,sum(account_total)account_total
    ,sum(account_closed)account_closed,sum(account_active)account_active,sum(account_inactive)account_inactive,sum(account_dormant)account_dormant 
    from location_account_statistics
</cfquery>

<cfquery name="digital" datasource="wemalytics">
    select sum(number_of_accounts)number_of_accounts,sum(number_of_customers)number_of_customers
    ,sum(has_USSD)has_USSD,sum(New_USSD)New_USSD,sum(Active_USSD)Active_USSD
    ,sum(has_ALAT)has_ALAT,sum(New_ALAT)New_ALAT,sum(Active_ALAT)Active_ALAT 
    ,sum(has_ALAT_Business)has_ALAT_Business,sum(New_ALAT_Business)New_ALAT_Business,sum(Active_ALAT_Business)Active_ALAT_Business 
    ,sum(has_debit_card)has_debit_card,sum(New_debit_card)New_debit_card,sum(Active_debit_card)Active_debit_card 
    from cubes.dbo.facts_digital_penetration_activity
</cfquery>



<div class="row">
    <div class="col-lg-6">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                <cfoutput query="location_total"> 
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                        <div>
                            <span><b>Deposits</b></span>
                            
                            <div class="mt-2">
                                <a href="reports/deposits">
                                <h2 class="counter" style="visibility: visible;">
                                <cfset nairaSymbol = chr(8358)>
                                #nairaSymbol#<span>#Numberformat(location_total.average_balance/1000,'999,999')#</span>
                            </h2>
                        </a>
                    </div>
                            
                        </div>
                        <div>
                        
                        </div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                        <div>
                            <span>Cost of Funds</span>
                        </div>
                        <div>
                            <span><cftry>#NumberFormat(val(location_total.interest_expense)/val(location_total.average_balance)*val(location_total.days_in_year)/val(location_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</span>
                        </div>
                        </div>
                        <div class="mt-3">
                        <div class="progress bg-soft-primary shadow-none w-100" style="height: 6px">
                            <div class="progress-bar bg-primary-dash" data-toggle="progress-bar" role="progressbar" aria-valuenow="4.3" aria-valuemin="0" aria-valuemax="100" style="width: 4.3%; transition: width 2s ease 0s;"></div>
                        </div>
                        </div>
                    </div>
                </cfoutput>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                <cfoutput query="risk_location_total"> 
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                        <div>
                            <span><b>Risk Assets</b></span>
                            
                            <div class="mt-2">
                                <a href="reports/loans">
                                <h2 class="counter" style="visibility: visible;">
                                <cfset nairaSymbol = chr(8358)>
                                #nairaSymbol#<span>#Numberformat(risk_location_total.average_balance/1000,'999,999')#</span>
                            </h2> </a>
                            </div>
                            
                        </div>
                        <div>
                            
                        </div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                        <div>
                            <span>Yields</span>
                        </div>
                        <div>
                            <span><cftry>#NumberFormat(val(risk_location_total.interest_income)/val(risk_location_total.average_balance)*val(risk_location_total.days_in_year)/val(risk_location_total.number_of_days)*100,'999,999.9')#<cfcatch>0.0</cfcatch></cftry>%</span>
                        </div>
                        </div>
                        <div class="mt-3">
                        <div class="progress bg-soft-warning shadow-none w-100" style="height: 6px">
                            <div class="progress-bar bg-warning" data-toggle="progress-bar" role="progressbar" aria-valuenow="11.2" aria-valuemin="0" aria-valuemax="100" style="width: 11.2%; transition: width 2s ease 0s;"></div>
                        </div>
                        </div>
                    </div>
                </cfoutput>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                        <div>
                            <span><b>Commision & Fees</b></span>
                            <div class="mt-2">
                                <a href="reports/income">
                                <h2 class="counter" style="visibility: visible;">&#8358;<cfoutput>#Numberformat(income.amount/1000,'999,999')#</cfoutput></h2></a>
                            </div>
                        </div>
                        <div>
                            <span class="badge bg-danger"></span>
                        </div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                        <div>
                            <span></span>
                        </div>
                        <div>
                            <span>&nbsp</span>
                        </div>
                        </div>
                        <div class="mt-3">
                        <div class="progress bg-soft-danger shadow-none w-100" style="height: 6px">
                            <div class="progress-bar bg-danger" data-toggle="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%; transition: width 2s ease 0s;"></div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                <cfoutput query="location_account_statistics_total"> 
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                        <div>
                            <span><b>Customer Acquisition</b></span>
                            <div class="mt-2">
                                <a href="reports/account_statistics">
                                <h2 class="counter" style="visibility: visible;">
                                <span>#Numberformat(location_account_statistics_total.account_total,'999,999')#</span>
                            </h2></a>
                         </div>
                        </div>
                        <div>
                        
                        </div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                        <div>
                            <span>Active Customers (#Numberformat(location_account_statistics_total.account_active,'999,999')#)</span>
                        </div>
                        <div>
                            <span class="counter" style="visibility: visible;">
                                <cftry>#Numberformat(location_account_statistics_total.account_inactive/location_account_statistics_total.account_opened,'999,999')#<cfcatch>0</cfcatch></cftry>%
                            </span>
                        </div>
                        </div>
                        <div class="mt-3">
                        <div class="progress bg-soft-info shadow-none w-100" style="height: 6px">
                            <div class="progress-bar bg-info" data-toggle="progress-bar" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%; transition: width 2s ease 0s;"></div>
                        </div>
                        </div>
                    </div>
                </cfoutput> 
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6 col-xl-6">
        <div class="card">
            <div class="flex-wrap card-header d-flex justify-content-between align-items-center">
                <div class="header-title">
                    <h4>Digital Adoption</h4>
                </div>
                <div class="dropdown">
                    <a href="#" class="text-gray dropdown-toggle" id="dropdownMenuButton35" data-bs-toggle="dropdown" aria-expanded="false">This Week</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton35" style="">
                    <li><a class="dropdown-item" href="#">This Day</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                    </ul>
                </div>
            </div>
            <div class="card-body pb-2">
                <div class=" mb-3">
                    <div class="progress analytics-progress">
                        <div class="progress-bar bg-primary-dash" role="progressbar" aria-label="Segment one" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-info" role="progressbar" aria-label="Segment two" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-tertiray" role="progressbar" aria-label="Segment three" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-warning" role="progressbar" aria-label="Segment three" style="width: 30%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between mb-3 mt-4">
                        <div class=" d-flex align-items-center" style="width: 40%">
                            <p class="ms-2 mb-0"><b>Channels</b></p>
                        </div>
                        <p class="mb-0"><b>Count</b></p>
                        <p class="mb-0"><b>Adoption Ratio</b></p>
                        <p class="mb-0"><b>Activity Ratio</b></p>
                    </div>
                    <cfoutput>
                    <div class="d-flex justify-content-between mb-3 mt-4">
                        <div class=" d-flex align-items-center" style="width: 36%">
                            <svg  class="text-primary" width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="5" cy="5" r="5" fill="currentColor"/>
                            </svg>
                            <a href="reports/digital_penetration_activity"><p class="ms-2 mb-0">Debit Cards</p></a>
                        </div>
                        <p class="mb-0">#Numberformat(digital.has_debit_card,'999,999')#</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.has_debit_card/digital.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.Active_debit_card/digital.has_debit_card*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                        <div class="d-flex align-items-center" style="width: 36%">
                            <svg  class="text-info" width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="5" cy="5" r="5" fill="currentColor"/>
                            </svg>
                            <a href="reports/digital_penetration_activity"><p class="ms-2 mb-0">ALAT</p></a>
                        </div>
                        <p class="mb-0">#Numberformat(digital.has_alat,'999,999')#</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.has_alat/digital.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.Active_alat/digital.has_alat*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                        <div class="d-flex align-items-center" style="width: 36%">
                            <svg  class="text-tertiray" width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="5" cy="5" r="5" fill="currentColor"/>
                            </svg>
                            <a href="reports/digital_penetration_activity"><p class="ms-2 mb-0">ALAT Business</p></a>
                        </div>
                        <p class="mb-0">#Numberformat(digital.has_alat_business,'999,999')#</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.has_alat_business/digital.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.active_alat_business/digital.has_alat_business*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                        <div class="d-flex align-items-center" style="width: 36%">
                            <svg class="text-warning" width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="5" cy="5" r="5" fill="currentColor"/>
                            </svg>
                            <a href="reports/digital_penetration_activity"><p class="ms-2 mb-0">USSD </p></a>
                        </div>
                        <p class="mb-0">#Numberformat(digital.has_ussd,'999,999')#</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.has_ussd/digital.number_of_customers*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                        <p class="mb-0"><cftry>#Numberformat(digital.active_ussd/digital.has_ussd*100,'999,999')#<cfcatch>0</cfcatch></cftry>%</p>
                    </div>
                </cfoutput>
                </div>
            </div> 
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-8 col-xl-8">
        <div class="row">
            <div class="col-lg-12">
                <div class="card card-block card-stretch card-height">
                    <div class="flex-wrap card-header d-flex justify-content-between align-items-center">
                        <div class="header-title">
                            <h4>Report Analytics</h4>
                        </div>
                        <div class="d-flex">
                            <div class="mx-3">
                                <p class="mb-0"><svg class="text-primary" width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle cx="5" cy="5" r="5" fill="currentColor"/>
                                    </svg>  Deposits </p>
                            </div>
                            <div class="mx-3">
                                <p class="mb-0"><svg class="text-secondary" width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle cx="5" cy="5" r="5" fill="currentColor"/>
                                    </svg> Risk Assets</p>
                            </div>
                            <div class="">
                                <p class="mb-0"><svg  class="text-tertiray" width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle cx="5" cy="5" r="5" fill="currentColor"/>
                                    </svg>  Commission & Fees</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="sales-chart-02"  class="sales-chart-02"></div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
    <div class="col-lg-4 col-md-12">
        <div class="card">
            <div class="flex-wrap card-header d-flex justify-content-between align-items-center border-0 pb-0">
                <div class="header-title">
                    <h4>Most Viewed Report</h4>
                </div>
                 <div class="dropdown">
                    <a href="#" class="text-gray dropdown-toggle" id="dropdownMenuButton24" data-bs-toggle="dropdown" aria-expanded="false">Today</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton24" style="">
                    <li><a class="dropdown-item" href="#">This Week</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                    </ul>
                </div>
            </div>
             <div  class="card-body">
                <div class="table-responsive border rounded">
                    <table id="transaction-table" class="table mb-0 table-striped" role="grid">
                        <thead class="bg-soft-primary">
                            <tr class="">
                                <th width="1">SN</th>
                                <th>Reports</th>
                                <th width="10">Count</th>
                            </tr>
                        </thead>
                        <!---<tbody>
                        <cfloop from="1" to="6" index="index">
                            <cfoutput>
                            <tr>
                                <td>#index#</td>
                                <td>Deposit Report</td>
                                <td>#randRange(100, 500)#</td>
                            </tr>
                            </cfoutput>
                        </cfloop>
                        </tbody>--->
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>