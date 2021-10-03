import MainVueInstance from '@/main'
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    status: "",
    token: localStorage.getItem('token') || "",
    name: "",
    role: "",
    email: ""
  },
  mutations: {
    auth_request(state) {
      state.status = 'loading'
    },
    auth_success(state, token) {
      state.status = 'success'
      state.token = token
    },
    auth_error(state) {
      state.status = 'error'
    },
    logout(state) {
      state.status = ''
      state.token = ''
    },
  },
  actions: {
    login({ commit }, user) {
      return new Promise((resolve, reject) => {
        commit('auth_request')
        MainVueInstance.$http({ url: '/auth/login', data: user, method: 'POST' })
          .then(resp => {
            const token = resp.data.token
            localStorage.setItem('token', token)
            localStorage.setItem('user', user.email)
            MainVueInstance.$http.defaults.headers.common['x-access-token'] = token
            commit('auth_success', token, user)
            resolve(resp)
          })
          .catch(err => {
            commit('auth_error')
            localStorage.removeItem('token')
            reject(err)
          })
      })
    },
    verifyUser({ commit }, data) {
      return new Promise((resolve, reject) => {
        commit('auth_request')
        console.log(data)
        let userData = {
          tempSecret: data.tempSecret,
          password: data.password,
          confirmPassword: data.confirmPassword,
          token: data.token
        }
        if(userData.confirmPassword != userData.password){
          resolve({"data": {"message" : "These passwords don't match"}})
        }
        MainVueInstance.$http({ url: 'register?registration_number=' + data.slug, data: userData, method: 'POST' })
          .then(resp => {
            const token = resp.data.token
            localStorage.setItem('token', token)
            MainVueInstance.$http.defaults.headers.common['x-access-token'] = token
            commit('auth_success', token)
            resolve(resp)
          })
          .catch(err => {
            commit('auth_error')
            localStorage.removeItem('token')
            reject(err)
          })
      })
    },
    logout({ commit }) {
      localStorage.removeItem('token')
      sessionStorage.removeItem('auditTrailCache')
      sessionStorage.removeItem('user')
      return new Promise((resolve) => {
        commit('logout')
        localStorage.removeItem('token')
        delete MainVueInstance.$http.defaults.headers.common['x-access-token']
        MainVueInstance.$http({ url: '/auth/logout', method: 'POST' })
          .then(resp => {
            commit('logout_success')
            resolve(resp)
          })
          .catch(err => {
            commit('logout_error')
            resolve(err)
          })
      })
    }
  },
  getters: {
    isLoggedIn: state => !!state.token,
    role: (state) => {
      if (state.token) {
        let parsedToken = parseJwt(state.token)
        return parsedToken.role
      } else {
        return ""
      }
    },
    name: (state) => {
      if (state.token) {
        let parsedToken = parseJwt(state.token)
        return parsedToken.name
      } else {
        return ""
      }
    },
    email: (state) => {
      if (state.token) {
        let parsedToken = parseJwt(state.token)
        return parsedToken.email
      } else {
        return ""
      }
    }
  }
})

function parseJwt(token) {
  var base64Url = token.split('.')[1]
  var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/')
  var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
    return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2)
  }).join(''))

  return JSON.parse(jsonPayload)
}
