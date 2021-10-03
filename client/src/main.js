import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from './plugins/axios'
import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
import '@/assets/style.css'
import '@/assets/dash-style.css'
import AuditTrailModel from "./model/AuditTrailModel";

Vue.use(Buefy)

Vue.prototype.$http = axios;

const token = localStorage.getItem('token')
if (token) {
  Vue.prototype.$http.defaults.headers.common['x-access-token'] = token
}

/**
 * Axios interceptor for incoming ajax request
 * In order to obtain relevant audit trail we need to intercept and validate any request
 * Instead of persisting the relevant audit trail that we want in a 'hard-coded' fashion, we can obtain these
 * Audit trails though this interceptor by 'caching' the desired trails such as 'Login-Logout' or 'Create-User'
 */
axios.interceptors.request.use(
  config => {
    //Validate the this request is not of the HTTP method 'GET' and its not the audit trail creation itself or else we will get stuck in a loop
    if (!config.url.includes("audit-trail") &&
        !config.url.includes("auth/logout") &&
        !config.url.includes("get-todays") &&
        !config.url.includes("get-currency") &&
        !config.url.includes('isUserPermitted') &&
        !config.url.includes('dynamic-dashboard')) {

      //Obtain the variables to persist
      let username = config.url.includes('login') ? config.data.email : localStorage.user ;
      let today = new Date();
      let data = Object.assign({}, config.data ? config.data :  config.params);
      today.setHours(today.getHours() + 3);

      //Remove certain parameters from the data object
      if (data.hasOwnProperty('password')) delete data.password ;
      if (data.hasOwnProperty('token')) delete data.token ;
      if (data.hasOwnProperty('confirmPassword')) delete data.confirmPassword ;

      //Create the AuditTrailModel object to persist
      Vue.prototype.$AuditTrailModel = new AuditTrailModel(today, JSON.stringify(data), config.url, username, config.method);

      //In order to make a bulk insert (Due to high number of audit trails objects throughout the application)
      //We will save any trail object in the  'auditTrailCache' session-storage cache
      //Later on after successful persistence we will clean this cache
      let auditTralilArray = sessionStorage.getItem('auditTrailCache');
      if (!auditTralilArray) auditTralilArray = {};
      else auditTralilArray = JSON.parse(auditTralilArray);
      let id = Vue.prototype.$AuditTrailModel.getId();
      auditTralilArray[id] = Vue.prototype.$AuditTrailModel;
      sessionStorage.setItem('auditTrailCache', JSON.stringify(auditTralilArray));
    }
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);

Vue.config.productionTip = false

export default new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
