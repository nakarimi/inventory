<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="users" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Email</vs-th>
        <vs-th>Name</vs-th>
        <vs-th>Branch</vs-th>
        <vs-th>Phone</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p @click.stop="viewData(tr)" class="cursor-pointer">{{i + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.email }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.first_name + ' ' + tr.last_name }}</p>
            </vs-td>
            <vs-td>
              <p v-if="tr.branch">{{ tr.branch.name }} ({{ tr.branch.code }})</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.phone }}</p>
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
      users: [],
    }
  },
  created() {
    this.loadUsers()
  },
  methods: {
    loadUsers() {
      this.axios.get('/api/users').then((response) => {
        this.users = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
