<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="accounts" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="name">Label</vs-th>
        <vs-th sort-key="">User</vs-th>
        <vs-th sort-key="">Branch</vs-th>
        <vs-th sort-key="status">Status</vs-th>
        <vs-th sort-key=""></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
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
            <vs-td v-if="tr">
              <action-buttons ref="ab" :parent_data.sync="accounts" entity="account" entity_plural="accounts" :id="tr.id" ></action-buttons>
            </vs-td>
          </vs-tr>
        </tbody>
      </template>
    </vs-table>
  </vx-card>
</div>
</template>

<script>
import ActionButtons from '../../share/ActionButtons'

export default {
  data() {
    return {
      accounts: [],
    }
  },
  components: {ActionButtons},
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
