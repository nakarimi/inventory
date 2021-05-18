import Vue from 'vue'
import App from './App.vue'

// Vuesax Component Framework
import Vuesax from 'vuesax'
import print from 'print-js'

Vue.use(Vuesax)

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
moment.locale('fa');
Vue.prototype.moment = moment

var momentj = require('moment-jalaali')
momentj().format('jYYYY/jM/jD')
Vue.prototype.momentj = momentj

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

// VueProgressBar
import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
    color: '#432e81',
    // backgound: "linear-gradient(calc(360deg - 175deg), rgba(86, 45, 183, 0.5) 6%, rgba(245, 82, 82, 0.8) 130%) !important",
    failedColor: 'red',
    thickness: '4px',
    transition: {
        speed: '0.2s',
        opacity: '0.6s',
        termination: 300
    },
    autoRevert: true,
    // location: "left",
    inverse: true,
    autoFinish: true
})

// Persian DatePcicker
import VuePersianDatetimePicker from 'vue-persian-datetime-picker'
Vue.component('date-picker', VuePersianDatetimePicker)

import VuePerfectScrollbar from 'vue-perfect-scrollbar'
Vue.component('VuePerfectScrollbar', VuePerfectScrollbar)

// define a mixin object
const Mixin = {
        methods: {
            Alerta() {
                alert('WORK!')
            }
        }
    }
    //ahmadi
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

// Vue select css
// Note: In latest version you have to add it separately
// import 'vue-select/dist/vue-select.css';

Vue.config.productionTip = false

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')