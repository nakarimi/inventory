<template>
<div>
  <h1 class="mb-5">Overview Panel</h1>
  <vs-row>
    <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
      <h5>Products Sales</h5>
      <vue-apex-charts type="bar" height="350" :options="barChart.chartOptions" :series="barChart.series"></vue-apex-charts>
    </vs-col>
    <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
      <h5>Category</h5>
      <vue-apex-charts type="radialBar" height="350" :options="radialBarChart.chartOptions" :series="radialBarChart.series"></vue-apex-charts>
    </vs-col>
  </vs-row>
  <h5>Financial Status</h5>
  <vue-apex-charts type="bar" height="350" :options="columnChart.chartOptions" :series="columnChart.series"></vue-apex-charts>

</div>
</template>

<script>
import VueApexCharts from 'vue-apexcharts'

export default {
  data() {
    return {

      // Financial status chart configuration.
      barChart: {
        series: [{
          data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
        }],
        chartOptions: {
          colors: ['#7367F0', '#28C76F', '#EA5455', '#FF9F43', '#1E1E1E'],
          plotOptions: {
            bar: {
              horizontal: true,
            }
          },
          dataLabels: {
            enabled: false
          },
          xaxis: {
            categories: ['South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan',
              'United States', 'China', 'Germany'
            ],
          }
        }
      },

      // Actuall data to show in the chart.
      columnChart: {
        series: [{
          name: 'Net Profit',
          data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
        }, {
          name: 'Revenue',
          data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
        }, {
          name: 'Expense',
          data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
        }],
        chartOptions: {
          colors: [
            "#4ea397",
            "#22c3aa",
            "#7bd9a5",
            '#7367F0',
            '#28C76F',
            '#EA5455',
            '#FF9F43',
            '#1E1E1E'
          ],
          plotOptions: {
            bar: {
              horizontal: false,
              endingShape: 'rounded',
              columnWidth: '55%',
            },
          },
          dataLabels: {
            enabled: false
          },
          stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
          },

          xaxis: {
            categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
          },
          yaxis: {
            title: {
              text: '$ (thousands)'
            }
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
        }
      },

      
      // Category chart information.
      radialBarChart: {
        series: [44, 55, 67, 83],
        chartOptions: {
          colors: ['#7367F0', '#28C76F', '#EA5455', '#FF9F43', '#1E1E1E'],
          plotOptions: {
            radialBar: {
              dataLabels: {
                name: {
                  fontSize: '22px',
                },
                value: {
                  fontSize: '16px',
                },
                total: {
                  show: true,
                  label: 'Total',
                  formatter: function (w) {
                    // By default this function returns the average of all series. The below is just an example to show the use of custom formatter function
                    return 249
                  }
                }
              }
            }
          },
          labels: ['Apples', 'Oranges', 'Bananas', 'Berries'],
        }
      }
    }
  },
  components: {
    VueApexCharts
  }
}
</script>
