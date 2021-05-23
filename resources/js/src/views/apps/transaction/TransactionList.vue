<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="transactions" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Type</vs-th>
        <vs-th>Account</vs-th>
        <vs-th>Credit</vs-th>
        <vs-th>Debit</vs-th>
        <vs-th>Status</vs-th>
        <vs-th>Created At</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p @click.stop="viewData(tr)" class="cursor-pointer">{{i + 1 }}</p>
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
