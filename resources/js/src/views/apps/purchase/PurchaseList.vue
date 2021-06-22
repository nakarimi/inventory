<template lang="">
<div>
  <items />
  <vx-card>
    <vs-table ref="table" :data="purchases" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="date">Date</vs-th>
        <vs-th sort-key="reference_no">Reference Code</vs-th>
        <vs-th sort-key="vendor">Customer</vs-th>
        <vs-th sort-key="total">Total</vs-th>
        <vs-th sort-key="stock">Stock</vs-th>
        <vs-th sort-key="due_date">Due Date</vs-th>
        <vs-th sort-key=""></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.date | formatDate }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.reference_no }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.vendor.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.total }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.stock.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.due_date | formatDate }}</p>
            </vs-td>
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="purchases" entity="purchase" entity_plural="purchases" :id="tr.id" ></action-buttons>
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
      purchases: [],
    }
  },
  created() {
    this.loadPurchases()
  },
  methods: {
    loadPurchases() {
      this.axios.get('/api/purchases').then((response) => {
        this.purchases = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
