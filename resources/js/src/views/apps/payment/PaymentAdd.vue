<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Payment</h1>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="reference_no" label="Reference No" v-model="form.reference_no" @input="form.errors.errors.reference_no = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="reference_no"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Purchase</small></label>
            <v-select label="reference_no" :disabled="(form.sale_id != null)" name="purchase_id" v-model="form.purchase_id" @input="onSelectItem($event), form.errors.errors.purchase_id = [], form.type = 'Out'" :options="purchases" />
            <has-error class="text-danger text-sm" :form="form" field="purchase_id"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Sale</small></label>
            <v-select label="reference_no" :disabled="(form.purchase_id != null)" name="sale_id" v-model="form.sale_id" @input="onSelectItem($event), form.errors.errors.sale_id = [], form.type = 'In'" :options="sales" />
            <has-error class="text-danger text-sm" :form="form" field="sale_id"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Account</small></label>
            <v-select label="name" name="account_id" v-model="form.account_id" @input="form.errors.errors.account_id = []" :options="accounts" />
            <has-error class="text-danger text-sm" :form="form" field="account_id"></has-error>

          </vs-col>

        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" name="amount" :max="max_allowed_pay" :label="`Amount(max: ${max_allowed_pay})`" v-model="form.amount" @input="form.errors.errors.amount = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="amount"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="paid_by" label="Paid By" v-model="form.paid_by" @input="form.errors.errors.paid_by = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="paid_by"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="created_by" label="Created By" v-model="form.created_by" @input="form.errors.errors.created_by = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="created_by"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Type</small></label>
            <v-select name="type" disabled v-model="form.type" @input="form.errors.errors.type = []" :options="['In', 'Out']" />
            <has-error class="text-danger text-sm" :form="form" field="type"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <label for=""><small>Note</small></label>
            <vs-textarea rows="6" name="note" v-model="form.note" @input="form.errors.errors.note = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="note"></has-error>

          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-input name="approval_code" label="Approval Code" v-model="form.approval_code" @input="form.errors.errors.approval_code = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="approval_code"></has-error>

          </vs-col>
        </vs-row>
        <vs-button class="float-right mt-6" @click="storePayment" :disabled="form.busy">{{ $route.params.id ? 'Update' : 'Create'}}</vs-button>
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
      max_allowed_pay: 0,
      type: 0,
    }
  },
  components: {
    datetime: Datetime,
    "v-select": vSelect,
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
    onSelectItem(data) {
      if (this.form.purchase_id) {
        var id = this.form.purchase_id.id
        this.type = 'purchase'
        var max = this.form.purchase_id.total;
      } else {
        var id = this.form.sale_id.id
        this.type = 'sale'
        var max = this.form.sale_id.total;
      }
      this.axios.get(`/api/sale_max_value/${this.type}/${id}`).then((response) => {
        this.max_allowed_pay = max - response.data
      }).catch(() => {})
    },
    loadSales() {
      this.axios.get('/api/sales').then((response) => {
        this.sales = response.data
      }).catch(() => {})
    },
    loadPayment(id) {
      this.axios.get(`/api/payments/${id}/edit`).then((response) => {
        this.form.fill(response.data);
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
      if(this.max_allowed_pay < this.form.amount){
          this.$vs.notify({
            title: 'Failed!',
            text: 'Amount must be less or equal to max allowed!',
            color: 'danger',
            iconPack: 'feather',
            icon: 'icon-cross',
            position: 'top-left'
          })
      }else{
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
          this.$vs.notify({
            title: 'Failed!',
            text: 'There is some failure, please try again!',
            color: 'danger',
            iconPack: 'feather',
            icon: 'icon-cross',
            position: 'top-left'
          })
        })
      }
    },
  }
}
</script>
