<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="branches" stripe>
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Name</vs-th>
        <vs-th>Code</vs-th>
        <vs-th>Address</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p @click.stop="viewData(tr)" class="cursor-pointer">{{i + 1 }}</p>
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
      branches: [],
    }
  },
  created() {
    this.loadBranches()
  },
  methods: {
    loadBranches() {
      this.axios.get('/api/branches').then((response) => {
        console.log(response.data);
        this.branches = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
