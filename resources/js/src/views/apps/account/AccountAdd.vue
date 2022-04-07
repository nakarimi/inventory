<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <h1>Add New Account</h1>
        <div class="mt-2 mb-2 grid">
          <vs-input name="name" label="Label" v-model="form.name" @input="form.errors.errors.name = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="name"></has-error>
        </div>
        <div class="mt-2 mb-2 grid">
          <div class="w-full">
            <label for="">Choose User</label>
            <v-select name="account_user_id" :clearable="false" :get-option-label="option => option.first_name + ' ' + option.last_name" v-model="form.account_user_id" @input="form.errors.errors.account_user_id = []" :options="users" :dir="$vs.rtl ? 'rtl' : 'ltr'">
            </v-select>
            <has-error class="text-danger text-sm" :form="form" field="account_user_id"></has-error>
          </div>
        </div>
        <div class="mt-2 mb-2 grid">
          <label for="" class="mt-2 mb-2">Account Status</label>
          <vs-switch color="success" v-model="form.status" @input="form.errors.errors.status = []">
            <span slot="on">Active</span>
            <span slot="off">Inactive</span>
          </vs-switch>
          <has-error class="text-danger text-sm" :form="form" field="status"></has-error>
        </div>
        <vs-button class="float-right mt-6" @click="storeAccount" :disabled="form.busy">{{ $route.params.id ? 'Update' : 'Create'}}</vs-button>
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
        account_user_id: '',
        name: '',
        status: '',
      }),
      users: [],
    }
  },
  components: {
    "v-select": vSelect,
  },
  created() {
    this.getAllUsers();
    if (this.$route.params.id) {
      this.loadAccount(this.$route.params.id)
    }
  },
  methods: {
    getAllUsers() {
      this.axios.get('/api/users')
        .then((response) => {
          this.users = response.data;
        })
    },
    loadAccount(id) {
      this.axios.get(`/api/accounts/${id}/edit`).then((response) => {
        this.form.fill(response.data);
        this.axios.get(`/api/users/${this.form.account_user_id}/edit`).then((response2) => {
          this.form.account_user_id = response2.data;
          console.log(this.form);

        }).catch(() => {})
      }).catch(() => {})
    },
    storeAccount() {
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/accounts/${this.$route.params.id}`)
      } else {
        var x = this.form.post('/api/accounts')
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
            this.$router.push("/apps/list/account");
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
