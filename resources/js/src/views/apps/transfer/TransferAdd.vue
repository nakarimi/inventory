<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <vx-card>
    <div class="clearfix">

      <!-- @TODO: Adding item choose to transfer between stocks. -->

      <h1>Add New Transfer</h1>
      <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
        <div class="w-full">
          <label for="">Choose Source Stock</label>
          <v-select name="source_stock" label="name" :clearable="false" v-model="form.source_stock" :options="stocks" :dir="$vs.rtl ? 'rtl' : 'ltr'">
          </v-select>
          <has-error :form="form" field="source_stock"></has-error>
        </div>
      </vs-col>
      <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
        <div class="w-full">
          <label for="">Choose Destination Stock</label>
          <v-select name="target_stock" label="name" :clearable="false" v-model="form.target_stock" :options="stocks" :dir="$vs.rtl ? 'rtl' : 'ltr'">
          </v-select>
          <has-error :form="form" field="target_stock"></has-error>
        </div>
      </vs-col>
      <!-- Import the items component from another component -->
      <items :form="form" />

      <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
        <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="total" label="Ammount" v-model="form.total" class="w-full" />
        <span class="text-danger text-sm absolute">{{ errors.first('total') }}</span>
      </vs-col>
      <vs-button class="float-right mt-6" @click="storeTransfer" :disabled="!validateForm">Send</vs-button>
      <form-error :form="form"></form-error>
    </div>
  </vx-card>
</div>
</template>

<script>
import FormError from '../../share/FormError'
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
          ammount: "0",
          unit_price: "0",
          total_price: "0",
        }, ],
        source_stock: '',
        target_stock: '',
        total: '',
        approval_status: 'nane',
      }),
      stocks: [],
    }
  },
  components: {
    FormError,
    Items,
    "v-select": vSelect,
  },
  computed: {
    validateForm() {
      return true;
      // return !this.form.errors.any() && this.form.name !== '' && this.form.code !== '' && this.form.address !== ''
    }
  },
  created() {
    if (this.$route.params.id) {
      this.loadPayment(this.$route.params.id)
    }
    else{
      this.getAllStocks();
    }
  },
  methods: {
    loadPayment(id) {
      this.axios.get(`/api/transfers/${id}/edit`).then((response) => {
        this.form.fill(response.data);
        this.getAllStocks();
      }).catch(() => {})
    },

    getAllStocks() {
      this.axios.get('/api/stocks')
        .then((response) => {
          this.stocks = response.data;

          const s = this.stocks.find((e) => e.id == this.form.source_stock)
          console.log(s);
          const ss = this.stocks.find((e) => e.id == this.form.target_stock)
          console.log(ss);
        })
    },

    storeTransfer() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/transfers/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/transfers')
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
