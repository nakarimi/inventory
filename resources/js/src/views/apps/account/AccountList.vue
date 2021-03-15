<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="accounts" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Label</vs-th>
        <vs-th>User</vs-th>
        <vs-th>Branch</vs-th>
        <vs-th>Status</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p @click.stop="viewData(tr)" class="cursor-pointer">{{i + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.user_account.first_name + ' ' + tr.user_account.last_name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.user_account.branch.name }} ({{ tr.user_account.branch.code }})</p>
            </vs-td>
            <vs-td>
              <vs-chip 
              :color="(tr.status == '1') ? 'success' : 'danger'" 
              class="product-order-status">{{ (tr.status == '1') ? 'Active' : 'Inactive' }}</vs-chip>
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
      accounts: [],
    }
  },
  created() {
    this.loadAccounts()
  },
  methods: {
    loadAccounts() {
      this.axios.get('/api/accounts').then((response) => {
        this.accounts = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
