<template>
<div class="h-screen flex w-full bg-img vx-row no-gutter items-center justify-center">
  <div v-bind:class="{ 'vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4': this.$route.name == 'page-signup' , 'vx-col sm:w-2/2 md:w-2/2 lg:w-4/4 xl:w-4/5 sm:m-0 m-4': this.$route.name == 'register'}">
    <vx-card>
      <div slot="no-body" class="full-page-bg-color">
        <div class="vx-row no-gutter">
          <div class="vx-col hidden sm:hidden md:hidden lg:block lg:w-1/2 mx-auto self-center">
            <img src="@assets/images/pages/register.png" alt="register" class="mx-auto">
          </div>
          <div class="vx-col sm:w-full md:w-full lg:w-1/2 mx-auto self-center pb-5 d-theme-dark-bg">
            <div class="px-8 pt-8 register-tabs-container">
              <div class="vx-card__title mb-4">
                <h4 class="mb-4">Create Account</h4>
                <p>Fill the below form to create a new account.</p>
              </div>
              <div class="clearfix">
                <div class="w-full">
                  <label for=""><small>Choose Branch</small></label>
                  <v-select name="branch" :clearable="false" :get-option-label="option => option.name + ' - ' + option.code" v-model="form.branch" :options="branches" :dir="$vs.rtl ? 'rtl' : 'ltr'">
                  </v-select>
                  <has-error :form="form" field="branch"></has-error>
                </div>
                <div class="mt-2 mb-2 grid">
                  <vs-input v-validate="'required'" data-vv-validate-on="blur" label-placeholder="First Name" name="first_name" placeholder="First Name" v-model="form.first_name" class="w-full" />
                  <span class="text-danger text-sm">{{ errors.first('first_name') }}</span>

                </div>
                <div class="mt-2 mb-2 grid">
                  <vs-input v-validate="'required'" data-vv-validate-on="blur" label-placeholder="Last Name" name="last_name" placeholder="Last Name" v-model="form.last_name" class="w-full" />
                  <span class="text-danger text-sm">{{ errors.first('last_name') }}</span>

                </div>

                <div class="mt-2 mb-2 grid">
                  <vs-input v-validate="'required|email'" data-vv-validate-on="blur" name="email" type="email" label-placeholder="Email" placeholder="Email" v-model="form.email" class="w-full" />
                  <span class="text-danger text-sm">{{ errors.first('email') }}</span>

                </div>
                <div class="mt-2 mb-2 grid">
                  <vs-input v-validate="'required'" data-vv-validate-on="blur" label-placeholder="Phone" name="phone" placeholder="Phone" v-model="form.phone" class="w-full" />
                  <span class="text-danger text-sm">{{ errors.first('phone') }}</span>

                </div>
                <div class="mt-2 mb-2 grid">
                  <vs-input v-validate="'required'" data-vv-validate-on="blur" label-placeholder="Address" name="address" placeholder="Address" v-model="form.address" class="w-full" />
                  <span class="text-danger text-sm">{{ errors.first('address') }}</span>

                </div>

                <div class="mt-2 mb-2 grid">
                  <vs-input ref="password" type="password" data-vv-validate-on="blur" v-validate="'required|min:6'" name="password" label-placeholder="Password" placeholder="Password" v-model="form.password" class="w-full" />
                  <span class="text-danger text-sm">{{ errors.first('password') }}</span>

                </div>

                <div class="mt-2 mb-2 grid">
                  <vs-input type="password" v-validate="'min:6|confirmed:password'" data-vv-validate-on="blur" data-vv-as="password" name="confirm_password" label-placeholder="Confirm Password" placeholder="Confirm Password" v-model="form.confirm_password" class="w-full" />
                  <span class="text-danger text-sm">{{ errors.first('confirm_password') }}</span>

                </div>

                <vs-checkbox v-model="isTermsConditionAccepted" class="mt-6">I accept the terms & conditions.</vs-checkbox>
                <vs-button type="border" to="/pages/login" class="mt-6">Login</vs-button>
                <vs-button class="float-right mt-6" @click="registerUser" :disabled="!validateForm">Register</vs-button>
              </div>
              <form-error></form-error>
            </div>
          </div>
        </div>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import vSelect from "vue-select";
import FormError from '../share/FormError'

export default {
  data() {
    return {
      branches: [],
      form: new Form({
        first_name: '',
        last_name: '',
        phone: '',
        address: '',
        email: '',
        branch: '',
        password: '',
        confirm_password: '',
      }),
      isTermsConditionAccepted: true
    }
  },
  components: {
    "v-select": vSelect,
    FormError,
  },
  computed: {
    validateForm() {
      return !this.form.errors.any() && this.form.first_name !== '' && this.form.email !== '' && this.form.password !== '' && this.form.confirm_password !== '' && this.isTermsConditionAccepted === true
    }
  },
  created() {
    console.log(this.$route.name);
    this.getAllBranches();
  },
  methods: {
    getAllBranches() {
      this.axios.get('/api/branches')
        .then((response) => {
          this.branches = response.data;
        })
    },
    checkLogin() {
      // If user is already logged in notify
      if (this.$store.state.auth.isUserLoggedIn()) {
        this.$vs.notify({
          title: 'Login Attempt',
          text: 'You are already logged in!',
          iconPack: 'feather',
          icon: 'icon-alert-circle',
          color: 'warning'
        })
        return false
      }
      return true
    },
    registerUser() {
      this.form.post('/api/users')
        .then(() => {
          this.$vs.notify({
            title: 'Signup!',
            text: 'New user registered successfully!',
            color: 'success',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-right'
          })
          this.form.reset();
        })
        .catch((errors) => {
          this.$vs.notify({
            title: 'Signup failed!',
            color: 'danger',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-right'
          })
        })

    }
  }
}
</script>

<style lang="scss">
.register-tabs-container {
  min-height: 517px;

  .con-tab {
    padding-bottom: 23px;
  }
}
</style>
