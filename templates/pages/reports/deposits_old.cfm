

<div class="row">
   <div class="col-sm-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
            <div class="header-title">
                <h4 class="card-title">Deposits Report (N'000)</h4>
            </div>
            <ul class="nav nav-tabs" id="myTab-1" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="location-tab" data-bs-toggle="tab" href="#location" role="tab" aria-selected="true">Location</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="deposit-class-tab" data-bs-toggle="tab" href="#deposit-class" role="tab" aria-selected="false">Class</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="segment-tab" data-bs-toggle="tab" href="#segment" role="tab" aria-selected="false">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="trend-tab" data-bs-toggle="tab" href="#trend" role="tab" aria-selected="false">SBU</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" id="trend-tab" data-bs-toggle="tab" href="#trend" role="tab" aria-selected="false">Personality cohort</a>
                </li>
            </ul>
        </div>
         <div class="card-body">
         <style "nav-item" color: "93358d" ></style>

            <div class="tab-content" id="tabContent-deposits">
                <div class="tab-pane fade show active" id="location" role="tabpanel" aria-labelledby="location-tab">
                    <cfloop from="1" to="3" index="j">
                        <div class="table-responsive border rounded mb-2">
                            <h4 class="p-3">Directorate Name</h4>
                            <table class="table table-bordered">
                                    <thead>
                                        <tr class="bg-primary text-white">
                                            <th width="1">S/N</th>
                                            <th>Region</th>
                                            <th width="100">Actual</th>
                                            <th width="100">Target</th>
                                            <th width="100">Int Expense</th>
                                            <th width="100">CoF</th>
                                            <th width="100">%CONT</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <cfloop from="1" to="5" index="i">
                                            <cfoutput>
                                            <tr>
                                                <td>#i#</td>
                                                <td>Abuja & North</td>
                                                <td>454,555</td>
                                                <td>0</td>
                                                <td>454,555</td>
                                                <td>4.3%</td>
                                                <td>34%</td>
                                            </tr>
                                            </cfoutput>
                                        </cfloop>
                                    </tbody>
                                    <tfoot>
                                        <strong><tr class="bg-soft-primary text-dark"></strong>
                                            <th colspan="2">Total</th>
                                            <td>454,555</td>
                                            <td>0</td>
                                            <td>454,555</td>
                                            <td>4.3%</td>
                                            <td>34%</td>
                                        </tr>
                                    </tfoot>
                            </table>
                        </div>
                    </cfloop>
                </div>

                <div class="tab-pane fade" id="deposit-class" role="tabpanel" aria-labelledby="deposit-class-tab">
                    Class
                </div>

                <div class="tab-pane fade" id="segment" role="tabpanel" aria-labelledby="segment-tab">
                    Biz Segment
                </div>
            </div>
            
         </div>
      </div>
   </div>
</div>