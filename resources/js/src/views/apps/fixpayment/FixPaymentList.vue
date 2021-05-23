<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="fixpayments" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Title</vs-th>
        <vs-th>Account</vs-th>
        <vs-th>Ammount</vs-th>
        <vs-th>Paid To</vs-th>
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
              <p>{{ tr.title }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.account_id.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.ammount }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.receiver }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.created_at | formatDate }}</p>
            </vs-td>
            <vs-td>
              <span class="cursor-pointer" @click="$router.push(`/apps/edit/fixpayment/${tr.id}`).catch(() => {})">
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
      fixpayments: [],
    }
  },
  created() {
    this.loadPayments()
  },
  methods: {
    loadPayments() {
      this.axios.get('/api/fixpayments').then((response) => {
        this.fixpayments = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
