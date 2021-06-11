<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="transactions" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="type">Type</vs-th>
        <vs-th sort-key="account_id">Account</vs-th>
        <vs-th sort-key="credit">Credit</vs-th>
        <vs-th sort-key="debit">Debit</vs-th>
        <vs-th sort-key="status">Status</vs-th>
        <vs-th sort-key="created_at">Created At</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p class="text-capitalize">{{ tr.type }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.account_id.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.credit }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.debit }}</p>
            </vs-td>
            <vs-td>
              <vs-chip 
              :color="(tr.status == 'rejected') ? 'danger' : 'warning'" 
              class="product-order-status">{{ (tr.status == 'rejected') ? 'Rejected' : tr.status }}</vs-chip>
            </vs-td>
            <vs-td>
              <p>{{ tr.created_at | formatDateTime }}</p>
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
      transactions: [],
    }
  },
  created() {
    this.loadAccounts()
  },
  methods: {
    loadAccounts() {
      this.axios.get('/api/transactions').then((response) => {
        this.transactions = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
