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
              // End of add routes
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
        router.push({ path: "/pages/login" });
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
