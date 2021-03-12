<template>
	<h4>You are in home.</h4>
</template>
<script>
export default {
  data () {
    return {
    }
  },
  watch: {
    // '$store.state.theme' (val) {
    //   this.toggleClassInBody(val)
    // },
    // '$vs.rtl' (val) {
    //   document.documentElement.setAttribute('dir', val ? 'rtl' : 'ltr')
    // }
  },
  methods: {

  },
  mounted () {
  },
  created () {
		this.axios.get('/api/home').then((resp) => {
			console.log(resp);
		})
  },
  destroyed () {
  }
}

</script>
