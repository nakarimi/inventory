<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="customers" search stripe pagination :max-items="10">
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
              <p>
                <vs-avatar size="40px" :src="`/img/customer/${(tr.logo) ? tr.logo : 'default.jpg'}`" />
              </p>
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
              <action-buttons :parent_data.sync="customers" entity="customer" entity_plural="customers" :id="tr.id" ></action-buttons>
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
      customers: [],
    }
  },
  components:{ActionButtons},
  created() {
    this.loadCustomers()
  },
  methods: {
    loadCustomers() {
      this.axios.get('/api/customers').then((response) => {
        this.customers = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
