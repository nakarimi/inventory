/*=========================================================================================
  File Name: router.js
  Description: Routes for vue-router. Lazy loading is enabled.

==========================================================================================*/


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
