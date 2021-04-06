<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <h1>Add New Stock</h1>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="name" label="Name" v-model="form.name" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('name') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="code" label="Code" v-model="form.code" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('code') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="manager" label="Manager" v-model="form.manager" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('manager') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="phone" label="Phone" v-model="form.phone" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('phone') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="address" label="Address" v-model="form.address" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('address') }}</span>
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
      return this.form.name !== '' &&
        this.form.code !== '' &&
        this.form.phone !== ''
    }
  },
  created() {},
  methods: {
    storeStock() {
      this.form.logo = this.form.image;
      this.form.post('/api/stocks')
        .then((response) => {
          this.form.reset();
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
