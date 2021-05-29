<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <h1 v-if="$route.params.id">Update Branch</h1>
        <h1 v-if="!$route.params.id">Add New Branch</h1>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="name" label="Name" v-model="form.name" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('name') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="code" label="Code" v-model="form.code" @input="form.code = form.code.replaceAll(' ', '_').toLowerCase()" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('code') }}</span>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="address" label="Address" v-model="form.address" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('address') }}</span>
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
  created() {
    if (this.$route.params.id) {
      this.loadBranch(this.$route.params.id)
    }
  },
  methods: {
    loadBranch(id) {
      this.axios.get(`/api/branches/${id}/edit`).then((response) => {
        this.form.fill(response.data);

      }).catch(() => {})
    },
    storeBranch() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/branches/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/branches')
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
