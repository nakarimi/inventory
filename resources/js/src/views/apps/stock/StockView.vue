<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col sm:w-1/1 md:w-1/1 lg:w-1/1 xl:w-1/1 sm:m-0 m-4">
    <vx-card>
      <div class="clearfix">
        <h1>Stock Details</h1>
        <vs-table ref="table" :data="stockdetail.products" search stripe pagination :max-items="10">
          <template slot="thead">
            <vs-th sort-key="">#</vs-th>
            <vs-th sort-key="name">Name</vs-th>
            <vs-th sort-key="price">Price</vs-th>
            <vs-th sort-key="quantity">Quantity</vs-th>
            <vs-th sort-key="brand">Brand </vs-th>
            <vs-th sort-key="code">Code </vs-th>
            <vs-th sort-key="sale_unit">Sale Unit </vs-th>
            <vs-th sort-key="supplier">Supplier </vs-th>
            <vs-th sort-key="supplier_price">Supplier Price </vs-th>
            <vs-th sort-key="tax">Tax </vs-th>
            <vs-th sort-key="type">Type </vs-th>
            <vs-th sort-key="unit">Unit </vs-th>
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
                  <p>{{ tr.price }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.quantity }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.brand }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.code }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.sale_unit }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.supplier }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.supplier_price }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.tax }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.type }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.unit }}</p>
                </vs-td>
              </vs-tr>
            </tbody>
          </template>
        </vs-table>

      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
import vSelect from "vue-select";

export default {
  data() {
    return {
      stockdetail: {},
    }
  },
  components: {
    "v-select": vSelect,
  },
  created() {
    if (this.$route.params.id) {
      this.loadStock(this.$route.params.id)
    }
  },
  methods: {
    loadStock(id) {
      this.axios.get(`/api/stocks/${id}`).then((response) => {
        this.stockdetail = response.data;
        console.log(this.stockdetail);
      }).catch(() => {})
    },
  }
}
</script>
