<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Purchase</h1>
        <vs-row>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <label for=""><small>Date</small></label>
            <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="date" label="Date" v-model="form.date"></datetime>
            <span class="text-danger text-sm">{{ errors.first('date') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="reference_no" label="Reference No" v-model="form.reference_no" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('reference_no') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Vendor</small></label>
            <v-select label="name" name="vendor_id" v-validate="'required'" v-model="form.vendor_id" :options="vendors" />
            <span class="text-danger text-sm">{{ errors.first('vendor_id') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Stock</small></label>
            <v-select label="name" name="stock_id" v-validate="'required'" v-model="form.stock_id" :options="stocks" />
            <span class="text-danger text-sm">{{ errors.first('stock_id') }}</span>
          </vs-col>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="total" label="Total" v-model="form.total" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('total') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <label for=""><small>Due Date</small></label>
            <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="due_date" label="Date" v-model="form.due_date"></datetime>
            <span class="text-danger text-sm">{{ errors.first('due_date') }}</span>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-textarea rows="10" v-validate="'required'" data-vv-validate-on="blur" label="Note" name="note" v-model="form.note" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('note') }}</span>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="discount" label="Discount" v-model="form.discount" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('discount') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="total_tax" label="Total Tax" v-model="form.total_tax" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('total_tax') }}</span>
          </vs-col>
        </vs-row>
        <form-error :form="form"></form-error>
        <vs-button class="float-right mt-6" @click="storePurchase" :disabled="!validateForm">Send</vs-button>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import FormError from '../../share/FormError'
import vSelect from "vue-select";
import { Datetime } from 'vue-datetime';
export default {
  data() {
    return {
      form: new Form({
        reference_no: '',
        date: '',
        vendor_id: '',
        vendor: '',
        stock_id: '',
        note: '',
        total: '',
        discount: '',
        total_tax: '',
        payment_status: 'none',
        due_date: '',
      }),
      vendors: [],
      billers: [],
      stocks: [],
    }
  },
  components: {
    FormError, datetime: Datetime,
    "v-select": vSelect,
  },
  computed: {
    validateForm() {
      return true;
      // return this.form.name !== '' &&
      //   this.form.code !== '' &&
      //   this.form.phone !== ''
    }
  },
  created() {
    if (this.$route.params.id) {
      this.loadPurchase(this.$route.params.id)
    }
    this.loadStocks()
    this.loadVendors()
  },
  methods: {
    loadStocks() {
      this.axios.get('/api/stocks').then((response) => {
        this.stocks = response.data
      }).catch(() => {})
    },
    loadPurchase(id) {
      this.axios.get(`/api/purchases/${id}/edit`).then((response) => {
        this.form.fill(response.data);
      }).catch(() => {})
    },
    loadVendors() {
      this.axios.get('/api/vendors').then((response) => {
        this.vendors = response.data
      }).catch(() => {})
    },

    storePurchase() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/purchases/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/purchases')
      }
      x.then((response) => {
        if (!this.$route.params.id) {
          this.form.reset();
        }
        this.$vs.notify({
          title: 'Success!',
          text: 'Process completed successfully!',
          color: 'success',
          iconPack: 'feather',
          icon: 'icon-check',
          position: 'top-left'
        })

      }).catch((error) => {
        if (this.form.errors.errors.error) {
          this.$vs.notify({
            title: 'Failed!',
            text: 'There is some failure, please try again!',
            color: 'danger',
            iconPack: 'feather',
            icon: 'icon-cross',
            position: 'top-left'
          })
        }
      })
    },
  }
}
</script>
