<template lang="">
<div>
  <div class="flex w-full bg-img vx-row no-gutter justify-center">
    <div class="vx-col w-full sm:m-0 m-4">
      <vx-card class="w-full">
        <h2 class="mb-5">Reports</h2>
        <vs-row>

          <vs-col class="sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4">
            <vs-col class="my-2 p-2">
              <label for="">Start Date</label>
              <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="start_date" v-model="start_date" @input="all = null"></datetime>
            </vs-col>
          </vs-col>
          <vs-col class="sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4">
            <vs-col class="my-2 p-2">
              <label for="">End Date</label>
              <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="end_date" v-model="end_date" @input="all = null"></datetime>
            </vs-col>
          </vs-col>
          <vs-col class="sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4">
            <vs-col class="my-2 p-2">
              <label for=""></label>
              <vs-checkbox v-model="all" class="mt-5 pt-3" @input="start_date = null, end_date = null">All</vs-checkbox>
            </vs-col>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col>
            <p class="text-danger text-sm" v-if="(start_date && end_date) && start_date >= end_date">Start date should be before the end date!</p>
            <vs-divider class="p-3"></vs-divider>
            <div class="flex w-full bg-img vx-row mb-5 pb-5 no-gutter justify-between">
              <vs-button type="border" :color="all || (start_date && end_date) ? 'primary' : 'danger'" :disabled="! (all || ((start_date && end_date) && (start_date < end_date)))" @click="salesReport"><strong>Sales Report </strong></vs-button>
              <vs-button type="border" :color="all || (start_date && end_date) ? 'primary' : 'danger'" :disabled="! (all || ((start_date && end_date) && (start_date < end_date)))" @click="purchaseReport"><strong>Purchase Report </strong></vs-button>
              <vs-button type="border" :color="all || (start_date && end_date) ? 'primary' : 'danger'" :disabled="! (all || ((start_date && end_date) && (start_date < end_date)))" @click="transfersReport"><strong>Transfers Report </strong></vs-button>
              <vs-button type="border" :color="all || (start_date && end_date) ? 'primary' : 'danger'" :disabled="! (all || ((start_date && end_date) && (start_date < end_date)))" @click="trnsactionsReport"><strong>Transections Report </strong></vs-button>
              <vs-button type="border" :color="all || (start_date && end_date) ? 'primary' : 'danger'" :disabled="! (all || ((start_date && end_date) && (start_date < end_date)))" @click="balanceSheetReport"><strong>Balance Sheet Report </strong></vs-button>
            </div>
          </vs-col>
        </vs-row>
      </vx-card>
      <br>
      <vx-card>
      <ul>
        <li v-for="(report, i) in all_reports">
          <a href="" @click="downloadReports(report)" >{{ report }}</a>
        </li>
      </ul>
      </vx-card>

    </div>
  </div>

</div>
</template>

<script>
import {
  Datetime
} from 'vue-datetime';

export default {
  data() {
    return {
      start_date: null,
      end_date: null,
      all: null,
      all_reports: [],
    }
  },
  created () {
    this.allReports();
  },
  components: {
    Datetime
  },
  methods: {

    allReports() {
      this.$vs.loading();
      this.axios.get('/api/reports/all_reports').then((response) => {
        this.all_reports = response.data;
      }).catch(() => {this.$vs.loading.close()})
    },
    downloadReports(file) {
      this.$vs.loading();
        window.open("/api/download/pdf?file="+file, '_blank').focus();
    },
    salesReport() {
      this.$vs.loading();
      this.axios.get('/api/reports/sales_report', {
        params: {
          start_date: this.start_date,
          end_date: this.end_date,
          all: this.all
        }
      }).then((response) => {
        this.$vs.loading.close()
      }).catch(() => {this.$vs.loading.close()})
    },
    purchaseReport() {
      this.$vs.loading();
      this.axios.get('/api/reports/purchase_report', {
        params: {
          start_date: this.start_date,
          end_date: this.end_date,
          all: this.all
        }
      }).then((response) => {
        this.$vs.loading.close()
      }).catch(() => {this.$vs.loading.close()})
    },
    transfersReport() {
      this.$vs.loading();
      this.axios.get('/api/reports/transfers_report', {
        params: {
          start_date: this.start_date,
          end_date: this.end_date,
          all: this.all
        }
      }).then((response) => {
        this.$vs.loading.close()
      }).catch(() => {this.$vs.loading.close()})
    },
    trnsactionsReport() {
      this.$vs.loading();
      this.axios.get('/api/reports/trnsactions_report', {
        params: {
          start_date: this.start_date,
          end_date: this.end_date,
          all: this.all
        }
      }).then((response) => {
        this.$vs.loading.close()
      }).catch(() => {this.$vs.loading.close()})
    },
    balanceSheetReport() {
      this.$vs.loading();
      this.axios.get('/api/reports/balancesheet_report', {
        params: {
          start_date: this.start_date,
          end_date: this.end_date,
          all: this.all
        }
      }).then((response) => {
        this.$vs.loading.close()
      }).catch(() => {this.$vs.loading.close()})
    },
  },

}
</script>

<style lang="">
  
</style>
