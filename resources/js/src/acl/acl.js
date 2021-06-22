import Vue from 'vue'
import { AclInstaller, AclCreate, AclRule } from 'vue-acl'
import router from '@/router'

Vue.use(AclInstaller)

let initialRole = 'customer'

const userInfo = JSON.parse(localStorage.getItem('user'))
if (userInfo && userInfo.roles[0]) initialRole = userInfo.roles[0].name

export default new AclCreate({
  initial: initialRole,
  // notfound: {
  //   path: (localStorage.getItem('user')) ? '/pages/not-authorized' : '/',
  // },
  router,
  acceptLocalRules: true,
  globalRules: {
    isAdmin: new AclRule('admin').generate(),
    isAccounter: new AclRule('accounter').or('admin').generate(),
    onlyAccounter: new AclRule('accounter').generate(),
    isCustomer: new AclRule('customer').or('accounter').or('admin').generate(),
    onlyCustomer: new AclRule('customer').generate(),
  }
})
