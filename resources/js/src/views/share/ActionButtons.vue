<template lang="">
<div>
  <vs-td>
    <span class="cursor-pointer hover:text-success" @click="$router.push(`/apps/edit/${entity}/${id}`).catch(() => {})">
      <feather-icon icon="EditIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
    </span>
    <span class="cursor-pointer hover:text-success" @click="$router.push(`/apps/view/${entity}/${id}`).catch(() => {})">
      <feather-icon icon="ArchiveIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
    </span>

    <span class="cursor-pointer hover:text-danger" @click="deleteEntity(id)">
      <feather-icon icon="TrashIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
    </span>
  </vs-td>
</div>
</template>

<script>
export default {
  props: [
    'entity',
    'entity_plural',
    'id',
  ],
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
          this.axios.delete(`/api/${this.entity_plural}/${id}`)
            .then((id) => {
              swal.fire({
                title: 'Completed!',
                text: "Selected entity removed from system successfully!",
                icon: 'success',
              })
              // Reload the data to show valid information to the table.
              this.loadEntities();
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
    loadEntities() {
      this.axios.get(`/api/${this.entity_plural}`).then((response) => {
        this.$emit('update:parent_data', response.data);
      }).catch(() => {})
    }
  },
}
</script>

<style lang="">
  
</style>
