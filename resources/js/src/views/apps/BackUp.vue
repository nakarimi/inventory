<template lang="">
    <div>
        <vx-card>
            <vs-button type="border" @click="newBackup()">
            <strong>Create Backup </strong></vs-button>
        </vx-card>
        <br>
        <vx-card>
            <ul>
                <li v-for="(backup, i) in all_backups">
                    <a href="" @click="downloadbackups(backup)">{{ backup }}</a>
                </li>
            </ul>
        </vx-card>
    </div>
</template>

<script>
export default {
  data() {
    return {
      all_backups: [],
    }
  },
  created() {
    this.allBackups();
  },
  methods: {
    newBackup() {
      this.$vs.loading();
      this.axios.get('/api/manage/new_backup').then((response) => {
        this.allBackups();
      }).catch(() => {this.$vs.loading.close()})
    },
    downloadbackups(file) {
      this.$vs.loading();
        window.open("/api/download/backup?file="+file, '_blank').focus();
    },
    allBackups() {
      this.$vs.loading();
      this.axios.get('/api/manage/all_backups').then((response) => {
        this.all_backups = response.data;
      }).catch(() => {this.$vs.loading.close()})
    },
  }

}
</script>
