<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Payment</h1>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-2/3 xl:w-2/3 p-2">
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-full xl:w-full p-2">
              <vs-input v-validate="'required'" data-vv-validate-on="blur" name="title" label="Payment Title" v-model="form.title" class="w-full" />
              <span class="text-danger text-sm absolute">{{ errors.first('title') }}</span>
            </vs-col>

            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <label for=""><small>Account</small></label>
              <v-select label="name" name="account_id" v-validate="'required'" v-model="form.account_id" :options="accounts" />
              <span class="text-danger text-sm absolute">{{ errors.first('account_id') }}</span>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <label for=""><small>Date</small></label>
              <datetime :auto="true" class="w-full" input-class="vs-inputx vs-input--input normal" name="date" label="Date" v-model="form.date"></datetime>
              <span class="text-danger text-sm absolute">{{ errors.first('date') }}</span>
            </vs-col>

            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="ammount" label="Ammount" v-model="form.ammount" class="w-full" />
              <span class="text-danger text-sm absolute">{{ errors.first('ammount') }}</span>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input v-validate="'required'" data-vv-validate-on="blur" name="receiver" label="Paid To" v-model="form.receiver" class="w-full" />
              <span class="text-danger text-sm absolute">{{ errors.first('receiver') }}</span>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <label for=""><small>Type</small></label>
              <v-select name="type" v-validate="'required'" v-model="form.type" :options="['In', 'Out']" />
              <span class="text-danger text-sm absolute">{{ errors.first('type') }}</span>
            </vs-col>
            <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
              <vs-input v-validate="'required'" data-vv-validate-on="blur" name="approval_code" label="Approval Code" v-model="form.approval_code" class="w-full" />
              <span class="text-danger text-sm absolute">{{ errors.first('approval_code') }}</span>
            </vs-col>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <label for=""><small>Note</small></label>
            <vs-textarea rows="6" v-validate="'required'" data-vv-validate-on="blur" name="note" v-model="form.note" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('note') }}</span>
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
