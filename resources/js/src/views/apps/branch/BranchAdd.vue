<template>
<div class="h-screen flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" label-placeholder="Name" name="name" placeholder="Name" v-model="form.name" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('name') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" label-placeholder="Code" name="code" placeholder="Code" v-model="form.code" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('code') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" label-placeholder="Address" name="address" placeholder="Address" v-model="form.address" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('address') }}</span>
        </div>
        <vs-button class="float-right mt-6" @click="storeBranch" :disabled="!validateForm">Send</vs-button>
        <form-error :form="form"></form-error>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import FormError from '../../share/FormError'

export default {
  data() {
    return {
      form: new Form({
        code: '',
        name: '',
        address: '',
      }),
    }
  },
  components: {
    FormError
  },
  computed: {
    validateForm() {
      return true;
      // return !this.form.errors.any() && this.form.name !== '' && this.form.code !== '' && this.form.address !== ''
    }
  },
  created() {},
  watch: {
    'this.form.'() {
      console.log(this.form);
    }
  },
  methods: {
    storeBranch() {
      this.form.post('/api/branches')
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
