<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="products" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Name</vs-th>
        <vs-th>Code</vs-th>
        <vs-th>Quantity</vs-th>
        <vs-th>Price</vs-th>
        <vs-th>Stock</vs-th>
        <vs-th>Category</vs-th>
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
              <p>{{ tr.quantity }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.price }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.stock.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.category.name }}</p>
            </vs-td>
            <vs-td>
              <span class="cursor-pointer hover:text-success" @click="$router.push(`/apps/edit/product/${tr.id}`).catch(() => {})">Edit</span>
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
      products: [],
    }
  },
  created() {
    this.loadStocks()
  },
  methods: {
    loadStocks() {
      this.axios.get('/api/products').then((response) => {
        this.products = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>