<cfscript>
    welcomeMessages = {
        morning: {
            title: "Good Morning, Olubunmi!",
            text: [
                "Explore Wemalytics and access top data analysis on the go",
                "You are Awesome! Grab a Cup of Coffee to start your day"
            ]
        }
    };

    showMessage = welcomeMessages.morning;
</cfscript>
<div class="wemalytics-navbar-header bg-primary-dash" style="height: 215px;">
    <div class="container-fluid wemalytics-container">
        <div class="row">
            <div class="col-md-12">
                <div class="flex-wrap d-flex justify-content-between align-items-center">
                    <div>
                        <cfoutput>
                        <h1>#showMessage.title#</h1>
                        <p>#showMessage.text[randRange(1, showMessage.text.len())]#</p>
                        </cfoutput>
                    </div>
                    <div  style="width: 20%; display: flex" class="">
                        <div class="form-group mb-0" style="width: 80%; padding-right: 5px">
                            <input type="text" name="start" class="form-control range_flatpicker flatpickr-input" placeholder="24 Jan 2022 to 23 Feb 2022" readonly="readonly">
                        </div>
                        <button type="button" class="btn btn-warning" style="">
                             <svg fill="none" xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24">
                                <circle cx="11.7669" cy="11.7666" r="8.98856" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                <path d="M18.0186 18.4851L21.5426 22" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>