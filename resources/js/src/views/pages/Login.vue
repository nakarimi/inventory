<template>
<div class="h-screen flex w-full bg-img vx-row no-gutter items-center justify-center" id="page-login">
  <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4">
    <vx-card>
      <div slot="no-body" class="full-page-bg-color">

        <div class="vx-row no-gutter justify-center items-center">

          <div class="vx-col hidden lg:block lg:w-1/2">
            <img src="@assets/images/pages/login.jpg" alt="login" class="mx-auto">
          </div>

          <div class="vx-col sm:w-full md:w-full lg:w-1/2 d-theme-dark-bg">
            <div class="p-8 login-tabs-container">

              <div class="vx-card__title mb-4">
                <h4 class="mb-4">Login</h4>
                <p>Welcome back, please login to your account.</p>
              </div>

              <div>
                <vs-input name="email" icon-no-border icon="icon icon-user" icon-pack="feather" label-placeholder="Email" v-model="form.username" class="w-full mt-6 mb-6 inline-block" />

                <vs-input type="password" name="password" icon-no-border icon="icon icon-lock" icon-pack="feather" label-placeholder="Password" v-model="form.password" class="w-full mt-6 mb-6 inline-block" />

                <div class="flex flex-wrap justify-between my-4">
                  <vs-checkbox v-model="checkbox_remember_me" class="mb-3">Remember Me</vs-checkbox>
                  <span class="cursor-pointer link-color" @click="showAlert('Please, Contact with adminstrator to reset your Password!')">Forgot Password?</span>
                </div>
                <vs-button class="float-right" :disabled="!validateForm" @click="loginAction">Login</vs-button>
                <!-- <vs-button type="border" to="/pages/signup">Register</vs-button> -->
                <!-- <vs-divider>OR</vs-divider> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
export default {
  data() {
    return {
      email: "",
      password: "",
      checkbox_remember_me: false,
      form: new Form({
        username: '',
        password: '',
        grant_type: 'password',
        client_id: 1,
        client_secret: 'qrD0ZTrHHaXpvwzmRawSc6kr2QR2sKosl1Jpv7Gx',
        scope: '*'
      })
    }
  },
  created() {
    this.checkLogin();
  },
  methods: {
    checkLogin() {
      if (localStorage.getItem('token')) {
        setTimeout(() => {
          this.$router.go(0);
          window.location.href = '/';
        }, 500);
        this.$vs.notify({
          title: 'You have access to the system!',
          color: 'success',
          iconPack: 'feather',
          icon: 'icon-check',
          position: 'top-right'
        })
      }
    },
    loginAction() {
      this.$vs.loading()
      this.form.post('/oauth/token')
        .then((data) => {
          localStorage.setItem('token', data.data.access_token);
          this.$vs.notify({
            title: 'Welcome!',
            text: 'You have login successfully!',
            color: 'success',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-right'
          })
          setTimeout(() => {
            this.$router.go(0);
            window.location.href = '/';
          }, 500);

        })
        .catch(() => {
          this.$vs.notify({
            title: 'Failed!',
            text: 'Please, try again!',
            color: 'danger',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-right'
          })
          this.$vs.loading.close()
        })
    },
    showAlert: (m) => {
      alert(m)
    },
  },
  computed: {
    validateForm() {
      return !this.errors.any() && this.form.email !== '' && this.form.password !== ''
    }
  },
}
</script>
