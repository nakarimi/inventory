<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <!-- <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4"> -->
  <vx-card>
    <div class="vx-row pl-5">
      <div class="w-2/3">
        <div class="clearfix">
          <h1>Add New Vendor</h1>
          <div class="mt-2 mb-2 grid">
            <vs-input name="name" label="Name" v-model="form.name" @input="form.errors.errors.name = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="name"></has-error>
          </div>
          <div class="mt-2 mb-2 grid">
            <vs-input name="email" :disabled="($route.params.id)" label="Email Address" v-model="form.email" @input="form.errors.errors.email = []" class="w-full" />
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
              <img src="/img/vendor/default.jpg" width="50px" height="50px" alt="img" @click="$refs.uploadImgInput.click()" class="user_image responsive cursor-pointer" />
            </div>
          </div>
        </template>
        <div class="upload-img mt-5 text-center" v-if="!form.image">
          <input type="file" class="hidden" ref="uploadImgInput" @change="updateCurrImg" accept="image/*" />
          <vs-button @click="$refs.uploadImgInput.click()">Upload</vs-button>
        </div>
      </div>
      <vs-button class="float-right mt-6" @click="storeVendor" :disabled="form.busy">Send</vs-button>
    </div>
  </vx-card>
  <!-- </div> -->
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
      this.loadVendor(this.$route.params.id)
    }
  },
  methods: {
    loadVendor(id) {
      this.axios.get(`/api/vendors/${id}/edit`).then((response) => {
        this.form.fill(response.data);
        this.form.image = '/img/vendor/' + this.form.logo;
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
    storeVendor() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/vendors/${this.$route.params.id}`)
        if (this.form.image.includes('/img/vendor/')) {
          this.form.image = this.form.image.replace('/img/vendor/', '');
        }
      } else {
        this.form.logo = this.form.image;
        var x = this.form.post('/api/vendors')
      }
      x.then((response) => {
        if (!this.$route.params.id) {
          this.form.reset();
        }else{
          this.$router.push("/apps/list/vendor");
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
