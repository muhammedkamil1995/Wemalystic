(function (jQuery) {
    if(document.querySelectorAll("#multipleLine").length) {

        new Chart(document.getElementById("multipleLine").getContext("2d"), {
            type: 'line',
            data: {
                labels: [
                    'Jan 22','Feb 22','Mar 22','Apr 22','May 22','Jun 22',
                    'Jul 22','Aug 22','Sep 22','Oct 22','Nov 22', 'Dec 22'
                    ],
                datasets: [{ 
                    data: [86,90,30,23,40,30,33,54,80,98, 65, 66],
                    label: "Mobile Deposit",
                    borderColor: "#3e95cd",
                    fill: false
                }, { 
                    data: [28,35,41,50,63,80,94,40,37,52, 33, 79],
                    label: "Bank Deposit",
                    borderColor: "#8e5ea2",
                    fill: false
                }, { 
                    data: [16,17,17,19,20,27,40,54,67,73, 76, 40],
                    label: "P.O.S",
                    borderColor: "#3cba9f",
                    fill: false
                }]
            },
            options: {
                legend: {
                    display: false
                }
            }
        });
    }
})(jQuery);