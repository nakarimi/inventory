<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <h1>Add New Stock</h1>
        <div class="mt-2 mb-2 grid">
          <vs-input data-vv-validate-on="blur" name="name" label="Name" v-model="form.name" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('name') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input data-vv-validate-on="blur" name="code" label="Code" v-model="form.code" :disabled="($route.params.id)" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('code') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input data-vv-validate-on="blur" name="manager" label="Manager" v-model="form.manager" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('manager') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input data-vv-validate-on="blur" name="phone" label="Phone" v-model="form.phone" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('phone') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input data-vv-validate-on="blur" name="address" label="Address" v-model="form.address" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('address') }}</span>
        </div>
        <form-error :form="form"></form-error>
        <vs-button class="float-right mt-6" @click="storeStock" :disabled="!validateForm">Send</vs-button>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import FormError from '../../share/FormError'
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
    FormError,
    "v-select": vSelect,
  },
  computed: {
    validateForm() {
      return true;
      return this.form.name !== '' &&
        this.form.code !== '' &&
        this.form.phone !== ''
    }
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
