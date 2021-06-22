<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Sale</h1>
        <vs-row>

          <vs-col class="sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4">
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
              <label for=""><small>Date</small></label>
              <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="date" label="Date" v-model="form.date" @input="form.errors.errors.date = []"></datetime>
              <has-error class="text-danger text-sm" :form="form" field="date"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
              <vs-input name="reference_no" label="Reference No" v-model="form.reference_no" @input="form.errors.errors.reference_no = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="reference_no"></has-error>
            </vs-col>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Customer</small></label>
            <v-select label="name" :clearable="false" name="customer_id" v-model="form.customer_id" @input="form.errors.errors.customer_id = []" :options="customers" />
            <has-error class="text-danger text-sm" :form="form" field="customer_id"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Biller</small></label>
            <v-select label="name" :clearable="false" name="biller_id" v-model="form.biller_id" @input="form.errors.errors.biller_id = []" :get-option-label="option => option.first_name + ' ' + option.last_name" :options="billers" />
            <has-error class="text-danger text-sm" :form="form" field="biller_id"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Stock</small></label>
            <v-select label="name" :clearable="false" name="stock_id" v-model="form.stock_id" @input="form.errors.errors.stock_id = []" :options="stocks" />
            <has-error class="text-danger text-sm" :form="form" field="stock_id"></has-error>
          </vs-col>
        </vs-row>

        <!-- Import the items component from another component -->
        <items :form="form" />

        <vs-row>
          <vs-col class="sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2">
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input type="number" name="discount" label="Discount" v-model="form.discount" @input="form.errors.errors.discount = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="discount"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input type="number" name="product_tax" label="Product Tax" v-model="form.product_tax" @input="form.errors.errors.product_tax = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="product_tax"></has-error>
            </vs-col>

            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input name="payment_term" label="Payment Term" v-model="form.payment_term" @input="form.errors.errors.payment_term = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="payment_term"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input type="number" name="total_items" label="Total Items" v-model="form.total_items" @input="form.errors.errors.total_items = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="total_items"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input name="pos" label="Pos" v-model="form.pos" @input="form.errors.errors.pos = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="pos"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input name="paid" label="Paid" v-model="form.paid" @input="form.errors.errors.paid = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="paid"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-2/3 xl:w-2/3 p-2">
              <vs-input type="number" name="total" label="Total" v-model="form.total" @input="form.errors.errors.total = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="total"></has-error>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <label for=""><small>Due Date</small></label>
              <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="due_date" label="Date" v-model="form.due_date" @input="form.errors.errors.due_date = []"></datetime>
              <has-error class="text-danger text-sm" :form="form" field="due_date"></has-error>
            </vs-col>
          </vs-col>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <label for=""><small>Details</small></label>
            <vs-textarea rows="10" name="note" v-model="form.note" @input="form.errors.errors.note = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="note"></has-error>
          </vs-col>

        </vs-row>
        <vs-button class="float-right mt-6" @click="storeSale" :disabled="form.busy">{{ $route.params.id ? 'Update' : 'Create'}}</vs-button>
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
          amount: "0",
          unit_price: "0",
          total_price: "0",
        }, ],

        date: '',
        reference_no: '',
        customer_id: '',
        biller_id: '',
        stock_id: '',
        total: '',
        sale_status: '',
        payment_status: '',
        due_date: '',
        note: '',
        discount: '',
        product_tax: '',
        payment_term: '',
        total_items: '',
        pos: '',
        paid: '',
      }),
      customers: [],
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
    if (this.$route.query.order) {
      this.loadOrderItems()
    }
    if (this.$route.params.id) {
      this.loadSale(this.$route.params.id)
    }
    this.loadStocks()
    this.loadCustomers()
    this.loadBillers()
  },
  methods: {
    loadOrderItems() {
      this.axios.get('/api/get/items/orders/' + this.$route.query.order).then((response) => {
        this.items = response.data
        this.form.items = JSON.parse(this.items[0].items)
        this.form.customer_id = this.items[0].customer
      }).catch(() => {})
    },
    loadStocks() {
      this.axios.get('/api/stocks').then((response) => {
        this.stocks = response.data
      }).catch(() => {})
    },
    loadBillers() {
      this.axios.get('/api/users').then((response) => {
        this.billers = response.data
      }).catch(() => {})
    },
    loadSale(id) {
      this.axios.get(`/api/sales/${id}/edit`).then((response) => {
        this.form.fill(response.data);

      }).catch(() => {})
    },
    loadCustomers() {
      this.axios.get('/api/customers').then((response) => {
        this.customers = response.data
      }).catch(() => {})
    },

    storeSale() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/sales/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/sales')
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
