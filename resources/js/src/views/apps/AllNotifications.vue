<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="notifications" search sntfipe pagination :max-items="50">
      <template slot="thead">
        <vs-th sort-key="id">Id</vs-th>
        <vs-th sort-key="action">Action</vs-th>
        <vs-th sort-key="user_id">Causer</vs-th>
        <vs-th sort-key="msg">Message</vs-th>
        <vs-th sort-key="type">Type</vs-th>
        <vs-th sort-key="status">Status</vs-th>
        <vs-th sort-key="created_at">Created At</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="ntf" :key="i" v-for="(ntf, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ ntf.id }}</p>
            </vs-td>
            <vs-td>
              <vs-chip :color="ntf.color">{{ ntf.action }}</vs-chip>
            </vs-td>
            <vs-td>
              <p>{{ ntf.first_name }} {{ ntf.last_name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ ntf.msg }}</p>
            </vs-td>
            <vs-td>
              <p>{{ ntf.type }}</p>
            </vs-td>
            <vs-td>
              <p>{{ ntf.status }}</p>
            </vs-td>
            <vs-td>
              <p>{{ elapsedTime(ntf.created_at) }}</p>
            </vs-td>
          </vs-tr>
        </tbody>
      </template>
    </vs-table>
  </vx-card>
</div>
</template>

<script>
export default {
  data() {
    return {
      notifications: [],
    }
  },
  created() {
    this.loadNotifs();
    
    
    setInterval(() => {
      this.loadNotifs();
    }, 2500);
  },
  methods: {
    loadNotifs() {
      this.axios.get('/api/read_notifications').then((response) => {
        this.notifications = response.data
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
