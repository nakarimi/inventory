<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <vx-card>
    <div class="vx-row pl-5">
      <div class="w-2/3">
        <div class="clearfix">
          <h1>Add New Customer</h1>
          <div class="mt-2 mb-2 grid">
            <vs-input name="name" label="Name" v-model="form.name" @input="form.errors.errors.name = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="name"></has-error>

          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input :disabled="($route.params.id)" name="email" label="Email Address" v-model="form.email" @input="form.errors.errors.email = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="email"></has-error>

          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input name="phone" label="Phone" v-model="form.phone" @input="form.errors.errors.phone = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="phone"></has-error>

          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input name="website" label="Website" v-model="form.website" @input="form.errors.errors.website = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="website"></has-error>

          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input name="address" label="Address" v-model="form.address" @input="form.errors.errors.address = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="address"></has-error>

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
      <vs-button class="float-right mt-6" @click="storeCustomer" :disabled="form.busy">{{ $route.params.id ? 'Update' : 'Create'}}</vs-button>
    </div>
  </vx-card>
</div>
</template>

<script>
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
    "v-select": vSelect,
  },
  created() {
    if (this.$route.params.id) {
      this.loadCustomer(this.$route.params.id)
    }
  },
  methods: {
    loadCustomer(id) {
      this.axios.get(`/api/customers/${id}/edit`).then((response) => {
        this.form.fill(response.data);
        this.form.image = '/img/customer/' + this.form.logo;
      }).catch(() => {})
    },
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
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/customers/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/customers')
      }
      x.then((response) => {
        // By uploading the image, the failure repsonse is different.
        // Here is extra step to extract error from string response and assing to form errors.
        if(typeof response.data == 'string' && response.data.indexOf(`The given data was invalid`) >= 0){
          var res = response.data.split(`{"message"`);
          var data = JSON.parse(`{"message"`+res[1]);
          this.form.errors.set(data.errors);
        }else{
          if (!this.$route.params.id) {
            this.form.reset();
          } else {
            this.$router.push("/apps/list/customer");
          }
          this.$vs.notify({
            title: 'Success!',
            text: 'Process completed successfully!',
            color: 'success',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-left'
          })
        }

      }).catch((error) => {
        console.log(this.form.errors);
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
