<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="fixpayments" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="title">Title</vs-th>
        <vs-th sort-key="account_id">Account</vs-th>
        <vs-th sort-key="ammount">Ammount</vs-th>
        <vs-th sort-key="receiver">Paid To</vs-th>
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
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="fixpayments" entity="fixpayment" entity_plural="fixpayments" :id="tr.id" ></action-buttons>
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
      fixpayments: [],
    }
  },
  created() {
    this.loadPayments()
  },
  methods: {
    // Delete the item from system, asking confirmation and show message in response.
    deleteEntity(id) {
      swal.fire({
        title: 'Are you sure ???',
        text: "If you continue this item will not exist anymore !!!",
        icon: 'question',
        showCancelButton: true,
      }).then((result) => {
        if (result.isConfirmed) {
          this.axios.delete(`/api/fixpayments/${id}`)
            .then((id) => {
              swal.fire({
                title: 'Completed!',
                text: "Payment removed from system successfully!",
                icon: 'success',
              })

              // Reload the data to show valid information to the table.
              this.loadPayments();
            })
            .catch(() => {
              swal.fire(
                'Failed!',
                'Operation rejected, please check the system!',
                'error'
              )
            });
        }
      })
    },
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
