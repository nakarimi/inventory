<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Product</h1>
        <vs-row>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="name" label="Name" v-model="form.name" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('name') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="code" label="Code" v-model="form.code" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('code') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="unit" label="Unit" v-model="form.unit" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('unit') }}</span>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="cost" label="Cost" v-model="form.cost" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('cost') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="price" label="Price" v-model="form.price" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('price') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-textarea rows="10" v-validate="'required'" data-vv-validate-on="blur" name="Product Details" label="product_details" v-model="form.product_details" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('product_details') }}</span>
          </vs-col>

          <!-- Upload Image for Product. -->
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <div class="vx-col w-full">
              <template v-if="form.image">
                <div class="img-container w-64 mx-auto flex items-center justify-center mt-5">
                  <img :src="form.image" width="50px" height="50px" alt="img" class="user_image responsive" />
                </div>
                <div class="modify-img flex justify-center mt-5">
                  <input type="file" class="hidden" ref="updateImgInput" @change="updateCurrImg" accept="image/*" />
                  <vs-button class="mr-4" @click="$refs.updateImgInput.click()">Change</vs-button>
                  <vs-button color="warning" @click="form.image = null">Remove</vs-button>
                </div>
              </template>
              <template v-if="!form.image">
                <div class="mt-4">
                  <div class="img-container w-64 mx-auto flex items-center justify-center">
                    <img src="/img/default/product.png" width="50px" height="50px" alt="img" @click="$refs.uploadImgInput.click()" class="user_image responsive cursor-pointer" />
                  </div>
                </div>
              </template>
              <div class="upload-img mt-5 text-center" v-if="!form.image">
                <input type="file" class="hidden" ref="uploadImgInput" @change="updateCurrImg" accept="image/*" />
                <vs-button @click="$refs.uploadImgInput.click()">Upload</vs-button>
              </div>
            </div>
            <span class="text-danger text-sm absolute">{{ errors.first('image') }}</span>
          </vs-col>
          <!-- End Of Product Upload Image. -->

        </vs-row>
        <vs-row>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Category</small></label>
            <v-select label="name" name="category_id" v-validate="'required'" v-model="form.category_id" :options="categories" />
            <span class="text-danger text-sm absolute">{{ errors.first('category_id') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Stock</small></label>
            <v-select label="name" name="stock_id" v-validate="'required'" v-model="form.stock_id" :options="stocks" />
            <span class="text-danger text-sm absolute">{{ errors.first('stock_id') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="quantity" label="quantity" v-model="form.quantity" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('quantity') }}</span>
          </vs-col>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="barcode_symbology" label="Barcode Symbology" v-model="form.barcode_symbology" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('barcode_symbology') }}</span>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="tax" label="tax" v-model="form.tax" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('tax') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="type" label="type" v-model="form.type" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('type') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="supplier" label="supplier" v-model="form.supplier" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('supplier') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" v-validate="'required'" data-vv-validate-on="blur" name="supplier_price" label="Supplier Price" v-model="form.supplier_price" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('supplier_price') }}</span>
          </vs-col>
        </vs-row>
        <vs-row>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="sale_unit" label="sale_unit" v-model="form.sale_unit" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('sale_unit') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="purchase_unit" label="purchase_unit" v-model="form.purchase_unit" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('purchase_unit') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="brand" label="brand" v-model="form.brand" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('brand') }}</span>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input v-validate="'required'" data-vv-validate-on="blur" name="featured" label="featured" v-model="form.featured" class="w-full" />
            <span class="text-danger text-sm absolute">{{ errors.first('featured') }}</span>
          </vs-col>
        </vs-row>
        <form-error :form="form"></form-error>
        <vs-button class="float-right mt-6" @click="storeProduct" :disabled="!validateForm">Send</vs-button>
      </div>
    </vx-card>
  </div>
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
      categories: [],
      stocks: [],
    }
  },
  components: {
    FormError,
    "v-select": vSelect,
  },
  computed: {
    validateForm() {
      return true;
      // return this.form.name !== '' &&
      //   this.form.code !== '' &&
      //   this.form.phone !== ''
    }
  },
  created() {
    if (this.$route.params.id) {
      this.loadProduct(this.$route.params.id)
    }
    this.loadStocks()
    this.loadCategory()
  },
  methods: {


    // Read image data and append to the form.
    updateCurrImg(input) {
      if (input.target.files && input.target.files[0]) {
        const reader = new FileReader()
        reader.onload = e => {
          this.form.image = e.target.result
        }
        reader.readAsDataURL(input.target.files[0])
      }
    },
    loadStocks() {
      this.axios.get('/api/stocks').then((response) => {
        this.stocks = response.data
      }).catch(() => {})
    },
    loadProduct(id) {
      this.axios.get(`/api/products/${id}/edit`).then((response) => {
        
        // Fill the form with database data.
        this.form.fill(response.data);
        this.form.image = '/img/product/' + this.form.image;
      }).catch(() => {})
    },
    loadCategory() {
      this.axios.get('/api/categories').then((response) => {
        this.categories = response.data
      }).catch(() => {})
    },

    storeProduct() {
      this.form.logo = this.form.image;

      // check to call update or store function in backend.
      if (this.$route.params.id) {
        var x = this.form.patch(`/api/products/${this.$route.params.id}`)
        if (this.form.image.includes('/img/product/')) {
          this.form.image = this.form.image.replace('/img/product/', '');
        }
      } else {
        var x = this.form.post('/api/products')
      }
      x.then((response) => {
        if (!this.$route.params.id) {
          this.form.reset();
        }
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
