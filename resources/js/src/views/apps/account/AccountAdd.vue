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
  },
  methods: {
    getAllUsers() {
      this.axios.get('/api/users')
        .then((response) => {
          this.users = response.data;
        })
    },

    storeAccount() {
      this.form.post('/api/accounts')
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
