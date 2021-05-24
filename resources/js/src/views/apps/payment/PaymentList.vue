<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="payments" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Reference Code</vs-th>
        <vs-th>Account</vs-th>
        <vs-th>Ammount</vs-th>
        <vs-th>Source</vs-th>
        <vs-th>Date</vs-th>
        <vs-th></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p @click.stop="viewData(tr)" class="cursor-pointer">{{i + 1 }}</p>
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
            <vs-td>
              <span class="cursor-pointer" @click="$router.push(`/apps/edit/payment/${tr.id}`).catch(() => {})">
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
