<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Purchase</h1>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Date</small></label>
            <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="date" label="Date" v-model="form.date" @input="form.errors.errors.date = []"></datetime>
            <has-error class="text-danger text-sm" :form="form" field="date"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="reference_no" label="Reference No" v-model="form.reference_no" @input="form.errors.errors.reference_no = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="reference_no"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Vendor</small></label>
            <v-select label="name" name="vendor_id" v-model="form.vendor_id" @input="form.errors.errors.vendor_id = []" :options="vendors" />
            <has-error class="text-danger text-sm" :form="form" field="vendor_id"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Stock</small></label>
            <v-select label="name" name="stock_id" v-model="form.stock_id" @input="form.errors.errors.stock_id = []" :options="stocks" />
            <has-error class="text-danger text-sm" :form="form" field="stock_id"></has-error>
          </vs-col>
        </vs-row>

        <!-- Import the items component from another component -->
        <items :form="form" />

        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <label for=""><small>Note</small></label>
            <vs-textarea rows="6" name="note" v-model="form.note" @input="form.errors.errors.note = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="note"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
              <vs-input type="number" name="discount" label="Discount" v-model="form.discount" @input="form.errors.errors.discount = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="discount"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
              <vs-input type="number" name="total_tax" label="Total Tax" v-model="form.total_tax" @input="form.errors.errors.total_tax = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="total_tax"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
              <vs-input type="number" name="total" label="Total" v-model="form.total" @input="form.errors.errors.total = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="total"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
              <label for=""><small>Due Date</small></label>
              <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="due_date" label="Date" v-model="form.due_date" @input="form.errors.errors.due_date = []"></datetime>
              <has-error class="text-danger text-sm" :form="form" field="due_date"></has-error>
            </vs-col>
          </vs-col>
        </vs-row>
        <vs-button class="float-right mt-6" @click="storePurchase" :disabled="form.busy">{{ $route.params.id ? 'Update' : 'Create'}}</vs-button>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import vSelect from "vue-select";
import {
  Datetime
} from 'vue-datetime';
import Items from '../../share/Items'

export default {
  data() {
    return {
      form: new Form({
        items: [{
          category_id: "",
          item_id: "",
          unit_id: "",
          ammount: "0",
          unit_price: "0",
          total_price: "0",
        }, ],
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
    datetime: Datetime,
    "v-select": vSelect,
    Items,
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

    // Send data to API to store purchase.
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
        this.$vs.notify({
          title: 'Failed!',
          text: 'There is some failure, please try again!',
          color: 'danger',
          iconPack: 'feather',
          icon: 'icon-cross',
          position: 'top-left'
        })

      })
    },
  }
}
</script>
