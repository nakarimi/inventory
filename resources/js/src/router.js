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
                path: '/register',
                name: 'register',
                component: () => import('@/views/pages/Register.vue')
              },
              {
                path: '/page3',
                name: 'page-3',
                component: () => import('./views/Page2.vue')
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
