import Vue from 'vue'
import App from './App.vue'
import acl from './acl/acl'

// Vuesax Component Framework
import Vuesax from 'vuesax'

Vue.use(Vuesax)

import { Datetime } from 'vue-datetime'
// You need a specific loader for CSS files
import 'vue-datetime/dist/vue-datetime.css' 
Vue.use(Datetime)


// vForm start
import { Form, HasError, AlertError } from 'vform'
window.Form = Form
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)
    // vForm ended

// configuration of vue-axios
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)

import moment from 'moment'
Vue.prototype.moment = moment

// start sweetalert
import Swal from 'sweetalert2'
window.swal = Swal

// Theme Configurations
import '../themeConfig.js'

// Globally Registered Components
import './globalComponents.js'

// Vue Router
import router from './router'

// Vuex Store
import store from './store/store'

// Vuexy Admin Filters
import './filters/filters'

// VeeValidate
import VeeValidate from 'vee-validate'
Vue.use(VeeValidate)

// Vuejs - Vue wrapper for hammerjs
import { VueHammer } from 'vue2-hammer'
Vue.use(VueHammer)

// Feather font icon
require('@assets/css/iconfont.css')

import VuePerfectScrollbar from 'vue-perfect-scrollbar'
Vue.component('VuePerfectScrollbar', VuePerfectScrollbar)

// define a mixin object
const Mixin = {
        methods: {
        }
    }
const MyPlugin = {
    install(Vue, options) {
        Vue.prototype.startProcesAndLoad = () => {}
    }
}
Vue.use(MyPlugin)

// End Of Custom Methods

new Vue({
    mixins: [Mixin],
    el: '#app'
})

// Custom filters.
Vue.filter('formatDate', function(value) {
  if (value) {
    return moment(String(value)).format('YYYY-MM-DD')
  }
})
Vue.filter('formatDateTime', function(value) {
  if (value) {
    return moment(String(value)).format('YYYY-MM-DD H:m:s')
  }
})
Vue.filter('remove_', function(value) {
  if (value) {
    return value.replaceAll("_", " ")
  }
})

// Vue select css
// Note: In latest version you have to add it separately
// import 'vue-select/dist/vue-select.css';

Vue.config.productionTip = false

new Vue({
    router,
    store,
    acl,
    render: h => h(App)
}).$mount('#app')