<template lang="">
<div>
  <span class="text-danger text-sm" v-if="field && form.errors.has(field)" v-text="form.errors.get(field)">
  </span>
</div>
</template>

<script>
export default {
  props: {
    form: {
      required: true
    },
    field: {
      required: false
    },
  },
}
</script>
