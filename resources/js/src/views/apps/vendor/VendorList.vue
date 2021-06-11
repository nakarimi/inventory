<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="vendors" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="">Logo</vs-th>
        <vs-th sort-key="name">Name</vs-th>
        <vs-th sort-key="email">Email</vs-th>
        <vs-th sort-key="phone">Phone</vs-th>
        <vs-th sort-key="address">Address</vs-th>
        <vs-th sort-key="website">Website</vs-th>
        <vs-th sort-key=""></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <vs-avatar size="40px" :src="`/img/vendor/${(tr.logo) ? tr.logo : 'default.jpg'}`" />
            </vs-td>
            <vs-td>
              <p>{{ tr.name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.email }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.phone }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.address }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.website }}</p>
            </vs-td>
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="vendors" entity="vendor" entity_plural="vendors" :id="tr.id" ></action-buttons>
            </vs-td>
          </vs-tr>
        </tbody>
      </template>
    </vs-table>
  </vx-card>
</div>
</template>

<script>
import ActionButtons from '../../share/ActionButtons'
export default {
  data() {
    return {
      vendors: [],
    }
  },
  components:{ActionButtons},
  created() {
    this.loadVendors()
  },
  methods: {
    loadVendors() {
      this.axios.get('/api/vendors').then((response) => {
        this.vendors = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
