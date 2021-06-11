<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="payments" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="reference_no">Reference Code</vs-th>
        <vs-th sort-key="account_id">Account</vs-th>
        <vs-th sort-key="amount">Ammount</vs-th>
        <vs-th sort-key="">Source</vs-th>
        <vs-th sort-key="created_at">Date</vs-th>
        <vs-th sort-key=""></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.reference_no }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.account_id.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.amount }}</p>
            </vs-td>
            <vs-td>
              <p>{{ (tr.sale_id) ? 'Sale: ' + tr.sale_id.reference_no : 'Purchase: ' + tr.purchase_id.reference_no }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.created_at | formatDate }}</p>
            </vs-td>
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="payments" entity="payment" entity_plural="payments" :id="tr.id" ></action-buttons>
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
      payments: [],
    }
  },
  created() {
    this.loadPayments()
  },
  methods: {
    loadPayments() {
      this.axios.get('/api/payments').then((response) => {
        this.payments = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
