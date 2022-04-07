<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <h1>Add New Stock</h1>
        <div class="mt-2 mb-2 grid">
          <vs-input name="name" label="Name" v-model="form.name" @input="form.errors.errors.name = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="name"></has-error>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input name="code" label="Code" v-model="form.code" @input="form.errors.errors.code = []" :disabled="($route.params.id)" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="code"></has-error>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input name="manager" label="Manager" v-model="form.manager" @input="form.errors.errors.manager = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="manager"></has-error>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input name="phone" label="Phone" v-model="form.phone" @input="form.errors.errors.phone = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="phone"></has-error>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input name="address" label="Address" v-model="form.address" @input="form.errors.errors.address = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="address"></has-error>
        </div>
        <vs-button class="float-right mt-6" @click="storeStock" :disabled="form.busy">{{ $route.params.id ? 'Update' : 'Create'}}</vs-button>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import vSelect from "vue-select";

export default {
  data() {
    return {
      form: new Form({
        name: '',
        code: '',
        phone: '',
        manager: '',
        address: '',
      }),
    }
  },
  components: {
    "v-select": vSelect,
  },
  created() {
    if (this.$route.params.id) {
      this.loadStock(this.$route.params.id)
    }
  },
  methods: {
    loadStock(id) {
      this.axios.get(`/api/stocks/${id}/edit`).then((response) => {
        this.form.fill(response.data);
        console.log(this.form);
      }).catch(() => {})
    },
    storeStock() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/stocks/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/stocks')
      }
      x.then((response) => {
        if (!this.$route.params.id) {
          this.form.reset();
        } else {
          this.$router.push("/apps/list/stock");
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
