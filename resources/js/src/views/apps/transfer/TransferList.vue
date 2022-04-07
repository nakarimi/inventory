<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="transfers" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="amount">Amount</vs-th>
        <vs-th sort-key="target_stock">Destination</vs-th>
        <vs-th sort-key="source_stock">Source</vs-th>
        <vs-th sort-key="status">Status</vs-th>
        <vs-th sort-key="created_at">Created At</vs-th>
        <vs-th sort-key="">-</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.amount }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.target_stock.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.source_stock.name }}</p>
            </vs-td>
            <vs-td>
              <vs-chip
              :color="(tr.approval_status == 'Approved') ? 'success' : 'danger'" 
              class="product-order-approval_status"><span @click="toggleModel(tr)">{{ (tr.approval_status == null) ? 'Pending' : tr.approval_status }}</span></vs-chip>
            </vs-td>
            <vs-td>
              <p>{{ tr.created_at | formatDate }}</p>
            </vs-td>
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="transfers" entity="transfer" entity_plural="transfers" :id="tr.id" ></action-buttons>
            </vs-td>
          </vs-tr>
        </tbody>
      </template>
    </vs-table>
  </vx-card>
    <vs-popup title="" :active.sync="popupOpen">
    <div>
    <h3 color="warning">Do you want to change the transfer status?</h3>
        <vs-button color="success" class="float-right m-3" @click="updateStatusEntity(popupData.id, 'Approved')">Approve it!</vs-button>
        <vs-button color="danger" class="float-right m-3" @click="updateStatusEntity(popupData.id, 'Rejected')">Reject transfer!</vs-button>
    </div>
  </vs-popup>

</div>
</template>

<script>
import ActionButtons from '../../share/ActionButtons.vue'
export default {
  components: { ActionButtons },
  data() {
    return {
      transfers: [],
      popupOpen: false,
      popupData: [],

    }
  },
  created() {
    this.loadAccounts()
  },
  methods: {
      updateStatusEntity(id, status) {
      this.popupOpen = !this.popupOpen;

      swal.fire({
        title: 'Are you sure ???',
        icon: 'question',
        showCancelButton: true,
      }).then((result) => {
        if (result.isConfirmed) {
          this.axios.post('/api/approve/transfer/' + id, {
            status: status
          }).then((response) => {
            swal.fire({
              title: 'Completed!',
              text: "Transfer status updated successfully!",
              icon: 'success',
            })
            this.loadAccounts()
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
    toggleModel(data = []) {
      // this.getAllNotification();
      this.popupData = data;
      this.popupOpen = !this.popupOpen;
    },
    loadAccounts() {
      this.axios.get('/api/transfers').then((response) => {
        this.transfers = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
