<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="sales" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="date">Date</vs-th>
        <vs-th sort-key="reference_no">Reference Code</vs-th>
        <vs-th sort-key="customer">Customer</vs-th>
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
              <p>{{ tr.customer.name }}</p>
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
              <span class="cursor-pointer hover:text-success" @click="$router.push(`/apps/edit/sale/${tr.id}`).catch(() => {})">
                <feather-icon icon="EditIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
              <span class="cursor-pointer hover:text-danger" @click="deleteEntity(tr.id)">
                <feather-icon icon="TrashIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
              <a class="cursor-pointer my-text-black hover:text-danger" target="_blank" :href="`/print?type=sale&id=${tr.id}`">
                <feather-icon icon="PrinterIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </a>
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
      sales: [],
    }
  },
  created() {
    this.loadSales()
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
          this.axios.delete(`/api/sales/${id}`)
            .then((id) => {
              swal.fire({
                title: 'Completed!',
                text: "Sale removed from system successfully!",
                icon: 'success',
              })

              // Reload the data to show valid information to the table.
              this.loadSales();
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

    loadSales() {
      this.axios.get('/api/sales').then((response) => {
        this.sales = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
