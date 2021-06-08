<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="activity_log" stripe pagination :max-items="50">
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Description</vs-th>
        <vs-th>Causer</vs-th>
        <vs-th>Type</vs-th>
        <vs-th>ID</vs-th>
        <vs-th>Date</vs-th>
        <vs-th>Data</vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ tr.id }}</p>
            </vs-td>
            <vs-td>
              <vs-chip v-if="tr.description == 'Updated'" :color="'warning'">{{ tr.description }}</vs-chip>
              <vs-chip v-if="tr.description == 'Created'" :color="'success'">{{ tr.description }}</vs-chip>
              <vs-chip v-if="tr.description == 'Deleted'" :color="'danger'">{{ tr.description }}</vs-chip>
            </vs-td>
            <vs-td>
              <p>{{ tr.causer.first_name }} {{ tr.causer.last_name }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.subject_type }}</p>
            </vs-td>
            <vs-td>
              <p>#{{ tr.subject_id }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.created_at | formatDateTime }}</p>
            </vs-td>
            <vs-td>
              <span class="cursor-pointer hover:text-danger" @click="toggleModel(tr.properties)">
                <feather-icon icon="EyeIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
            </vs-td>
          </vs-tr>
        </tbody>
      </template>
    </vs-table>
  </vx-card>
  <vs-popup title="" :active.sync="popupOpen">
    <vx-card>
      <span v-for="(item, index) in popupData" :key="index">
        <li v-if="index != 'updated_at'">
          <strong class="capitalize">{{ index | remove_ }}</strong>: {{ item }}
        </li>
      </span>
    </vx-card>
  </vs-popup>
</div>
</template>

<script>
export default {
  data() {
    return {
      activity_log: [],
      popupOpen: false,
      popupData: [],
    }
  },
  created() {
    this.loadBranches()
  },
  methods: {
    toggleModel(data = []) {
      // this.getAllNotification();
      this.popupData = data;
      this.popupOpen = !this.popupOpen;
    },
    loadBranches() {
      this.axios.get('/api/activity_log').then((response) => {
        this.activity_log = response.data
      }).catch(() => {})
    }
  }

}
</script>
