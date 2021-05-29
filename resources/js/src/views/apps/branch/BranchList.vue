<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="branches" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Name</vs-th>
        <vs-th>Code</vs-th>
        <vs-th>Address</vs-th>
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
              <p>{{ tr.address }}</p>
            </vs-td>
            <vs-td>
              <span class="cursor-pointer hover:text-success" @click="$router.push(`/apps/edit/branch/${tr.id}`).catch(() => {})">
                <feather-icon icon="EditIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
              <span class="cursor-pointer hover:text-danger" @click="deleteEntity(tr.id)">
                <feather-icon icon="TrashIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
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
      branches: [],
    }
  },
  created() {
    this.loadBranches()
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
          this.axios.delete(`/api/branches/${id}`)
            .then((id) => {
              swal.fire({
                title: 'Completed!',
                text: "Sale removed from system successfully!",
                icon: 'success',
              })

              // Reload the data to show valid information to the table.
              this.loadBranches();
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
    loadBranches() {
      this.axios.get('/api/branches').then((response) => {
        console.log(response.data);
        this.branches = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
