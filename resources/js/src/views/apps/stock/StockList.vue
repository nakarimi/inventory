<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="stocks" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Name</vs-th>
        <vs-th>Code</vs-th>
        <vs-th>Phone</vs-th>
        <vs-th>Address</vs-th>
        <vs-th>Manager</vs-th>
        <vs-th></vs-th>
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
