<!-- =========================================================================================
    File Name: Main.vue
    Description: Main layout
    ========================================================================================== -->

<template>
<div class="layout--main" :class="[layoutTypeClass, navbarClasses, footerClasses, {'no-scroll': isAppPage}]">

  <v-nav-menu :navMenuItems="navMenuItems" title="INVMS" parent=".layout--main" />

  <div id="content-area" :class="[contentAreaClass, {'show-overlay': bodyOverlay}]">
    <div id="content-overlay" />
    <div class="content-wrapper">

      <div class="router-view">
        <div class="router-content2">

          <transition :name="routerTransition">

            <div v-if="$route.meta.breadcrumb || $route.meta.pageTitle" class="router-header flex flex-wrap items-center mb-6">
              <div class="content-area__heading" :class="{'pr-4 border-0 md:border-r border-solid border-grey-light' : $route.meta.breadcrumb}">
                <h2 class="mb-1">{{ routeTitle }}</h2>
              </div>

              <!-- BREADCRUMB -->
              <vx-breadcrumb class="ml-4 md:block hidden" v-if="$route.meta.breadcrumb" :route="$route" :isRTL="$vs.rtl" />
              <div class="ml-auto md:block hidden cursor-pointer">
                <vs-button v-if="$route.meta.btn_plus_path" radius icon="icon-plus" icon-pack="feather" :to="$route.meta.btn_plus_path" />
                <vs-button v-if="$route.meta.btn_list_path" radius icon="icon-list" icon-pack="feather" :to="$route.meta.btn_list_path" />
              </div>
            </div>
          </transition>

          <div class="content-area__content">
            <transition :name="routerTransition" mode="out-in">
              <router-view @changeRouteTitle="changeRouteTitle" @setAppClasses="(classesStr) => $emit('setAppClasses', classesStr)" />
            </transition>
          </div>
        </div>
      </div>
    </div>
    <the-footer />
  </div>
</div>
</template>

<script>
import navMenuItems from '@/layouts/components/vertical-nav-menu/navMenuItems.js'
import TheNavbarVertical from '@/layouts/components/navbar/TheNavbarVertical.vue'
import TheFooter from '@/layouts/components/TheFooter.vue'
import themeConfig from '@/../themeConfig.js'
import VNavMenu from '@/layouts/components/vertical-nav-menu/VerticalNavMenu.vue'

export default {
  components: {
    TheFooter,
    TheNavbarVertical,
    VNavMenu
  },
  data() {
    return {
      footerType: themeConfig.footerType || 'static',
      hideScrollToTop: themeConfig.hideScrollToTop,
      isNavbarDark: false,
      navbarColor: themeConfig.navbarColor || '#fff',
      navbarType: themeConfig.navbarType || 'floating',
      navMenuItems,
      routerTransition: themeConfig.routerTransition || 'none',
      routeTitle: this.$route.meta.pageTitle
    }
  },
  watch: {
    '$route'() {
      this.routeTitle = this.$route.meta.pageTitle
    },
    isThemeDark(val) {
      const color = this.navbarColor === '#fff' && val ? '#10163a' : '#fff'
      this.updateNavbarColor(color)
    },
    '$store.state.mainLayoutType'(val) {
      this.setNavMenuVisibility(val)
    }
  },
  computed: {
    bodyOverlay() {
      return this.$store.state.bodyOverlay
    },
    contentAreaClass() {
      if (this.mainLayoutType === 'vertical') {
        if (this.verticalNavMenuWidth === 'default') return 'content-area-reduced'
        else if (this.verticalNavMenuWidth === 'reduced') return 'content-area-lg'
        else return 'content-area-full'
      } else return 'content-area-full'
    },
    footerClasses() {
      return {
        'footer-hidden': this.footerType === 'hidden',
        'footer-sticky': this.footerType === 'sticky',
        'footer-static': this.footerType === 'static'
      }
    },
    isAppPage() {
      return this.$route.meta.no_scroll
    },
    isThemeDark() {
      return this.$store.state.theme === 'dark'
    },
    layoutTypeClass() {
      return `main-${this.mainLayoutType}`
    },
    mainLayoutType() {
      return this.$store.state.mainLayoutType
    },
    navbarClasses() {
      return {
        'navbar-hidden': this.navbarType === 'hidden',
        'navbar-sticky': this.navbarType === 'sticky',
        'navbar-static': this.navbarType === 'static',
        'navbar-floating': this.navbarType === 'floating'
      }
    },
    verticalNavMenuWidth() {
      return this.$store.state.verticalNavMenuWidth
    },
    windowWidth() {
      return this.$store.state.windowWidth
    }
  },
  methods: {
    changeRouteTitle(title) {
      this.routeTitle = title
    },
    updateNavbarColor(val) {
      this.navbarColor = val
      if (val === '#fff') this.isNavbarDark = false
      else this.isNavbarDark = true
    },
    setNavMenuVisibility(layoutType) {
      if ((layoutType === 'horizontal' && this.windowWidth >= 1200) || (layoutType === 'vertical' && this.windowWidth < 1200)) {
        this.$store.commit('TOGGLE_IS_VERTICAL_NAV_MENU_ACTIVE', false)
        this.$store.dispatch('updateVerticalNavMenuWidth', 'no-nav-menu')
      } else {
        this.$store.commit('TOGGLE_IS_VERTICAL_NAV_MENU_ACTIVE', true)
      }
    }
  },
  created() {
    const color = this.navbarColor === '#fff' && this.isThemeDark ? '#10163a' : this.navbarColor
    this.updateNavbarColor(color)
    this.setNavMenuVisibility(this.$store.state.mainLayoutType)
  }
}
</script>
