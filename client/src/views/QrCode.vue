<template>
  <div class="login-wrap">
    <img class="logo" src="xportal_logo_green.svg" />
    <h1>Two factor autentification</h1>

    <div class="field">
      <p class="control has-icons-left">
        <input
          v-bind:class="{ error: passwordError }"
          class="input is-medium is-rounded"
          v-model="password"
          type="password"
          placeholder="Type your new password"
          v-on:keyup.enter="submitRegistration"
        />
        <span class="icon is-small is-left">
          <img src="icons/password.svg" />
        </span>
      </p>
    </div>

    <div class="field">
      <p class="control has-icons-left">
        <input
          v-bind:class="{ error: confirmPasswordError }"
          class="input is-medium is-rounded"
          v-model="confirmPassword"
          type="password"
          placeholder="Confirm password"
          v-on:keyup.enter="submitRegistration"
        />
        <span class="icon is-small is-left">
          <img src="icons/password.svg" />
        </span>
      </p>
    </div>


    <h2>Scan this QR code with your mobile phone:</h2>
    <img class="qr-code" :src="dataURL" />
    <div class="field">
      <p class="control has-icons-left">
        <input v-on:keyup.enter="submitRegistration" v-bind:class="{ error: tokenError }" class="input is-medium is-rounded" v-model="token" placeholder="Verification Code" />
      </p>

    </div>

    <p class="error">{{error}}</p>
    <br>
    <button class="button is-medium is-rounded" @click="submitRegistration">Register</button>
<!--    <p class="text">-->
<!--      <span>Lost your device? Check out our</span>-->
<!--      <a href="#">two factor autentification guide</a>-->
<!--      <span>or request</span>-->
<!--      <a href="#">two factor autentification reset</a>-->
<!--      <span>here</span>-->
<!--    </p>-->
  </div>
</template>
<script>
export default {

  data() {
    return {
      customer:process.env.VUE_APP_CUSTOMER,
      password: "",
      confirmPassword: "",
      is_admin: null,
      slug: "",
      dataURL: "",
      token: "",
      tokenError :false,
      passwordError :false,
      confirmPasswordError :false,
      error : "",
      errorClass: ""
    }
  },
  mounted() {
    this.slug = this.$route.query.registration_number
    this.getQrCode()
  },
  methods: {
    persistAuditLog() {
        if (sessionStorage.getItem('auditTrailCache')) {
          let trails = JSON.parse(sessionStorage.getItem('auditTrailCache'));
          this.$http.post('create-audit-trail', {params: trails}).then(response => {
            if (response.status==200)  {
              sessionStorage.removeItem('auditTrailCache')
              console.log('Audit log persisted: ' + Object.keys(trails).length + ' Objects');
            }
            else {console.log(response)}
          }).catch(error => {
            console.log(error)
          }).finally(() => {
          })
        }
    },
    submitRegistration() {
      this.cleanupForm() ;
      let tempSecret = this.tempSecret
      let password = this.password
      let confirmPassword = this.confirmPassword
      let token = this.token
      let slug = this.slug
      this.$store
        .dispatch("verifyUser", { tempSecret, password, confirmPassword,token, slug })
        .then(response => {
          if (response.data.message)
            this.handleError(response)

          else {
            this.persistAuditLog();
            this.$router.push({name: 'home'})
          }

        })
        .catch(err => this.handleError(err))
      this.$http.post("register?registration_number=" + this.slug, {
        tempSecret: this.tempSecret,
        password: this.password,
        token: this.token
      })
    },
    getQrCode() {
      this.$http
        .get("register", { params: { registration_number: this.slug } })
        .then(response => {
          this.dataURL = response.data.dataURL
          this.tempSecret = response.data.tempSecret
        })
        .catch(error => {
          console.log(error)
          this.errored = true
        })
        .finally(() => (this.loading = false))
    },
    qrCodePost() {
      let data = {
        name: this.name,
        email: this.email,
        password: this.password,
        is_admin: this.is_admin
      }
      this.$store
        .dispatch("verify", data)
        .then(() => this.$router.push({ name: "home" }))
        .catch(err => console.log(err))
    },
    cleanupForm: function () {
      this.error = "" ;
    },
    handleError: function (response) {
      this.error =  response.data.message ;
      this.errorClass =  response.data.errorClass ;
      this.tokenError = this.errorClass == "token" ;
      this.passwordError = this.errorClass =="password" ;
    },
  }
}
</script>
