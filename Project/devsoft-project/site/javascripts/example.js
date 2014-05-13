/*
 * Scripts for the example page.
 */

 JSON.open

/*
 * Shows the next token in the welcome message.
 */
function showNextToken() {
  // If the current token is not the last one:
  // show current token and schedule the next one.
  if ($(this).next().length > 0) {
    $(this).next().fadeIn(200, showNextToken);
  }
}

// This anonymous function will be executed after the page is loaded.
$(function() {

  // Hide the welcome div until all tokens have been created.
  $('.welcome').hide();

  // Create tokens.
  $(['w', 'e' , 'l', 'c', 'o', 'm', 'e', ' :)']).each(function(idx, token) {
    $('.welcome').append("<span>" + token + "</span>");
  });

  // Hide all newly created tokens and show welcome div.
  $('.welcome span').hide();
  $('.welcome').show();

  // Start animation.
  $('.welcome span').eq(0).fadeIn(200, showNextToken);

});

$(function graphPie() { 
      // Radialize the colors
    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function graphPie(color) {
        return {
            radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    });
    
    // Build the chart
        $('#graphPie').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'Vagas Analisadas'
            },
            tooltip: {
              pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        },
                        connectorColor: 'silver'
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['Validas',    45.0],
                    ['Duplicadas', 45.0],
                    {
                        name: 'Em Branco',
                        y: 45.0,
                        sliced: true,
                        selected: true
                    },
                    ['teste', 45.0]
                ]
            }]
        });
    });
$(function graphColumm() {
        $('#graphColumm').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Vagas por periodo'
            },
            subtitle: {
                text: 'Source: Portal de Estagios -  PCS'
            },
            xAxis: {
                type: 'category',
                labels: {
                    rotation: -45,
                    align: 'right',
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Vagas (millions)'
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                pointFormat: 'Vagas: <b>{point.y:.1f}</b>',
            },
            series: [{
                name: 'Population',
                data: [
                    ['Shanghai', 23.7],
                    ['Lagos', 16,1],
                    ['Instanbul', 14.2],
                    ['Karachi', 14.0],
                    ['Mumbai', 12.5],
                    ['Moscow', 12.1],
                    ['São Paulo', 11.8], 
                    ['Lima', 8.9]
                ],
                dataLabels: {
                    enabled: true,
                    rotation: -90,
                    color: '#FFFFFF',
                    align: 'right',
                    x: 4,
                    y: 10,
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif',
                        textShadow: '0 0 3px black'
                    }
                }
            }]
        });
    });