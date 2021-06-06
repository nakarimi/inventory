<template>
<div class="flex w-full bg-img vx-row no-gutter justify-center">
  <div class="vx-col w-full sm:m-0 m-4">
    <vx-card class="w-full">
      <div class="clearfix">
        <h1>Add New Product</h1>
        <vs-row>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input name="name" label="Name" v-model="form.name" @input="form.errors.errors.name = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="name"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input name="code" label="Code" v-model="form.code" @input="form.errors.errors.code = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="code"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/3 xl:w-1/3 p-2">
            <vs-input name="unit" label="Unit" v-model="form.unit" @input="form.errors.errors.unit = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="unit"></has-error>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-input type="number" name="cost" label="Cost" v-model="form.cost" @input="form.errors.errors.cost = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="cost"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <vs-input type="number" name="price" label="Price" v-model="form.price" @input="form.errors.errors.price = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="price"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/2 xl:w-1/2 p-2">
            <label for=""><small>Product Details</small></label>
            <vs-textarea rows="10" name="product_details" v-model="form.product_details" @input="form.errors.errors.product_details = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="product_details"></has-error>
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
            <has-error class="text-danger text-sm" :form="form" field="image"></has-error>
          </vs-col>
          <!-- End Of Product Upload Image. -->

        </vs-row>
        <vs-row>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Category</small></label>
            <v-select label="name" name="category_id" v-model="form.category_id" @input="form.errors.errors.category_id = []" :options="categories" />
            <has-error class="text-danger text-sm" :form="form" field="category_id"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <label for=""><small>Stock</small></label>
            <v-select label="name" name="stock_id" v-model="form.stock_id" @input="form.errors.errors.stock_id = []" :options="stocks" />
            <has-error class="text-danger text-sm" :form="form" field="stock_id"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" name="quantity" label="quantity" v-model="form.quantity" @input="form.errors.errors.quantity = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="quantity"></has-error>
          </vs-col>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="barcode_symbology" label="Barcode Symbology" v-model="form.barcode_symbology" @input="form.errors.errors.barcode_symbology = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="barcode_symbology"></has-error>
          </vs-col>
        </vs-row>
        <vs-row>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" name="tax" label="tax" v-model="form.tax" @input="form.errors.errors.tax = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="tax"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="type" label="type" v-model="form.type" @input="form.errors.errors.type = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="type"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="supplier" label="supplier" v-model="form.supplier" @input="form.errors.errors.supplier = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="supplier"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input type="number" name="supplier_price" label="Supplier Price" v-model="form.supplier_price" @input="form.errors.errors.supplier_price = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="supplier_price"></has-error>
          </vs-col>
        </vs-row>
        <vs-row>

          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="sale_unit" label="sale_unit" v-model="form.sale_unit" @input="form.errors.errors.sale_unit = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="sale_unit"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="purchase_unit" label="purchase_unit" v-model="form.purchase_unit" @input="form.errors.errors.purchase_unit = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="purchase_unit"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="brand" label="brand" v-model="form.brand" @input="form.errors.errors.brand = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="brand"></has-error>
          </vs-col>
          <vs-col class="my-2 sm:w-1 md:w-1/2 lg:w-1/4 xl:w-1/4 p-2">
            <vs-input name="featured" label="featured" v-model="form.featured" @input="form.errors.errors.featured = []" class="w-full" />
            <has-error class="text-danger text-sm" :form="form" field="featured"></has-error>
          </vs-col>
        </vs-row>
        <vs-button class="float-right mt-6" @click="storeProduct" :disabled="form.busy">Send</vs-button>
      </div>
    </vx-card>
  </div>
</div>
</template>

<script>
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
    "v-select": vSelect,
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
  }
}
</script>
