<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Sale</h1>
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
            <label for=""><small>Customer</small></label>
            <v-select label="name" name="customer_id" v-validate="'required'" v-model="form.customer_id" :options="customers" />
            <span class="text-danger text-sm">{{ errors.first('customer_id') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Biller</small></label>
            <v-select label="name" name="biller_id" v-validate="'required'" v-model="form.biller_id" :get-option-label="option => option.first_name + ' ' +option.last_name" :options="billers" />
            <span class="text-danger text-sm">{{ errors.first('biller_id') }}</span>
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
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="product_tax" label="Product Tax" v-model="form.product_tax" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('product_tax') }}</span>
          </vs-col>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="payment_term" label="Payment Term" v-model="form.payment_term" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('payment_term') }}</span>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="total_items" label="Total Items" v-model="form.total_items" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('total_items') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="pos" label="Pos" v-model="form.pos" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('pos') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="paid" label="Paid" v-model="form.paid" class="w-full" />
            <span class="text-danger text-sm">{{ errors.first('paid') }}</span>
          </vs-col>
        </vs-row>
        <form-error :form="form"></form-error>
        <vs-button class="float-right mt-6" @click="storeSale" :disabled="!validateForm">Send</vs-button>
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
      this.loadSale(this.$route.params.id)
    }
    this.loadStocks()
    this.loadCategory()
    this.loadBillers()
  },
  methods: {
    updateCurrImg(input) {
      if (input.target.files && input.target.files[0]) {
        const reader = new FileReader()
        reader.onload = e => {
          this.form.image = e.target.result
        }
        reader.readAsDataURL(input.target.files[0])
      }
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
        this.form.image = '/img/product/' + this.form.image;
      }).catch(() => {})
    },
    loadCategory() {
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
