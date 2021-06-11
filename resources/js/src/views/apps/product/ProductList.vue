<template lang="">
<div>
  <vx-card>

    

    <vs-table ref="table" :data="products" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th vs-th:sort="true">#</vs-th>
        <vs-th sort-key="">Photo</vs-th>
        <vs-th sort-key="name">Name</vs-th>
        <vs-th sort-key="code">Code</vs-th>
        <vs-th sort-key="quantity">Quantity</vs-th>
        <vs-th sort-key="price">Price</vs-th>
        <vs-th sort-key="stock">Stock</vs-th>
        <vs-th sort-key="category">Category</vs-th>
        <vs-th sort-key=""></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>
                <vs-avatar class="rectangle" size="80px" :src="`/img/product/${(tr.image) ? tr.image : 'default.jpg'}`" />
              </p>
            </vs-td>

            <vs-td>
              <p>{{ tr.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.code }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.quantity }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.price }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.stock.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.category.name }}</p>
            </vs-td>
            <vs-td>
              <span class="cursor-pointer hover:text-success" @click="$router.push(`/apps/edit/product/${tr.id}`).catch(() => {})">
                <feather-icon icon="EditIcon" svgClasses="w-5 h-5 hover:text-success stroke-current" class="cursor-pointer" />
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
      products: [],
    }
  },
  created() {
    this.loadProducts()
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
          this.axios.delete(`/api/products/${id}`)
            .then((id) => {
              swal.fire({
                title: 'Completed!',
                text: "Product removed from system successfully!",
                icon: 'success',
              })
              // Reload the data to show valid information to the table.
              this.loadProducts();
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

    // Load all products to be listed on the table.
    loadProducts() {
      this.axios.get('/api/products').then((response) => {
        this.products = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
