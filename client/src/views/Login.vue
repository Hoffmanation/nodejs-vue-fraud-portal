<template>
  <div class="login-wrap">
    <img class="login-logo" src="login-logo.png" />
    <div class="login-inner">
      <div class="field">
        <p class="control has-icons-left">
          <input v-on:keyup.enter="login" class="input is-medium is-rounded"  v-bind:class="{ error: emailError }" v-model="email" type="email" placeholder="Email" />
          <span class="icon is-small is-left">
            <img v-bind:src="'/'+customer+'/icons/mail.svg'" />
          </span>
        </p>
      </div>
      <div class="field">
        <p class="control has-icons-left">
          <input v-on:keyup.enter="login" class="input is-medium is-rounded" v-bind:class="{ error: passwordError }" v-model="password" type="password" placeholder="Password" />
          <span class="icon is-small is-left">
           <img v-bind:src="'/'+customer+'/icons/password.svg'" />
          </span>
        </p>
      </div>
      <div class="field">
        <p class="control has-icons-left">
          <input v-on:keyup.enter="login" class="input is-medium is-rounded" v-bind:class="{ error: tokenError }" v-model="token" placeholder="Token" />
        </p>
      </div>
      <p class="error">{{error}}</p>
    </div>
    <button class="button is-medium is-rounded" @click="login">Sign in</button>
<!--    <p class="text">-->
<!--      <span>Forgot password?</span>-->
<!--      <a href="#">Click here</a>-->
<!--    </p>-->
  </div>
</template>
<script>
export default {
  data() {
    return {
      customer:process.env.VUE_APP_CUSTOMER,
      tokenError :false,
      passwordError :false,
      emailError :false,
      email: "",
      password: "",
      token: "",
      error : "",
      errorClass: ""
    }
  },
  methods: {
    login: function() {
      this.cleanupForm() ;
      let email = this.email
      let password = this.password
      let token = this.token
      this.$store
        .dispatch("login", { email, password, token })
        .then(response => {
          localStorage.setItem('VERSION' , 'v1.4.1')
          localStorage.setItem('VERSION_RELEASE_DATE' , '11/11/2020')
          response.data.message ?  this.handleError(response) :
          this.$router.push({name: 'home'})
        })
        .catch(err => console.log(err))
    },

    handleError: function (response) {
        this.error =  response.data.message ;
        this.errorClass =  response.data.errorClass ;
        this.tokenError = this.errorClass == "token" ;
        this.passwordError = this.errorClass =="password" ;
        this.emailError = this.errorClass == "email" ;
    },

    cleanupForm: function () {
      this.error = "" ;
    },
  }
}
</script>
