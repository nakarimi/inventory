<template lang="">
<div>
  <ul v-if="!this.form.errors.errors.error">
    <li v-for="(e, key) in Object.values(this.form.errors.errors)" :key="key">
      <small class="text-warning">{{ e[0] }}</small>
    </li>
  </ul>
</div>
</template>

<script>
export default {
  props: {
    form: {
      required: true
    }
  },
  watch: {
    'form.errors'() {
      console.log(this.form.errors.errors.error);
    }
  }

}
</script>
