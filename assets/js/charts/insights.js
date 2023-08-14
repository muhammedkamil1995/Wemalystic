(function (jQuery) {

      if (document.querySelectorAll("#product-insights-bar-01").length) {
        const variableColors = WemaUtils.getVariableColor();
        var secondary_blue = "#79C7E5" 
        const colors = [variableColors.primary, secondary_blue];
        var options = {
            series: [{
            name: '',
            data: highestBranchValues
          }, {
            name: '',
            data: highestTeamValues
          }],
            chart: {
            type: 'bar',
            toolbar: {
                show: false,
            },
            height: 400
          },
          colors: colors,
          plotOptions: {
            bar: {
              horizontal: false,
              columnWidth: '55%',
              endingShape: 'rounded'
            },
          },
          dataLabels: {
            enabled: false
          },
          legend: {
            show: false,
          },
          stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
          },
          xaxis: {
            categories: ['Large Coperation', 'Oil & Gas', 'Aviation & Marine', 'Manufacturing H/O', 'Infrastructure & Telecom'],
          },
          yaxis: {
            title: {
              text: '',
            },
          },
          fill: {
            opacity: 1
          },
          tooltip: {
            y: {
              formatter: function (val) {
                return "$ " + val + " thousands"
              }
            }
          }
        };
  
        var chart = new ApexCharts(document.querySelector("#product-insights-bar-01"), options);
        chart.render();

        //color customizer
  document.addEventListener("theme_color", (e) => {
    const variableColors = WemaUtils.getVariableColor();
    const colors = [variableColors.primary, secondary_blue];

    const newOpt = {
      colors: colors,
      
    };
    chart.updateOptions(newOpt);
  });

  //Font customizer
  document.addEventListener("body_font_family", (e) => {
    let prefix =
      getComputedStyle(document.body).getPropertyValue("--prefix") || "bs-";
    if (prefix) {
      prefix = prefix.trim();
    }
    const font_1 = getComputedStyle(document.body).getPropertyValue(
      `--${prefix}body-font-family`
    );
    const fonts = [font_1.trim()];
    const newOpt = {
      chart: {
        fontFamily: fonts,
      },
    };
    chart.updateOptions(newOpt);
  });

    }

    if (document.querySelectorAll("#zone-population-insights-01").length) {
        const variableColors = WemaUtils.getVariableColor();
        let secondary_blue = "#79C7E5" 
        let arsh = "#77828C";
        let dark_arsh = "#57585A";
        let lighter_arsh = "#EEF4F6";
        const colors = [variableColors.primary, secondary_blue, arsh, dark_arsh, lighter_arsh ];
        var options = {
            series: highestZonePopulation,
            chart: {
            width: 380,
            type: 'donut',
          },
          dataLabels: {
            enabled: false
          },
          colors: colors,
          responsive: [{
            breakpoint: 480,
            options: {
              chart: {
                width: 200
              },
              legend: {
                show: false
              }
            }
          }],
          legend: {
            show: false,
          },
        };

        var chart = new ApexCharts(document.querySelector("#zone-population-insights-01"), options);
        chart.render();

        //color customizer
  document.addEventListener("theme_color", (e) => {
    const variableColors = WemaUtils.getVariableColor();
    let secondary_blue = "#79C7E5" 
    let arsh = "#77828C";
    let dark_arsh = "#57585A";
    let lighter_arsh = "#EEF4F6";
    const colors = [variableColors.primary, secondary_blue, arsh, dark_arsh, lighter_arsh ];

    const newOpt = {
      colors: colors,
      
    };
    chart.updateOptions(newOpt);
  });

  //Font customizer
  document.addEventListener("body_font_family", (e) => {
    let prefix =
      getComputedStyle(document.body).getPropertyValue("--prefix") || "bs-";
    if (prefix) {
      prefix = prefix.trim();
    }
    const font_1 = getComputedStyle(document.body).getPropertyValue(
      `--${prefix}body-font-family`
    );
    const fonts = [font_1.trim()];
    const newOpt = {
      chart: {
        fontFamily: fonts,
      },
    };
    chart.updateOptions(newOpt);
  });

    }
})(jQuery);