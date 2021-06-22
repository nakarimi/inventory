<template>
<div>
  <vs-divider class="pt-3 px-3 pb-0">Fix Products </vs-divider>
  <div data-vv-scope="step-3">
    <div v-for="(i, index) in form.fix_items" :key="i.id">
      <vs-row vs-w="12" class="pb-2 mb-2">
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <label for=""><small>Product</small></label>
          <vs-input v-model="i.item" />
          <span class="text-danger text-sm absolute">{{ errors.first('item') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <label for=""><small>Unit</small></label>
          <vs-input v-model="i.unit" />
          <span class="text-danger text-sm absolute">{{ errors.first('unit') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <vs-input name="amount" label="Amount" v-model="i.amount" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('amount') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <vs-input name="unit_price" label="Unit Price" v-model="i.unit_price" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('unit_price') }}</span>
        </vs-col>
        <vs-col class="my-1 sm:w-1 md:w-1/2 lg:w-1/6 xl:w-1/6 px-2">
          <vs-input name="total_price" label="Total Price" disabled :value="i.total_price" :data="items_total" class="w-full" />
          <span class="text-danger text-sm absolute">{{ errors.first('total_price') }}</span>
        </vs-col>
      </vs-row>
    </div>
  </div>
  <vs-row vs-w="12">
    <vs-col vs-type="flex" vs-justify="right" vs-align="right" vs-lg="4" vs-sm="4" vs-xs="12" class="pt-2 mb-2 ml-3 mr-3">
      <vs-button type="border" @click.stop="addRow" color="success" icon="add"></vs-button>
      <vs-button type="border" id="delete-btn" @click.stop="removeRow" :disabled="form.fix_items.length <= 1" color="danger" class="mx-2" icon="delete"></vs-button>
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
  },
  computed: {
    items_total() {
      let main_price = 0;
      for (const key of Object.keys(this.form.fix_items)) {
        this.form.fix_items[key].total_price = (this.form.fix_items[key].unit_price * this.form.fix_items[key].amount);
        main_price += this.form.fix_items[key].total_price;
      }
      this.form.total = main_price;
    }
  },
  methods: {
    addRow() {
      this.form.fix_items.push({
        item: "",
        unit: "",
        amount: "0",
        unit_price: "0",
        total_price: "0",
      });
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
          this.form.fix_items.splice(
            this.form.fix_items.length - 1,
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
