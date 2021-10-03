<template>
  <div class="main-content events" v-bind:class="{ home: home }">
    <div class="title" v-bind:class="{eventsTitle: !home}"><img
      class="back-events" v-if="!home" v-bind:src="'/'+customer+'/icons/chevron_left.svg'">
      <h1 class="page-title">Audit Trails</h1></div>
    <div class="filters-wrapper">
      <h2 class="page-subtitle">


        <b-tooltip :label="(showAllFilters ? 'Collapse':'Expand') + ' filters'">
          <b-icon
            :icon="showAllFilters ? 'arrow-collapse-horizontal' : 'arrow-expand-horizontal'"
            @click.native="showAllFilters=!showAllFilters"
          ></b-icon>
        </b-tooltip>
        Filters:
      </h2>

      <!--resource dropdown-->
      <b-dropdown
        rounded
        multiple
        aria-role="list"
        placeholder="Resource"
        v-model="filters.resource"
        @change="selectChange">
        <button v-bind:class="{ is_selected: resourceIsSelected  }" class="button is-rounded"
                type="button" slot="trigger">
          <span>Resource ({{ filters.resource.length }})</span>
          <b-icon icon="menu-down"></b-icon>
        </button>
        <b-dropdown-item  v-model="auditResources[index]" aria-role="listitem" v-for="(name,index) in auditResources" :key="name">
          <span :key="name">{{name}}</span>
        </b-dropdown-item>
      </b-dropdown>

      <!-- Date pickers-->
      <b-datepicker
        placeholder="Date Start"
        icon="calendar-today"
        class="is-rounded"
        id="dateStart"
        :date-formatter="formatDate"
        v-bind:class="{ is_selected: timestampStartIsSelected }"
        v-model="dateFilters.timestampStart"
        editable>

        <button
          class="button is-danger"
          @click="dateFilters.timestampStart = null">
          <b-icon icon="close"></b-icon>
          <span>Clear</span>
        </button>
      </b-datepicker>

      <b-datepicker
        placeholder="Date End"
        icon="calendar-today"
        :date-formatter="formatDate"
        id="dateEnd"
        v-bind:class="{ is_selected: timestampEndIsSelected }"
        v-model="dateFilters.timestampEnd"
        editable>
        <button class="button is-danger" @click="dateFilters.timestampEnd = null">
          <b-icon icon="close"></b-icon>
          <span>Clear</span>
        </button>
      </b-datepicker>

      <!--Username dropdown-->
      <b-dropdown
        rounded
        multiple
        aria-role="list"
        placeholder="Username"
        v-model="filters.username"
        @change="selectChange">

        <button v-bind:class="{ is_selected: usernameIsSelected}" class="button is-rounded"  type="button" slot="trigger">
          <span>User ({{ filters.username.length }})</span>
          <b-icon icon="menu-down"></b-icon>
        </button>
        <b-dropdown-item  v-model="auditUsernames[index].username" aria-role="listitem" v-for="(name,index) in auditUsernames" :key="name.username">
          <span :key="name.username">{{name.username}}</span>
        </b-dropdown-item>
      </b-dropdown>

      <input
        class="input is-rounded"
        type="text"
        placeholder="Data"
        v-bind:class="{ is_selected: dataIsSelected }"
        v-model="filters.data"
        @keyup.enter="onFilterInput"/>


    <!--Filter Buttins-->
    </div>
    <!--https://iconify.design/icon-sets/mdi/-->
    <div style="margin-bottom: 10px">
      <button @click="onFilterInput" class="deep-blue button is-rounded" type="button"
              slot="trigger">
        <b-icon icon="check"></b-icon>
        <span>Apply</span>
      </button>
      <button @click="clearFilters" class="light-blue button is-rounded" type="button"
              slot="trigger">
        <b-icon icon="delete"></b-icon>
        <span>Clear</span>
      </button>
      <button @click="apply" style="float: right;" class="deep-blue button is-rounded" type="button"
              slot="trigger">
        <b-icon icon="refresh"></b-icon>
        <span>Refresh</span>
      </button>
    </div>


    <!-- Audit Table -->
    <b-table
      v-bind:class="{ home: home }"
      :data="items"
      :loading="loading"
      paginated
      backend-pagination
      :total="options.totalItems"
      :per-page="options.itemsPerPage"
      @page-change="onPageChange"
      pagination-position="top"
      aria-next-label="Next page"
      aria-previous-label="Previous page"
      aria-page-label="Page"
      aria-current-label="Current page"
      backend-sorting
      :default-sort-direction="options.defaultSortOrder"
      :default-sort="[options.sortField, options.sortOrder]"
      @sort="onSort">

      <template class="paint-raw" slot-scope="props">

<!--
        <b-table-column label="HTTP Method" field="method" sortable>
          <b-tag class="capitalize" rounded :type="getHttpMethodTag(props.row.method)">{{props.row.method.toUpperCase()}}</b-tag>
        </b-table-column>-->


        <b-table-column
          label="Date"
          field="date"
          sortable>
          {{ props.row.date | dateFilter }}
        </b-table-column>


        <b-table-column label="Logged in User" field="user" sortable>{{ props.row.username }}
        </b-table-column>

        <b-table-column style="max-width: 150px; word-break: break-word;" label="Resource"  field="resource" sortable>{{props.row.resource}}
        </b-table-column>

        <b-table-column style="max-width: 150px; word-break: break-word;" label="Data"  field="data" sortable>
          <a @mouseover="paintRaw = true" @mouseleave="paintRaw = false" class="role-columns"
             @click="rowClick(props.row.data)">{{ props.row.data }}
          </a>
        </b-table-column>

        <b-table-column style="max-width: 150px; word-break: break-word;" label="Path"  field="path" sortable>{{ props.row.path}}
        </b-table-column>






      </template>
    </b-table>
    <div class="event-list-detail-sidebar">
      <portal to="home" v-if="!home">
         <ModBar :items="itemsDetail" v-on:changeHomeStatus="home = !home"/>
      </portal>
    </div>
  </div>
</template>
<script>
  import Vue from "vue"
  import ModBar from "@/components/ModificationBar.vue"
  import PortalVue from 'portal-vue'
  import $ from 'jquery'
  Vue.use(PortalVue);

  export default {
    name: "events",

    data() {
      return {
        customer: process.env.VUE_APP_CUSTOMER,
        toBeCleard: false,
        paintRaw: false,
        home: true,
        timestampStartIsSelected: false,
        timestampEndIsSelected: false,
        usernameIsSelected: false,
        dataIsSelected: false,
        resourceIsSelected: false,
        desserts: [],
        showAllFilters: false,
        auditUsernames :[],
        auditResources :[],
        items : [] ,
        itemsDetail : [] ,
        rootLevelItemsDetail: [],
        loading: false,
        options: {
          totalItems: 0,
          itemsPerPage: "",
          sortField: "date",
          sortOrder: "desc",
          defaultSortOrder: "desc",
          page: 1,
          perPage: 20
        },
        filters: {
          resource: [],
          username: []
        },
        ranges: {},
        timeout: {},
        dateFilters: {},
        sortBy: {}
      }
    },
    model: {
      prop: 'home',
      event: 'onChangeHomeStatus'
    },
    components: {
      ModBar
    },
    props: ["id"],

    mounted() {
      this.getData();
      this.getUsernames();
      this.getResources();
    },

    watch: {
      $route(to) {
        if (to.params.requestid) {
          this.getEventById(to.params.requestid);
          this.home = false;
        } else {
          this.home = true;
        }
      },
      dateFilters: {
        handler: function () {
          for (const property in this.dateFilters) {
            let newVal = ""
            if (this.dateFilters[property]) {
              let dt = new Date(this.dateFilters[property])
              newVal = [dt.getFullYear(), dt.getMonth() + 1, dt.getDate()].join(
                "-"
              )
            }
            Vue.set(this.ranges, property, newVal)
            this.getData()
          }
        },
        deep: true
      }
    },
    filters: {


      dateFilter(value) {
        if (!value) return ""
        let dt = new Date(value)
        let month = dt.getMonth() + 1 < 10 ? "0" + (dt.getUTCMonth() + 1) : (dt.getUTCMonth() + 1)
        let days = dt.getUTCDate() < 10 ? "0" + dt.getUTCDate() : dt.getUTCDate()
        let hours = dt.getUTCHours() < 10 ? "0" + dt.getUTCHours() : dt.getUTCHours()
        let minutes = dt.getUTCMinutes() < 10 ? "0" + dt.getUTCMinutes() : dt.getUTCMinutes()
        return (
          days + "/" + month + "/" + dt.getFullYear() + " " + hours + ":" + minutes
        )
      },


      resourceFilter(value) {
        if (!value) return "";
        value = value.trim() ;
        return value;
      },




    },

    methods: {

      getHttpMethodTag(val) {
        let method = val ;
        method = method.trim() ;
        if (method === "post") return "is-success"
        if (method === "put") return "is-warning"
        if (method === "delete") return "is-danger"
        return "is-info"
      },

      formatDate(value) {
        if (!value) return ""
        let dt = new Date(value)
        let month = dt.getMonth() + 1
        let days = dt.getDate()
        return (
          days + "/" + month + "/" + dt.getFullYear()
        )
      },

      colorAppliedFilters(params) {
        this.timestampStartIsSelected = false
        this.timestampEndIsSelected = false
        this.usernameIsSelected = false
        this.dataIsSelected = false
        this.resourceIsSelected = false
        $('#dateStart').removeClass('is_selected')
        $('#dateEnd').removeClass('is_selected')

        let filters = params.filters
        let ranges = params.ranges

        if (filters.resource.length > 0) this.resourceIsSelected = true
        if (filters.username.length > 0) this.usernameIsSelected = true

        if (filters.data) this.dataIsSelected = true


        if (ranges.timestampStart) $('#dateStart').addClass('is_selected')
        if (ranges.timestampEnd) $('#dateEnd').addClass('is_selected')
      },

      getUsernames(){
           this.$http
          .get("audit-trails-usernames")
          .then(response => {
            this.auditUsernames = response.data
          })
          .catch(error => {
            console.log(error) ;
            if (error.response.status == 401) {
              this.$store.dispatch("logout").then(() => {
                this.$router.push("/login")
              })
            }
          })
          .finally(() => {
            this.loading = false
          })
      },

      getResources(){
           this.$http
          .get("audit-trails-resources")
          .then(response => {
            this.auditResources = response.data.AuditTrailResources ;
          })
          .catch(error => {
            console.log(error) ;
            if (error.response.status == 401) {
              this.$store.dispatch("logout").then(() => {
                this.$router.push("/login")
              })
            }
          })
          .finally(() => {
            this.loading = false
          })
      },

      getData() {
        this.loading = true
        let params = {}
        let sortBy = {}
        sortBy[this.options.sortField] = this.options.sortOrder

        for (const property in this.dateFilters) {
          let newVal = ""
          if (this.dateFilters[property]) {
            let dt;
            if (property == 'timestampEnd') {
              dt = new Date(this.dateFilters[property])
              dt.setDate(dt.getDate() + 1);
            } else {
              dt = new Date(this.dateFilters[property])
            }
            newVal = [dt.getFullYear(), dt.getMonth() + 1, dt.getDate()].join("-")
          }
          Vue.set(this.ranges, property, newVal)
        }

        params.sort = sortBy
        params.currentPage = this.options.page
        params.perPage = this.options.itemsPerPage
        params.filters = this.filters
        params.ranges = this.ranges
        this.colorAppliedFilters(params);

        this.$http
          .get("audit-trails", {params: params})
          .then(response => {
            this.items = response.data.data
            this.options.totalItems = parseInt(response.data.pagination.total)
            this.options.itemsPerPage = parseInt(response.data.pagination.perPage)
            this.options.page = parseInt(response.data.pagination.currentPage)
            this.toBeCleard = false;
          })
          .catch(error => {
            console.log(error)
            if (error.response.status == 401) {
              this.$store.dispatch("logout").then(() => {
                this.$router.push("/login")
              })
            }
            this.errored = true
          })
          .finally(() => {
            this.loading = false
          })
      },
      apply() {
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]');
        if (page1) {
          page1.click()
        }
        this.getData();
      },
      clearFilters() {
        this.dateFilters = {},
          this.filters = {
            resource: [],
            username: [],
          },
          this.ranges = {},
          this.toBeCleard = true;
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]');
        if (page1) {
          page1.click()
        }
        this.getData()
      },

      onPageChange(page) {
        this.options.page = page
        this.getData()
      },


      onSort(field, order) {
        this.options.sortField = field
        this.options.sortOrder = order
        this.sortBy[this.options.sortField] = this.options.sortOrder
        this.getData()
      },

      onFilterInput() {
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]');
        if (page1) {
          page1.click()
        }
        this.getData()
      },

      selectChange() {
        if (this.timeout) clearTimeout(this.timeout)
        this.timeout = setTimeout(() => {
          this.getData()
        }, 500)
      },

      rowClick(data) {
          this.itemsDetail = [] ;
          this.rootLevelItemsDetail = [] ;
          this.itemsDetail = JSON.parse(data) ;

        let sideBarElement = $('.vue-portal-target');
        sideBarElement.css('position', 'fixed');
        let bTableElement = $('.b-table');
        bTableElement.css('height', '600px');
        this.home = false;
      },

      returnToEvents() {
        this.$router.push({name: 'home'})
          .catch(err => err + 1)
      }

    }
  }
</script>
