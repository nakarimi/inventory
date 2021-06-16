<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="orders" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="date">Date</vs-th>
        <vs-th sort-key="due_date">Title</vs-th>
        <vs-th sort-key="">Number of Items</vs-th>
        <vs-th sort-key="">Actions</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.created_at | formatDate }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.title }}</p>
            </vs-td>
            <vs-td>
              <p>{{ JSON.parse(tr.items).length }}</p>
            </vs-td>
            <vs-td>
              <span class="cursor-pointer hover:text-danger" @click="deleteEntity(tr.id)">
                <feather-icon icon="TrashIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
              <span v-if="$acl.check('isAccounter') && !tr.updated_at" class="cursor-pointer hover:text-danger" @click="$router.push(`/apps/add/sale?order=${tr.id}`).catch(() => {})">
                <feather-icon icon="PlusIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
                Create sale for this
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
      orders: [],
    }
  },
  created() {
    this.loadOrders()
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
          this.axios.get(`/api/remove/orders/${id}`)
            .then((id) => {
              swal.fire({
                title: 'Completed!',
                text: "Order removed from system successfully!",
                icon: 'success',
              })

              // Reload the data to show valid information to the table.
              this.loadOrders();
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
    loadOrders() {
      this.axios.get('/api/list/orders').then((response) => {
        console.log(response.data);
        this.orders = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
