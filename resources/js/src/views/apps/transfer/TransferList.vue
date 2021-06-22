<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="transfers" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="amount">amount</vs-th>
        <vs-th sort-key="target_stock">Destination</vs-th>
        <vs-th sort-key="source_stock">Source</vs-th>
        <vs-th sort-key="status">Status</vs-th>
        <vs-th sort-key="created_at">Created At</vs-th>
        <vs-th sort-key="">-</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.amount }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.target_stock.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.source_stock.name }}</p>
            </vs-td>
            <vs-td>
              <vs-chip 
              :color="(tr.approval_status == '1') ? 'success' : 'danger'" 
              class="product-order-approval_status">{{ (tr.approval_status == '1') ? 'Approved' : 'Pending' }}</vs-chip>
            </vs-td>
            <vs-td>
              <p>{{ tr.created_at | formatDate }}</p>
            </vs-td>
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="transfers" entity="transfer" entity_plural="transfers" :id="tr.id" ></action-buttons>
            </vs-td>
          </vs-tr>
        </tbody>
      </template>
    </vs-table>
  </vx-card>
</div>
</template>

<script>
import ActionButtons from '../../share/ActionButtons.vue'
export default {
  components: { ActionButtons },
  data() {
    return {
      transfers: [],
    }
  },
  created() {
    this.loadAccounts()
  },
  methods: {
    loadAccounts() {
      this.axios.get('/api/transfers').then((response) => {
        this.transfers = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
