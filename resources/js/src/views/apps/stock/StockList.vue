<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="stocks" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="name">Name</vs-th>
        <vs-th sort-key="code">Code</vs-th>
        <vs-th sort-key="phone">Phone</vs-th>
        <vs-th sort-key="address">Address</vs-th>
        <vs-th sort-key="manager">Manager</vs-th>
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
              <p>{{ tr.code }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.phone }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.address }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.manager }}</p>
            </vs-td>
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="stocks" entity="stock" entity_plural="stocks" :id="tr.id" ></action-buttons>
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
      stocks: [],
    }
  },
  components: {ActionButtons},
  created() {
    this.loadStocks()
  },
  methods: {
    loadStocks() {
      this.axios.get('/api/stocks').then((response) => {
        this.stocks = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
