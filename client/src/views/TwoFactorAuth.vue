<template>
  <div>
    <form class="login" @submit.prevent="login">
      <p>here comes the QR</p>
      <input required v-model="otp" placeholder="OTP" />
      <button type="submit">Send</button>
    </form>
  </div>
</template>
<script>
export default {
  data() {
    return {
        otp: ''
    }
  },
  methods: {

  }
}
</script>