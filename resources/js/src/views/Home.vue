<template>
<div>
  <h1 class="mb-5">Overview Panel</h1>
  <vs-row>
    <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
      <vs-card>
        <vue-apex-charts :key="productsSalesKey" type="bar" height="450" :options="productsSales.chartOptions" :series="productsSales.series"></vue-apex-charts>
      </vs-card>
    </vs-col>
    <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
      <vs-card>
        <vue-apex-charts :key="accountsBalanceKey" type="line" height="450" :options="accountsBalance.chartOptions" :series="accountsBalance.series" />
      </vs-card>
    </vs-col>
  </vs-row>
  <vs-card>
    <vue-apex-charts :key="financeStatusKey" type="bar" height="350" :options="financeStatus.chartOptions" :series="financeStatus.series"></vue-apex-charts>
  </vs-card>
</div>
</template>

<script>
import VueApexCharts from 'vue-apexcharts'

export default {
  data() {
    return {
      productsSalesKey: 0,

      accountsBalanceKey: 0,

      financeStatusKey: 0,
      // Financial status chart configuration.
      productsSales: {
        series: [{
          data: []
        }],
        chartOptions: {
          colors: ['#7367F0', '#28C76F', '#EA5455', '#FF9F43', '#1E1E1E'],
          title: {
            text: 'Products Sales',
            align: 'left'
          },

          plotOptions: {
            bar: {
              horizontal: true,
            }
          },
          dataLabels: {
            enabled: false
          },
          xaxis: {
            categories: [],
          },
          tooltip: {
            y: {
              formatter: function (val) {
                return " " + val + " thousands"
              }
            }
          }
        }
      },

      // Actuall data to show in the chart.
      financeStatus: {
        series: [],
        chartOptions: {
          title: {
            text: 'Financial Status',
            align: 'center'
          },
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
            categories: [],
          },
          yaxis: {
            title: {
              text: ' (thousands)'
            }
          },
          fill: {
            opacity: 1

          },
          tooltip: {
            y: {
              formatter: function (val) {
                return " " + val + " thousands"
              }
            }
          }
        }
      },

      accountsBalance: {
        series: [],
        chartOptions: {
          title: {
            text: 'Accounts Balance History',
            align: 'right'
          },
          chart: {
            height: 500,
            toolbar: {
              show: false
            },
            export: {
              csv: {
                filename: undefined,
                columnDelimiter: ',',
                headerCategory: 'category',
                headerValue: 'value',
                dateFormatter(timestamp) {
                  return new Date(timestamp).toDateString()
                }
              },
              svg: {
                filename: undefined,
              },
              png: {
                filename: undefined,
              }
            },
            dropShadow: {
              enabled: true,
              top: 5,
              left: 0,
              blur: 4,
              opacity: 0.10
            }
          },
          stroke: {
            // curve: 'smooth',
            width: 2
          },
          grid: {
            borderColor: '#e7e7e7'
          },
          legend: {
            show: false
          },
          markers: {
            size: 0,
            hover: {
              size: 5
            }
          },
          xaxis: {
            labels: {
              style: {
                cssClass: 'text-grey fill-current'
              }
            },
            axisTicks: {
              show: false
            },
            categories: [],
            axisBorder: {
              show: false
            }
          },
          yaxis: {
            // opposite: true,
            tickAmount: 5,
            labels: {
              style: {
                cssClass: 'text-grey fill-current direction-ltr'
              },
              // formatter(val) {
              //   return val > 999 ? `${(val / 1000).toFixed(0)} k` : val
              // }
            }
          },
          tooltip: {
            x: {
              show: false
            }
          }
        },
      },

    }
  },
  components: {
    VueApexCharts
  },
  created() {
    this.getProductsSales();
    this.getAccountsBalance();
    this.getFinanceStatus();
  },
  methods: {

    // Get Products sales data from api
    getProductsSales() {
      this.axios.get('/api/reports/getProductsSales').then((response) => {
        this.productsSales.series = [{
          data: response.data[1]
        }]
        this.productsSales.chartOptions.xaxis.categories = response.data[0]
        this.productsSalesKey += 1;
      }).catch(() => {})
    },

    // Get categories data from api
    getAccountsBalance() {
      this.axios.get('/api/reports/getAccountsBalance').then((response) => {
        console.log(response.data);
        this.accountsBalance.series = response.data[1]
        this.accountsBalance.chartOptions.xaxis.categories = response.data[0]
        this.accountsBalanceKey += 1;
      }).catch(() => {})
    },

    // Get finance status data from api
    getFinanceStatus() {
      this.axios.get('/api/reports/getFinanceStatus').then((response) => {
        this.financeStatus.series = response.data[1]
        this.financeStatus.chartOptions.xaxis.categories = response.data[0]
        this.financeStatusKey += 1
      }).catch(() => {})
    }
  },
}
</script>
