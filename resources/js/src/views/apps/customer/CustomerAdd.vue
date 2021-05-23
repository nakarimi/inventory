<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <!-- <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4"> -->
  <vx-card>
    <div class="vx-row pl-5">
      <div class="w-2/3">
        <div class="clearfix">
          <h1>Add New Customer</h1>
          <div class="mt-2 mb-2 grid">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="name" label="Name" v-model="form.name" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('name') }}</span>
          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="email" label="Email Address" v-model="form.email" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('email') }}</span>
          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="phone" label="Phone" v-model="form.phone" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('phone') }}</span>
          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="website" label="Website" v-model="form.website" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('website') }}</span>
          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="address" label="Address" v-model="form.address" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('address') }}</span>
          </div>
        </div>
      </div>
        <div class="vx-col w-1/3">
          <template v-if="form.image">
            <div class="img-container w-64 mx-auto flex items-center justify-center mt-5">
              <img :src="form.image" width="50px" height="50px" alt="img" class="user_image responsive" />
            </div>
            <div class="modify-img flex justify-center mt-5">
              <input type="file" class="hidden" ref="updateImgInput" @change="updateCurrImg" accept="image/*" />
              <vs-button class="mr-4" @click="$refs.updateImgInput.click()">Change</vs-button>
              <vs-button color="warning" @click="form.image = null">Remove</vs-button>
            </div>
          </template>
          <template v-if="!form.image">
            <div class="mt-4">
              <div class="img-container w-64 mx-auto flex items-center justify-center">
                <img src="/img/customer/default.jpg" width="50px" height="50px" alt="img" @click="$refs.uploadImgInput.click()" class="user_image responsive cursor-pointer" />
              </div>
            </div>
          </template>
          <div class="upload-img mt-5 text-center" v-if="!form.image">
            <input type="file" class="hidden" ref="uploadImgInput" @change="updateCurrImg" accept="image/*" />
            <vs-button @click="$refs.uploadImgInput.click()">Upload</vs-button>
          </div>
        </div>
      <form-error :form="form"></form-error>
    <vs-button class="float-right mt-6" @click="storeCustomer" :disabled="!validateForm">Send</vs-button>
    </div>
  </vx-card>
  <!-- </div> -->
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
        image: '',
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
  created() {},
  methods: {
    updateCurrImg(input) {
      if (input.target.files && input.target.files[0]) {
        const reader = new FileReader()
        reader.onload = e => {
          this.form.image = e.target.result
        }
        reader.readAsDataURL(input.target.files[0])
      }
    },
    storeCustomer() {
      this.form.logo = this.form.image;
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
