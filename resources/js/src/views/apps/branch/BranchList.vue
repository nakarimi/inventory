<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="branches" search stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th sort-key="">#</vs-th>
        <vs-th sort-key="name">Name</vs-th>
        <vs-th sort-key="code">Code</vs-th>
        <vs-th sort-key="address">Address</vs-th>
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
              <p>{{ tr.code }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.address }}</p>
            </vs-td>
            <vs-td v-if="tr">
              <action-buttons :parent_data.sync="branches" entity="branch" entity_plural="branches" :id="tr.id" ></action-buttons>
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
      branches: [],
    }
  },
  components: {
    ActionButtons
  },
  created() {
    this.loadBranches()
  },
  methods: {
    loadBranches() {
      this.axios.get('/api/branches').then((response) => {
        this.branches = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
