(function (jQuery) {
    
    if (document.querySelectorAll("#multiple-line-01").length) {
        const variableColors = WemaUtils.getVariableColor();
        const colors = [variableColors.primary, variableColors.secondary, variableColors.tertiray];
        const options = {
          series: [{
            name: "Deposits",
            data: [10, 41, 35, 51, 49, 72, 39, 21, 148]
            },
            {
              name: "Risk Assets",
              data: [20, 62, 70, 88, 67, 30, 100, 51, 98]
          },
            {
              name: "Commission & Fees",
              data: [10, 82, 75, 68, 47, 90, 59, 101, 108]
          }],
          colors: colors,
          chart: {
            height: "100%",
            type: "line",
            toolbar: {
              show: false,
            },
          },
          dataLabels: {
            enabled: false,
          },
          stroke: {
            width: 3,
          },
          legend: {
            show: false,
          },
          grid: {
            show: true,
            strokeDashArray: 7,
          },
           forecastDataPoints: {
            count: 3,
          },
          markers: {
            size: 6,
            colors: "#FFFFFF",
            strokeColors: colors,
            strokeWidth: 2,
            strokeOpacity: 0.9,
            strokeDashArray: 0,
            fillOpacity: 0,
            shape: "circle",
            radius: 2,
            offsetX: 0,
            offsetY: 0,
          },
          xaxis: {
            categories: [
              "Jan",
              "Feb",
              "Mar",
              "Apr",
              "May",
              "Jun",
              "Jul",
              "Aug",
              "Sep",
            ],
            axisBorder: {
              show: false,
            },
            axisTicks: {
              show: false,
            },
            tooltip: {
              enabled: false,
            },
          },
        };
    
        const chart = new ApexCharts(
          document.querySelector("#multiple-line-01"),
          options
        );
        chart.render();
    
        //color customizer
        document.addEventListener("theme_color", (e) => {
          const variableColors = WemaUtils.getVariableColor();
          const colors = [variableColors.primary, variableColors.secondary, variableColors.tertiray];
    
          const newOpt = {
            colors: colors,
            markers: {
              strokeColors: colors,
            },
            fill: {
              type: "gradient",
              gradient: {
                shade: "dark",
                type: "vertical",
                gradientToColors: colors, // optional, if not defined - uses the shades of same color in series
                opacityFrom: 1,
                opacityTo: 1,
                colors: colors,
              },
            },
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