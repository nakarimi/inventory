<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Order</h1>
        <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-2/4 xl:w-2/4 p-2">
          <vs-input name="title" label="Title" v-model="form.title" @input="form.errors.errors.title = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="title"></has-error>
        </vs-col>
        <!-- Import the items component from another component -->
        <items :form="form" :isOrder="true" />
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <label for=""><small>Details</small></label>
            <vs-textarea rows="10" name="note" v-model="form.note" @input="form.errors.errors.note = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="note"></has-error>
          </vs-col>
        </vs-row>
        <vs-button class="float-right mt-6" @click="storeOrder" :disabled="form.busy">{{ $route.params.id ? 'Update' : 'Create'}}</vs-button>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import vSelect from "vue-select";
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
        title: '',
        note: '',

      }),
      customers: [],
      billers: [],
      stocks: [],
    }
  },
  components: {
    "v-select": vSelect,
    Items,
  },
  created() {
    if (this.$route.params.id) {
      this.loadOrder(this.$route.params.id)
    }
    this.loadStocks()
    this.loadCustomers()
    this.loadBillers()
  },
  methods: {
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
    loadOrder(id) {
      this.axios.get(`/api/orders/${id}/edit`).then((response) => {
        this.form.fill(response.data);

      }).catch(() => {})
    },
    loadCustomers() {
      this.axios.get('/api/customers').then((response) => {
        this.customers = response.data
      }).catch(() => {})
    },

    storeOrder() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/orders/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/orders')
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
