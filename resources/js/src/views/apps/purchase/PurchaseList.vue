<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="purchases" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Date</vs-th>
        <vs-th>Reference Code</vs-th>
        <vs-th>Customer</vs-th>
        <vs-th>Total</vs-th>
        <vs-th>Stock</vs-th>
        <vs-th>Due Date</vs-th>
        <vs-th></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p @click.stop="viewData(tr)" class="cursor-pointer">{{i + 1 }}</p>
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
            <vs-td>
              <span class="cursor-pointer" @click="$router.push(`/apps/edit/purchase/${tr.id}`).catch(() => {})">
                <feather-icon icon="EditIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
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
