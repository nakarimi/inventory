<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <!-- <div class="vx-col sm:w-1/2 md:w-1/2 lg:w-3/4 xl:w-3/5 sm:m-0 m-4"> -->
  <vx-card>
    <div class="vx-row pl-5">
      <div class="pr-5">
        <div class="clearfix">
          <h1>Add New Product</h1>
          <div class="vx-row">
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="code" label="Code" v-model="form.code" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('code') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="name" label="Name" v-model="form.name" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('name') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="unit" label="Unit" v-model="form.unit" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('unit') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="cost" label="Cost" v-model="form.cost" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('cost') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="price" label="Price" v-model="form.price" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('price') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="image" label="Image" v-model="form.image" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('image') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="category_id" label="Category" v-model="form.category_id" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('category_id') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="stock_id" label="Stock" v-model="form.stock_id" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('stock_id') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="user_id" label="User" v-model="form.user_id" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('user_id') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="quantity" label="Quantity" v-model="form.quantity" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('quantity') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="stock" label="Stock" v-model="form.stock" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('stock') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="barcode_symbology" label="Barcode Symbology" v-model="form.barcode_symbology" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('barcode_symbology') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <label for=""><small>Product Details</small></label>
              <vs-textarea v-validate="'required'" name="product_details" v-model="form.product_details" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('product Details') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="tax" label="Tax" v-model="form.tax" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('tax') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="type" label="Type" v-model="form.type" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('type') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="supplier" label="Supplier" v-model="form.supplier" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('supplier') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="supplier_price" label="Supplier_price" v-model="form.supplier_price" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('supplier_price') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="sale_unit" label="Sale_unit" v-model="form.sale_unit" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('sale_unit') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="purchase_unit" label="Purchase_unit" v-model="form.purchase_unit" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('purchase_unit') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="brand" label="Brand" v-model="form.brand" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('brand') }}</span>
            </div>
            <div class="mt-2 mb-2 px-2 grid w-1/4">
              <vs-input v-validate="'required'" name="featured" label="Featured" v-model="form.featured" class="w-full" />
              <span class="text-danger text-sm">{{ errors.first('featured') }}</span>
            </div>
          </div>
          <vs-button class="float-right mt-6" @click="storeProduct" :disabled="false">Send</vs-button>
        </div>
      </div>
    </div>
  </vx-card>
  <!-- </div> -->
</div>
</template>

<script>
import FormError from '../../share/FormError'
import vSelect from "vue-select";

export default {
  data() {
    return {
      form: new Form({
        code: '',
        name: '',
        unit: '',
        cost: '',
        price: '',
        image: '',
        category_id: '',
        stock_id: '',
        user_id: '',
        quantity: '',
        stock: '',
        barcode_symbology: '',
        product_details: '',
        tax: '',
        type: '',
        supplier: '',
        supplier_price: '',
        sale_unit: '',
        purchase_unit: '',
        brand: '',
        featured: '',
      }),
    }
  },
  components: {
    FormError,
    "v-select": vSelect,
  },
  created() {},
  methods: {
    storeProduct() {
      this.form.post('/api/products')
        .then((response) => {
          this.form.reset();
          this.$vs.notify({
            title: 'Success!',
            text: 'Process completed successfully!',
            color: 'success',
            iconPack: 'feather',
            icon: 'icon-check',
            position: 'top-left'
          })

        }).catch((error) => {
          if (this.form.errors.errors.error) {
            this.$vs.notify({
              title: 'Failed!',
              text: 'There is some failure, please try again!',
              color: 'danger',
              iconPack: 'feather',
              icon: 'icon-cross',
              position: 'top-left'
            })
          }
        })
    },
  }
}
</script>
