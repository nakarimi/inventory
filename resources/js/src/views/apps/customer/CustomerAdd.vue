<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <h1>Add New Customer</h1>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="name" label="Name" v-model="form.name" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('name') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="email" label="Email Address" v-model="form.email" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('email') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="phone" label="Phone" v-model="form.phone" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('phone') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="website" label="Website" v-model="form.website" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('website') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="address" label="Address" v-model="form.address" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('address') }}</span>
        </div>
        <vs-button class="float-right mt-6" @click="storeCustomer" :disabled="!validateForm">Send</vs-button>
        <form-error :form="form"></form-error>
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
        email: '',
        phone: '',
        website: '',
        address: '',
        logo: '',
      }),
    }
  },
  components: {
    FormError,
    "v-select": vSelect,
  },
  computed: {
    validateForm() {
      return !this.form.errors.any() &&
       this.form.name !== '' &&
       this.form.email !== '' &&
       this.form.phone !== ''
    }
  },
  created() {
  },
  methods: {
    storeCustomer() {
      this.form.post('/api/customers')
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
