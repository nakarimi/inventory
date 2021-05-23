<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Payment</h1>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="reference_no" label="Reference No" v-model="form.reference_no" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('reference_no') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Purchase</small></label>
            <v-select label="reference_no" :disabled="(form.sale_id != null)" name="purchase_id" v-model="form.purchase_id" :options="purchases" />
            <span class="text-danger text-sm absolute">{{ errors.first('purchase_id') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Sale</small></label>
            <v-select label="reference_no" :disabled="(form.purchase_id != null)" name="sale_id" v-model="form.sale_id" :options="sales" />
            <span class="text-danger text-sm absolute">{{ errors.first('sale_id') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Account</small></label>
            <v-select label="name" name="account_id" v-validate="'required'" v-model="form.account_id" :options="accounts" />
            <span class="text-danger text-sm absolute">{{ errors.first('account_id') }}</span>
          </vs-col>

        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="amount" label="Ammount" v-model="form.amount" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('amount') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="paid_by" label="Paid By" v-model="form.paid_by" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('paid_by') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="created_by" label="Created By" v-model="form.created_by" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('created_by') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Type</small></label>
            <v-select name="type" v-validate="'required'" v-model="form.type" :options="['In', 'Out']" />
            <span class="text-danger text-sm absolute">{{ errors.first('type') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <label for=""><small>Note</small></label>
            <vs-textarea rows="6" v-validate="'required'" data-vv-validate-on="blur" name="note" v-model="form.note" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('note') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="approval_code" label="Approval Code" v-model="form.approval_code" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('approval_code') }}</span>
          </vs-col>
        </vs-row>
        <form-error :form="form"></form-error>
        <vs-button class="float-right mt-6" @click="storePayment" :disabled="!validateForm">Send</vs-button>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import FormError from '../../share/FormError'
import vSelect from "vue-select";
import {
  Datetime
} from 'vue-datetime';

export default {
  data() {
    return {
      form: new Form({
        reference_no: '',
        amount: '',
        paid_by: '',
        created_by: '',
        type: '',
        note: '',
        approval_code: '',
        sale_id: null,
        purchase_id: null,
        account_id: '',
      }),
      purchases: [],
      sales: [],
      accounts: [],
    }
  },
  components: {
    FormError,
    datetime: Datetime,
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
      this.loadPayment(this.$route.params.id)
    }
    this.loadSales()
    this.loadPurchases()
    this.loadAccounts()
  },
  methods: {
    loadSales() {
      this.axios.get('/api/sales').then((response) => {
        this.sales = response.data
      }).catch(() => {})
    },
    loadPayment(id) {
      this.axios.get(`/api/payments/${id}/edit`).then((response) => {
        this.form.fill(response.data);
        console.log(this.form);
      }).catch(() => {})
    },
    loadPurchases() {
      this.axios.get('/api/purchases').then((response) => {
        this.purchases = response.data
      }).catch(() => {})
    },
    loadAccounts() {
      this.axios.get('/api/accounts').then((response) => {
        this.accounts = response.data
      }).catch(() => {})
    },

    // Send data to API to store purchase.
    storePayment() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/payments/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/payments')
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
