<template>
  <div class="main-wrapper">
    <div class="side-section">
      <div class="side-section-top float-down" style="margin-top: 20px;">
        <div class="side-section-nav">
          <router-link :to="{name: 'home'}" v-slot="{ href, navigate }">
            <a :href="href" @click="navigate" class="logo-header">
              <img v-bind:src="'/'+customer+'/logo.png'" class="logo"/>
            </a>
          </router-link>
          <ul>
           <li>
              <router-link :to="{name: 'dashboard'}" v-slot="{ href, navigate, isExactActive }">
                <a :href="href" @click="navigate">
                  <div :class="[isExactActive && 'active', 'icon-wrap']">
                    <img v-bind:src="'/'+customer+'/icons/dashboard.svg'" />
                  </div>
                  <span>Dashboard</span>
                </a>
              </router-link>
            </li>
           <li>
              <router-link :to="{name: 'dynamicDashboard'}" v-slot="{ href, navigate, isExactActive }">
                <a :href="href" @click="navigate">
                  <div :class="[isExactActive && 'active', 'icon-wrap']">
                    <img v-bind:src="'/'+customer+'/icons/dynamic-dashboard.svg'" />
                  </div>
                  <span>Reports</span>
                </a>
              </router-link>
            </li>
            <li v-bind:class="profileClass">
              <router-link :to="{name: 'usersList'}" v-slot="{ href, navigate, isExactActive }">
                <a :href="href" @click="navigate">
                  <div :class="[isExactActive && 'active', 'icon-wrap']">
                     <img v-bind:src="'/'+customer+'/icons/profiles.svg'" />
                  </div>
                  <span>Profiles</span>
                </a>
              </router-link>
            </li>
            <li>
              <router-link :to="{name: 'home'}" v-slot="{ href, navigate, isExactActive }">
                <a :href="href" @click="navigate">
                  <div :class="[isExactActive && 'active', 'icon-wrap']">
                    <img v-bind:src="'/'+customer+'/icons/events.svg'" />
                  </div>
                  <span>Events</span>
                </a>
              </router-link>
            </li>
            <li v-bind:class="auditTrailClass">
              <router-link :to="{name: 'audit'}" v-slot="{ href, navigate, isExactActive }">
                <a :href="href" @click="navigate">
                  <div :class="[isExactActive && 'active', 'icon-wrap']">
                    <img v-bind:src="'/'+customer+'/icons/audit.png'" />
                  </div>
                  <span>Audit Trails</span>
                </a>
              </router-link>
            </li>
          </ul>
        </div>
      </div>
      <div class="side-section-bottom float-down" v-if="isLoggedIn">
        <div class="side-section-nav">
          <ul>
            <li @click="logout">
              <a :href="'/'+ customer + '/'">
                <div class="icon-wrap">
                  <img v-bind:src="'/'+customer+'/icons/logout.svg'" />
                </div>
                <span>Logout</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <router-view />
    <portal-target target-el="home" name="home">

    </portal-target>
  </div>
</template>
<script>
  import PortalVue from 'portal-vue'
  import Vue from 'vue'
  Vue.use(PortalVue);
  export default {
  data() {
    return {
      customer:process.env.VUE_APP_CUSTOMER,
      profileClass: '',
      auditTrailClass: ''
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn
    },
    userName() {
      return this.$store.getters.name
    },
    userRole() {
      return this.$store.getters.role.toLowerCase()
        .split(' ')
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ') ;
    }
  },
   mounted() {
     this.isUserPermitted('profiles') ;
     this.isUserPermitted('auditTrail') ;
      this.persistAuditLog();
    },

    methods: {
       isUserPermitted(vuePage){
        let params = {}
        params.page = vuePage ;
        this.$http.get('isUserPermitted', {params: params}).then(response => {
          if (response.status==200)  {

            if(vuePage == 'profiles' ) {
              if (response.data.permitted)
                 this.profileClass = 'showVueIcon' ;

                 else  this.profileClass =  'hideVueIcon' ;
            }

            else if(vuePage == 'auditTrail' ) {
              if (response.data.permitted)
                 this.auditTrailClass = 'showVueIcon' ;

                 else  this.auditTrailClass =  'hideVueIcon' ;
            }

          }
          else {console.log(response)}
        }).catch(error => {
          console.log(error)
        }).finally(() => {
        })
      },

    persistAuditLog() {
      setInterval(() => {
        if (sessionStorage.getItem('auditTrailCache')) {
          let trails = JSON.parse(sessionStorage.getItem('auditTrailCache'));
          this.$http.post('create-audit-trail', {params: trails}).then(response => {
            if (response.status==200)  {
              sessionStorage.removeItem('auditTrailCache')
              console.log('Audit Trail persisted: ' + Object.keys(trails).length + ' Objects');
            }
            else {console.log(response)}
          }).catch(error => {
            console.log(error)
          }).finally(() => {
          })
        }
      }, 2000);
    },
    logout() {
      this.$store.dispatch("logout").then(() => {
        this.$router.push("/login")
      })
    }
  },

  }
</script>
