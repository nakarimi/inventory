<template>
<!-- NOTIFICATIONS -->
<vs-dropdown vs-custom-content vs-trigger-click class="cursor-pointer notif">
  <feather-icon icon="BellIcon" class="cursor-pointer" :badge="unreadNotifications.length" />

  <vs-dropdown-menu class="notification-dropdown dropdown-custom vx-navbar-dropdown">

    <div class="notification-top text-center p-1 bg-primary text-white">
      <h3 class="text-white">{{ unreadNotifications.length }} New</h3>
      <p>Notifications</p>
    </div>

    <component :is="scrollbarTag" ref="mainSidebarPs" class="scroll-area--nofications-dropdown p-0 mb-10" :settings="settings" :key="$vs.rtl">
      <ul class="bordered-items">
        <li v-for="ntf in unreadNotifications" :key="ntf.id" @click.stop="makeRead(ntf)" :class="`div-with-loading-${ntf.id}`" class="vs-con-loading__container flex justify-between px-4 py-4 notification cursor-pointer">
          <div class="flex items-start">
            <feather-icon :icon="ntf.icon" :svgClasses="[`text-${ntf.color}`, 'stroke-current mr-1 h-6 w-6']"></feather-icon>
            <div class="mx-2">
              <span class="font-medium block notification-action" :data="ntf.status = (ntf.status == 'read') ? 'primary' : ntf.status" :class="[`text-${ntf.color}`]">{{ ntf.action }}
                <small>(by: {{ ntf.first_name }} {{ ntf.last_name }})</small>
              </span>
              <small class="font-bold">{{ ntf.msg }}</small>
              <small class="font-bold text-danger">#{{ ntf.id }}</small>
            </div>
          </div>
          <div>
            <div class="mt-1 whitespace-no-wrap"><small>{{ elapsedTime(ntf.created_at) }}</small></div>
            <div class="mt-1 whitespace-no-wrap text-right" title="Make as read!">
              <feather-icon icon="CheckIcon" type="border" svgClasses="w-5 h-5 hover:text-danger text-success stroke-current" class="cursor-pointer " @click.stop="makeRead(ntf)" />
            </div>
          </div>
        </li>
      </ul>
    </component>

    <div class="
        checkout-footer
        fixed
        bottom-0
        rounded-b-lg
        text-primary
        w-full
        p-2
        font-semibold
        text-center
        border
        border-b-0
        border-l-0
        border-r-0
        border-solid
        d-theme-border-grey-light
        cursor-pointer">
      <router-link to="/manage/notifications">
        <span>View All Notifications</span>
      </router-link>
    </div>
  </vs-dropdown-menu>
</vs-dropdown>
</template>

<script>
import VuePerfectScrollbar from 'vue-perfect-scrollbar'

export default {
  components: {
    VuePerfectScrollbar
  },
  data() {
    return {
      unreadNotifications: [],
      settings: {
        maxScrollbarLength: 60,
        wheelSpeed: .60
      },
    }
  },
  computed: {
    scrollbarTag() {
      return this.$store.getters.scrollbarTag
    }
  },
  created() {
    setInterval(() => {
      this.loadNotifs();
    }, 2500);
  },
  methods: {
    loadNotifs() {
      this.axios.get('/api/unread_notifications').then((response) => {
        this.unreadNotifications = response.data
          this.$vs.loading.close()
      }).catch(() => {})
    },
    makeRead(data) {
      this.$vs.loading({
        background: 'rgb(255, 255, 255)',
        container: `.div-with-loading-${data.id}`,
      })
      this.axios.post('/api/make_read_notif', data).then((response) => {
        this.loadNotifs();
      }).catch(() => {})
    },
    elapsedTime(startTime) {
      const x = new Date(startTime)
      const now = new Date()
      let timeDiff = now - x
      timeDiff /= 1000

      const seconds = Math.round(timeDiff)
      timeDiff = Math.floor(timeDiff / 60)

      const minutes = Math.round(timeDiff % 60)
      timeDiff = Math.floor(timeDiff / 60)

      const hours = Math.round(timeDiff % 24)
      timeDiff = Math.floor(timeDiff / 24)

      const days = Math.round(timeDiff % 365)
      timeDiff = Math.floor(timeDiff / 365)

      const years = timeDiff

      if (years > 0) {
        return `${years + (years > 1 ? ' Years ' : ' Year ')}ago`
      } else if (days > 0) {
        return `${days + (days > 1 ? ' Days ' : ' Day ')}ago`
      } else if (hours > 0) {
        return `${hours + (hours > 1 ? ' Hrs ' : ' Hour ')}ago`
      } else if (minutes > 0) {
        return `${minutes + (minutes > 1 ? ' Mins ' : ' Min ')}ago`
      }

      return 'Just Now'
    },
  }
}
</script>
