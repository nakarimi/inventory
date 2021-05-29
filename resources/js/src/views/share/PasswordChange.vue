<template lang="">
<div>
  <h6 class="text-warning">Remmeber your new password, after update you will be logout to login with new password!</h6>
  <div class="mt-2 mb-2 grid">
    <vs-input autocomplete="off" ref="current_password" type="password" data-vv-validate-on="blur" v-validate="'required|min:6'" name="current_password" label-placeholder="Password" placeholder="Current Password" v-model="form.current_password" class="w-full" />
    <span class="text-danger text-sm absolute">{{ errors.first('current_password') | remove_ }}</span>
  </div>
  <div class="mt-2 mb-2 grid">
    <vs-input autocomplete="off" ref="new_password" type="password" data-vv-validate-on="blur" v-validate="'required|min:6'" name="new_password" label-placeholder="Password" placeholder="Password" v-model="form.new_password" class="w-full" />
    <span class="text-danger text-sm absolute">{{ errors.first('new_password') | remove_ }}</span>
  </div>
  <div class="mt-2 mb-2 grid">
    <vs-input autocomplete="off" type="password" v-validate="'min:6|confirmed:new_password'" data-vv-validate-on="blur" data-vv-as="new_password" name="new_password_confirmation" label-placeholder="Confirm Password" placeholder="Confirm Password" v-model="form.new_password_confirmation" class="w-full" />
    <span class="text-danger text-sm absolute">{{ errors.first('new_password_confirmation') | remove_ }}</span>
  </div>
  <form-error :form="form"></form-error>
  <vs-button class="float-right mt-6" @click="updatePassword">Send</vs-button>

</div>
</template>

<script>
import FormError from './FormError'
export default {
  props: ['id'],
  data() {
    return {
      form: new Form({
        change_password: true,
        current_password: '',
        new_password: '',
        new_password_confirmation: '',
      }),
      user: []
    }
  },
  components: {
    FormError
  },
  created() {
    this.user = JSON.parse(localStorage.getItem('user'));
  },
  methods: {
    updatePassword() {
      this.form.patch(`/api/users/${this.id}`)
        .then((response) => {
          this.$vs.notify({
            title: 'Success!',
            text: 'Process completed successfully!',
            color: 'success',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-left'
          })

          // if current user changed his password.
          if(user.id == this.id){
            localStorage.removeItem('token');
            localStorage.removeItem('user');
            window.location.href = '/pages/login';
          }
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
    }
  },
}
</script>

<style lang="">
  
</style>
