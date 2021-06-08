import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const router = new Router({
    mode: 'history',
    base: '/',
    scrollBehavior () {
        return { x: 0, y: 0 }
    },
    routes: [

        {
    // =============================================================================
    // MAIN LAYOUT ROUTES
    // =============================================================================
            path: '',
            component: () => import('./layouts/main/Main.vue'),
            children: [
              {
                path: '/',
                name: 'home',
                component: () => import('./views/Home.vue')
              },
              {
                path: '/user/register',
                name: 'register',
                component: () => import('@/views/pages/Register.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Users List', url: {name: 'user-list'} },
                    { title: 'Add Account', active: true }
                  ],
                  btn_list_path: '/list/users',
                }
              },
              {
                path: '/user/edit/:id',
                name: 'edit-user',
                component: () => import('@/views/pages/Register.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Users List', url: {name: 'user-list'} },
                    { title: 'Add Account', active: true }
                  ],
                  btn_list_path: '/list/users',
                }
              },
              {
                path: '/list/users',
                name: 'user-list',
                component: () => import('@/views/pages/UserList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Users List', active: true }
                  ],
                  btn_plus_path: '/user/register',
                }

              },

              // List Routes
              {
                path: '/apps/list/branch',
                name: 'list-branch',
                component: () => import('./views/apps/branch/BranchList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Branches List', active: true }
                  ],
                  btn_plus_path: '/apps/add/branch',
                }
              },
              {
                path: '/apps/list/account',
                name: 'list-account',
                component: () => import('./views/apps/account/AccountList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Accounts List', active: true }
                  ],
                  btn_plus_path: '/apps/add/account',
                }
              },
              {
                path: '/apps/list/customer',
                name: 'list-customer',
                component: () => import('./views/apps/customer/CustomerList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Customers List', active: true }
                  ],
                  btn_plus_path: '/apps/add/customer',
                }
              },
              {
                path: '/apps/list/vendor',
                name: 'list-vendor',
                component: () => import('./views/apps/vendor/VendorList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Vendors List', active: true }
                  ],
                  btn_plus_path: '/apps/add/vendor',
                }
              },
              {
                path: '/apps/list/stock',
                name: 'list-stock',
                component: () => import('./views/apps/stock/StockList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Stocks List', active: true }
                  ],
                  btn_plus_path: '/apps/add/stock',
                }
              },
              {
                path: '/apps/list/product',
                name: 'list-product',
                component: () => import('./views/apps/product/ProductList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Products List', active: true }
                  ],
                  btn_plus_path: '/apps/add/product',
                }
              },
              {
                path: '/apps/list/sale',
                name: 'list-sale',
                component: () => import('./views/apps/sale/SaleList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Sales List', active: true }
                  ],
                  btn_plus_path: '/apps/add/sale',
                }
              },
              {
                path: '/apps/list/purchase',
                name: 'list-purchase',
                component: () => import('./views/apps/purchase/PurchaseList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Purchases List', active: true }
                  ],
                  btn_plus_path: '/apps/add/purchase',
                }
              },
              {
                path: '/apps/list/payment',
                name: 'list-payment',
                component: () => import('./views/apps/payment/PaymentList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Payments List', active: true }
                  ],
                  btn_plus_path: '/apps/add/payment',
                }
              },
              {
                path: '/apps/list/fixpayment',
                name: 'list-fixpayment',
                component: () => import('./views/apps/fixpayment/FixPaymentList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Fix Payments List', active: true }
                  ],
                  btn_plus_path: '/apps/add/fixpayment',
                }
              },
              {
                path: '/apps/list/transfer',
                name: 'list-transfer',
                component: () => import('./views/apps/transfer/TransferList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Transfers List', active: true }
                  ],
                  btn_plus_path: '/apps/add/transfer',
                }
              },
              {
                path: '/apps/list/transaction',
                name: 'list-transaction',
                component: () => import('./views/apps/transaction/TransactionList.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Transactions List', active: true }
                  ],
                }
              },

              // End Of List Routes
              // Add Routes
              {
                path: '/apps/add/branch',
                name: 'add-branch',
                component: () => import('./views/apps/branch/BranchAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Branches List', url: {name: 'list-branch'} },
                    { title: 'Add Branch', active: true }
                  ],
                  btn_list_path: '/apps/list/branch',
                }
              },
              {
                path: '/apps/add/customer',
                name: 'add-customer',
                component: () => import('./views/apps/customer/CustomerAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Customers List', url: {name: 'list-customer'} },
                    { title: 'Add Customer', active: true }
                  ],
                  btn_list_path: '/apps/list/customer',
                }
              },
              {
                path: '/apps/add/vendor',
                name: 'add-vendor',
                component: () => import('./views/apps/vendor/VendorAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Vendors List', url: {name: 'list-vendor'} },
                    { title: 'Add Vendor', active: true }
                  ],
                  btn_list_path: '/apps/list/vendor',
                }
              },
              {
                path: '/apps/add/stock',
                name: 'add-stock',
                component: () => import('./views/apps/stock/StockAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Stocks List', url: {name: 'list-stock'} },
                    { title: 'Add Stock', active: true }
                  ],
                  btn_list_path: '/apps/list/stock',
                }
              },
              {
                path: '/apps/add/product',
                name: 'add-product',
                component: () => import('./views/apps/product/ProductAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Products List', url: {name: 'list-product'} },
                    { title: 'Add Product', active: true }
                  ],
                  btn_list_path: '/apps/list/product',
                }
              },
              {
                path: '/apps/add/sale',
                name: 'add-sale',
                component: () => import('./views/apps/sale/SaleAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Sales List', url: {name: 'list-sale'} },
                    { title: 'Add Sale', active: true }
                  ],
                  btn_list_path: '/apps/list/sale',
                }
              },
              {
                path: '/apps/add/account',
                name: 'add-account',
                component: () => import('./views/apps/account/AccountAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Accounts List', url: {name: 'list-account'} },
                    { title: 'Add Account', active: true }
                  ],
                  btn_list_path: '/apps/list/account',
                }
              },
              {
                path: '/apps/add/product',
                name: 'add-product',
                component: () => import('./views/apps/product/ProductAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Products List', url: {name: 'list-product'} },
                    { title: 'Add Product', active: true }
                  ],
                  btn_list_path: '/apps/list/product',
                }
              },
              {
                path: '/apps/add/purchase',
                name: 'add-purchase',
                component: () => import('./views/apps/purchase/PurchaseAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Purchases List', url: {name: 'list-purchase'} },
                    { title: 'Add Purchase', active: true }
                  ],
                  btn_list_path: '/apps/list/purchase',
                }
              },
              {
                path: '/apps/add/payment',
                name: 'add-payment',
                component: () => import('./views/apps/payment/PaymentAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Payments List', url: {name: 'list-payment'} },
                    { title: 'Add Payment', active: true }
                  ],
                  btn_list_path: '/apps/list/payment',
                }
              },       
              {
                path: '/apps/add/fixpayment',
                name: 'add-fixpayment',
                component: () => import('./views/apps/fixpayment/FixPaymentAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Fix Payments List', url: {name: 'list-fixpayment'} },
                    { title: 'Add Fix Payment', active: true }
                  ],
                  btn_list_path: '/apps/list/fixpayment',
                }
              },
              {
                path: '/apps/add/transfer',
                name: 'add-transfer',
                component: () => import('./views/apps/transfer/TransferAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Transfers List', url: {name: 'list-transfer'} },
                    { title: 'Add Transfer', active: true }
                  ],
                  btn_list_path: '/apps/list/transfer',
                }
              },
              // End of add routes
              // Edit Routes
              {
                path: '/apps/edit/product/:id',
                name: 'edit-product',
                component: () => import('./views/apps/product/ProductAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Products List', url: {name: 'list-product'} },
                    { title: 'Edit Product', active: true }
                  ],
                  btn_list_path: '/apps/list/product',
                }
              },
              {
                path: '/apps/edit/sale/:id',
                name: 'edit-sale',
                component: () => import('./views/apps/sale/SaleAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Sales List', url: {name: 'list-sale'} },
                    { title: 'Edit Sale', active: true }
                  ],
                  btn_list_path: '/apps/list/sale',
                }
              },
              {
                path: '/apps/edit/purchase/:id',
                name: 'edit-purchase',
                component: () => import('./views/apps/purchase/PurchaseAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Purchases List', url: {name: 'list-purchase'} },
                    { title: 'Edit Purchase', active: true }
                  ],
                  btn_list_path: '/apps/list/purchase',
                }
              },
              {
                path: '/apps/edit/payment/:id',
                name: 'edit-payment',
                component: () => import('./views/apps/payment/PaymentAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Payments List', url: {name: 'list-payment'} },
                    { title: 'Edit Payment', active: true }
                  ],
                  btn_list_path: '/apps/list/payment',
                }
              },
              {
                path: '/apps/edit/fixpayment/:id',
                name: 'edit-fixpayment',
                component: () => import('./views/apps/fixpayment/FixPaymentAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Fix Payments List', url: {name: 'list-fixpayment'} },
                    { title: 'Edit Fix Payment', active: true }
                  ],
                  btn_list_path: '/apps/list/fixpayment',
                }
              },
              {
                path: '/apps/edit/transfer/:id',
                name: 'edit-transfer',
                component: () => import('./views/apps/transfer/TransferAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Transfers List', url: {name: 'list-transfer'} },
                    { title: 'Edit Transfer', active: true }
                  ],
                  btn_list_path: '/apps/list/transfer',
                }
              },
              {
                path: '/apps/edit/branch/:id',
                name: 'edit-branch',
                component: () => import('./views/apps/branch/BranchAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Branches List', url: {name: 'list-branch'} },
                    { title: 'Edit Branch', active: true }
                  ],
                  btn_list_path: '/apps/list/branch',
                }
              },
              {
                path: '/apps/edit/customer/:id',
                name: 'edit-customer',
                component: () => import('./views/apps/customer/CustomerAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Customers List', url: {name: 'list-customer'} },
                    { title: 'Edit Customer', active: true }
                  ],
                  btn_list_path: '/apps/list/customer',
                }
              },
              {
                path: '/apps/edit/vendor/:id',
                name: 'edit-vendor',
                component: () => import('./views/apps/vendor/VendorAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Vendors List', url: {name: 'list-vendor'} },
                    { title: 'Edit Vendor', active: true }
                  ],
                  btn_list_path: '/apps/list/vendor',
                }
              },
              {
                path: '/apps/edit/stock/:id',
                name: 'edit-stock',
                component: () => import('./views/apps/stock/StockAdd.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Stocks List', url: {name: 'list-stock'} },
                    { title: 'Edit Stock', active: true }
                  ],
                  btn_list_path: '/apps/list/stock',
                }
              },
              // End Of Edit Routes
              {
                path: '/manage/category',
                name: 'manage-category',
                component: () => import('./views/apps/CategoryManagement.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Category Management', active: true },
                  ],
                  // btn_list_path: '/apps/list/category',
                }
              },
              {
                path: '/manage/activity-log',
                name: 'manage-activity-log',
                component: () => import('./views/apps/ActivityLog.vue'),
                meta: {
                  breadcrumb: [
                    { title: 'Home', url: '/' },
                    { title: 'Activity Log', active: true },
                  ],
                }
              },
              {
                path: '/pages/logout',
                name: 'page-logout',
              },

            ],
        },
        {
            path: '',
            component: () => import('@/layouts/full-page/FullPage.vue'),
            children: [
              {
                path: '/pages/login',
                name: 'page-login',
                component: () => import('@/views/pages/Login.vue')
              },
              {
                path: '/pages/signup',
                name: 'page-signup',
                component: () => import('@/views/pages/Register.vue')
              },
              {
                path: '/pages/error-404',
                name: 'page-error-404',
                component: () => import('@/views/pages/Error404.vue')
              },
              {
                path: '/pages/pending',
                name: 'page-pending',
                component: () => import('@/views/pages/pending.vue')
              },
            ]
        },
        {
            path: '*',
            redirect: '/pages/error-404'
        }
    ],
})

router.beforeEach((to, from, next) => {
  // if (to.meta.permission) {
  //     let user_permissions = localStorage.getItem("user_permissions");
  //     if (
  //         user_permissions && !to.meta.permission.every(v => user_permissions.includes(v))
  //     ) {
  //         router.push({ path: "/" });
  //     }
  // }
  if(to.name == "page-signup"){
    return next();
  }
  if (to.name !== "page-login") {
      if (!localStorage.getItem("token")) {
          router.push({ path: "/pages/login" });
      }
  }
  if(to.name == "page-logout"){
    swal.fire({
      title: 'Are you sure?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes',
      cancelButtonText: 'No'
    }).then((result) => {
      if (result.value) {
        localStorage.removeItem('token');
        window.location.href = '/pages/login';
      }else{
        router.push({ path: from.path });
      }
    }
    );
  }
  return next();
});


router.afterEach(() => {
  // Remove initial loading
  const appLoading = document.getElementById('loading-bg')
    if (appLoading) {
        appLoading.style.display = "none";
    }
})

export default router
