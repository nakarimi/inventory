<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Payment</h1>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-2/3 xl:w-2/3 p-2">
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-full xl:w-full p-2">
              <vs-input name="title" label="Payment Title" v-model="form.title" @input="form.errors.errors.title = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="title"></has-error>

            </vs-col>

            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <label for=""><small>Account</small></label>
              <v-select label="name" name="account_id" v-model="form.account_id" @input="form.errors.errors.account_id = []" :options="accounts" />
              <has-error class="text-danger text-sm" :form="form" field="account_id"></has-error>

            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <label for=""><small>Date</small></label>
              <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="date" label="Date" v-model="form.date"></datetime @input="form.errors.errors."></> = []"
              <has-error class="text-danger text-sm" :form="form" field="date"></has-error>

            </vs-col>

            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input type="number" name="ammount" label="Ammount" v-model="form.ammount" @input="form.errors.errors.ammount = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="ammount"></has-error>

            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input name="receiver" label="Paid To" v-model="form.receiver" @input="form.errors.errors.receiver = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="receiver"></has-error>

            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <label for=""><small>Type</small></label>
              <v-select name="type" v-model="form.type" @input="form.errors.errors.type = []" :options="['In', 'Out']" />
              <has-error class="text-danger text-sm" :form="form" field="type"></has-error>

            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input name="approval_code" label="Approval Code" v-model="form.approval_code" @input="form.errors.errors.approval_code = []" class="w-full" />
              <has-error class="text-danger text-sm" :form="form" field="approval_code"></has-error>

            </vs-col>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <label for=""><small>Note</small></label>
            <vs-textarea rows="6" name="note" v-model="form.note" @input="form.errors.errors.note = []" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('note') }}</span>
          </vs-col>
        </vs-row>
        <vs-button class="float-right mt-6" @click="storePayment" :disabled="form.busy">Send</vs-button>
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
        ammount: '',
        receiver: '',
        title: '',
        type: '',
        note: '',
        approval_code: '',
        account_id: '',
      }),
      accounts: [],
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
    this.loadAccounts()
  },
  methods: {
    loadPayment(id) {
      this.axios.get(`/api/fixpayments/${id}/edit`).then((response) => {
        this.form.fill(response.data);
        console.log(this.form);
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
        var x = this.form.patch(`/api/fixpayments/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/fixpayments')
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
