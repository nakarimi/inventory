<template>
<div>
  <vs-divider class="pt-3 px-3 pb-0"> Products </vs-divider>
  <form data-vv-scope="step-3">
    <div v-for="(i, index) in form.items" :key="i.id">
      <vs-row vs-w="12" class="pb-2 mb-2">
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <label for=""><small>Category</small></label>
          <v-select label="name" v-model="i.category_id" :clearable="false" @input="categorySelected($event, index)" :options="categories" />
          <span class="text-danger text-sm">{{ errors.first('item_id') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <label for=""><small>Product</small></label>
          <v-select label="name" :clearable="false" name="item_id" v-validate="'required'" v-model="i.item_id" :options="products" />
          <span class="text-danger text-sm">{{ errors.first('item_id') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <label for=""><small>Unit</small></label>
          <v-select label="name" :clearable="false" name="unit_id" v-validate="'required'" v-model="i.unit_id" :options="units" />
          <span class="text-danger text-sm">{{ errors.first('unit_id') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="ammount" label="Ammount" v-model="i.ammount" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('ammount') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="unit_price" label="Unit Price" v-model="i.unit_price" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('unit_price') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <vs-input v-validate="'required'" data-vv-validate-on="blur" name="total_price" label="Total Price" :value="i.total_price" :data="items_total" class="w-full" />
          <span class="text-danger text-sm">{{ errors.first('total_price') }}</span>
        </vs-col>
      </vs-row>
    </div>
  </form>
  <vs-row vs-w="12">
    <vs-col vs-type="flex" vs-justify="right" vs-align="right" vs-lg="4" vs-sm="4" vs-xs="12" class="pt-2 mb-2 ml-3 mr-3">
      <vs-button type="border" @click.stop="addRow" color="success" icon="add"></vs-button>
      <vs-button type="border" id="delete-btn" @click.stop="removeRow" :disabled="form.items.length <= 1" color="danger" class="mx-2" icon="delete"></vs-button>
    </vs-col>
  </vs-row>
</div>
</template>

<script>
import vSelect from "vue-select";
import {
  Validator
} from "vee-validate";

export default {
  props: ['form'],
  data() {
    return {
      units: [{
          id: 1,
          name: 'KG'
        },
        {
          id: 2,
          name: 'Gram'
        },
        {
          id: 3,
          name: 'Liter'
        },
        {
          id: 4,
          name: 'Pack'
        }
      ],
      products: [],
      categories: [],
    };
  },
  created() {
    this.getAllProducts();
    this.getCategories();

  },
  computed: {
    items_total() {
      let main_price = 0;
      for (const key of Object.keys(this.form.items)) {
        if (this.form.items[key].id) {
          this.form.items[key].unit_id = this.units.find(e => e.id == this.form.items[key].unit_id || e.id == this.form.items[key].unit_id.id);
        }
        this.form.items[key].total_price = (this.form.items[key].unit_price * this.form.items[key].ammount);
        main_price += this.form.items[key].total_price;
      }
      this.form.total = main_price;
    }
  },
  methods: {
    categorySelected($event, index) {
      console.log(index);
    },
    addRow() {
      this.form.items.push({
        category_id: "",
        item_id: "",
        unit_id: "",
        ammount: "0",
        unit_price: "0",
        total_price: "0",
      });
    },
    getAllProducts() {
      this.axios.get("/api/products").then((response) => {
        this.products = response.data;
      });
    },
    getCategories() {
      this.axios.get('/api/categories').then((response) => {
        this.categories = response.data
      }).catch(() => {})
    },

    removeRow() {
      swal.fire({
        title: "Are you sure ?",
        icon: "question",
        showCancelButton: true,
        confirmButtonColor: "#362277",
        cancelButtonColor: "#e85454",
      }).then((result) => {
        if (result.value) {
          this.form.items.splice(
            this.form.items.length - 1,
          );
        }
      });
    },
  },
  components: {
    "v-select": vSelect,
  },
};
</script>
