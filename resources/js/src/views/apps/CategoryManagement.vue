<template lang="">
<div>
  <vx-card>
    <h1>Categories</h1>
    <div class="vx-row">
      <div class="sm:w-full md:w-1/2 lg:w-1/2 xl:w-1/2 p-4">
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required|min:3'" name="name" label="Name" v-model="form.name" @input="form.errors.errors.name = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="name"></has-error>
        </div>
        <div class="mt-2 mb-2 grid">
          <vs-input v-validate="'required|min:3'" name="slug" label="Slug" v-model="form.slug" @input="form.errors.errors.slug = []" class="w-full" />
          <has-error class="text-danger text-sm" :form="form" field="slug"></has-error>
        </div>
        <vs-button class="float-right m-3" v-if="!this.form.id" @click="addNewCategory" :disabled="form.busy">Add New</vs-button>
        <vs-button class="float-right m-3" v-if="this.form.id" @click="submitEditCategory" :disabled="form.busy">Update</vs-button>
        <vs-button color="warning" class="float-right m-3" @click="form.reset()">Cancel</vs-button>
      </div>
      <div class="sm:w-full md:w-1/2 lg:w-1/2 xl:w-1/2 p-4">
        <vs-table ref="table" :data="categories" stripe>
          <template slot="thead">
            <vs-th sort-key="">#</vs-th>
            <vs-th sort-key="name">Name</vs-th>
            <vs-th sort-key="slug">Slug</vs-th>
            <vs-th sort-key=""></vs-th>
          </template>
          <template slot-scope="{data}">
            <tbody>
              <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
                <vs-td>
                  <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.name }}</p>
                </vs-td>
                <vs-td>
                  <p>{{ tr.slug }}</p>
                </vs-td>
                <vs-td>
                  <feather-icon icon="EditIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" @click.stop="editCategory(tr)" />
                  <feather-icon icon="TrashIcon" svgClasses="w-5 h-5 text-danger stroke-current" class="cursor-pointer" @click.stop="removeCategory(tr)" />
                </vs-td>
              </vs-tr>
            </tbody>
          </template>
        </vs-table>
      </div>
    </div>
  </vx-card>
</div>
</template>

<script>
export default {
  data() {
    return {
      modalActive: false,
      categories: [],
      form: new Form({
        id: null,
        name: '',
        slug: '',
      })
    }
  },
  computed: {
    validateForm() {
      return this.form.name !== '' && this.form.slug !== ''
    }
  },
  created() {
    this.loadCategories()
  },
  methods: {
    loadCategories() {
      this.axios.get('/api/categories').then((response) => {
        this.categories = response.data
      }).catch(() => {})
    },
    addNewCategory() {
      this.form.post('/api/categories')
        .then((response) => {
          this.form.reset()
          this.loadCategories()
          this.$vs.notify({
            title: 'Success!',
            text: 'Process completed successfully!',
            color: 'success',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-left'
          })
        }).catch((error) => {
          this.$vs.notify({
            title: 'Failed!',
            text: 'There is some failure, please try again!',
            color: 'danger',
            iconPack: 'feather',
            icon: 'icon-cross',
            position: 'top-left'
          })
        })

    },
    editCategory(data) {
      this.form.reset()
      this.form.fill(data);
    },
    submitEditCategory() {
      this.form.patch('/api/categories/' + this.form.id)
        .then((response) => {
          this.loadCategories()
          this.form.reset()
          this.$validator.reset()
          this.$vs.notify({
            title: 'Success!',
            text: 'Process completed successfully!',
            color: 'success',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-left'
          })
        }).catch((error) => {
          this.$vs.notify({
            title: 'Failed!',
            text: 'There is some failure, please try again!',
            color: 'danger',
            iconPack: 'feather',
            icon: 'icon-cross',
            position: 'top-left'
          })
        })

    },
    removeCategory(data) {
      swal.fire({
        title: 'Confirmation',
        text: 'Are you sure you want to remove?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: 'rgb(54 34 119)',
        cancelButtonColor: 'rgb(229 83 85)',
        confirmButtonText: '<span>Yes</span>',
      }).then((result) => {
        if (result.isConfirmed) {
          this.axios.delete('/api/categories/' + data.id).then((response) => {
              swal.fire({
                title: 'Success!',
                text: 'Process completed successfully!',
                icon: 'success',
              })
              this.loadCategories()
            })
            .catch(() => {
              swal.fire({
                title: 'Failed!',
                text: 'There is some failure, please try again!',
                icon: 'warning',
              })

            });
        }
      })
    }
  }
}
</script>

<style lang="">

</style>
