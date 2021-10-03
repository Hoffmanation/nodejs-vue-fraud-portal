<template>
  <div class="main-content events" v-bind:class="{ home: home }">
    <div class="title" @click="returnToEvents" v-bind:class="{eventsTitle: !home}"><img class="back-events" v-if="!home" v-bind:src="'/'+customer+'/icons/chevron_left.svg'"><h1 class="page-title">Events</h1></div>
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
      <b-dropdown
        rounded
        multiple
        aria-role="list"
        placeholder="Severity"
        v-model="filters.severity"
        @change="selectChange"
      >
        <button v-bind:class="{ is_selected: severityIsSelected }" class="button is-rounded" type="button" slot="trigger">
          <span>Severity ({{ filters.severity.length }})</span>
          <b-icon icon="menu-down"></b-icon>
        </button>
        <b-dropdown-item value="LOW" aria-role="listitem">
          <span>Low</span>
        </b-dropdown-item>
        <b-dropdown-item value="MEDIUM" aria-role="listitem">
          <span>Medium</span>
        </b-dropdown-item>
        <!--b-dropdown-item value="HIGH" aria-role="listitem">
          <span>High</span>
        </b-dropdown-item-->
        <b-dropdown-item value="VERY_HIGH" aria-role="listitem">
          <span>Very High</span>
        </b-dropdown-item>
      </b-dropdown>

      <input
        class="input is-rounded"
        type="text"
        placeholder="Customer ID"
        v-bind:class="{ is_selected: useridIsSelected }"
        v-model="filters.userid"
        @keyup.enter="onFilterInput"
      />

      <input
        class="input is-rounded"
        type="text"
        placeholder="Device ID"
        v-bind:class="{ is_selected: deviceidIsSelected }"
        v-model="filters.deviceid"
        @keyup.enter="onFilterInput"
      />

      <b-datepicker
        placeholder="Date Start"
        icon="calendar-today"
        class="is-rounded"
        id="dateStart"
        :date-formatter="formatDate"
        v-bind:class="{ is_selected: timestampStartIsSelected }"
        v-model="dateFilters.timestampStart"
        editable
      >
        <button
          class="button is-danger"
          @click="dateFilters.timestampStart = null"
        >
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
        editable
      >
        <button class="button is-danger" @click="dateFilters.timestampEnd = null">
          <b-icon icon="close"></b-icon>
          <span>Clear</span>
        </button>
      </b-datepicker>
      <input
        class="input is-rounded"
        type="text"
        placeholder="Session ID"
        v-bind:class="{ is_selected: sessionidIsSelected }"
        v-model="filters.sessionid"
        @keyup.enter="onFilterInput"
      />
      <b-dropdown
        rounded
        multiple
        aria-role="list"
        placeholder="Checkpoint"
        v-model="filters.checkpoint"
        @change="selectChange"
      >
        <button v-bind:class="{ is_selected: checkpointIsSelected }" class="button is-rounded" type="button" slot="trigger">
          <span>Checkpoint ({{ filters.checkpoint.length }})</span>
          <b-icon icon="menu-down"></b-icon>
        </button>
        <b-dropdown-item value="REGISTER" aria-role="listitem">
          <span>Register</span>
        </b-dropdown-item>
        <b-dropdown-item value="LOGIN" aria-role="listitem">
          <span>Login</span>
        </b-dropdown-item>
        <b-dropdown-item value="ADD_PAYMENT_METHOD" aria-role="listitem">
          <span>Add Payment Method</span>
        </b-dropdown-item>
        <b-dropdown-item value="TRANSACTION" aria-role="listitem">
          <span>Transaction</span>
        </b-dropdown-item>
        <!--b-dropdown-item value="UPDATE_DETAILS" aria-role="listitem">
          <span>Update Details</span>
        </b-dropdown-item-->
        <!--b-dropdown-item value="GENERAL" aria-role="listitem">
          <span>General</span>
        </b-dropdown-item-->
      </b-dropdown>
      <input
        class="input is-rounded"
        type="text"
        placeholder="Min Amount"
        v-model="ranges.amountStart"
        v-bind:class="{ is_selected: amountStartIsSelected }"
        v-if="showAllFilters"
        @keyup.enter="onFilterInput"
      />
      <input
        class="input is-rounded"
        type="text"
        placeholder="Max Amount"
        v-model="ranges.amountEnd"
        v-bind:class="{ is_selected: amountEndIsSelected }"
        v-if="showAllFilters"
        @keyup.enter="onFilterInput"
      />
      <input
        class="input is-rounded"
        type="text"
        placeholder="Currency"
        v-bind:class="{ is_selected: currencyIsSelected }"
        v-model="filters.currency"
        v-if="showAllFilters"
        @keyup.enter="onFilterInput"
      />

      <input
        class="input is-rounded"
        type="text"
        placeholder="Request ID"
        v-bind:class="{ is_selected: requestidIsSelected }"
        v-model="filters.requestid"
        @keyup.enter="onFilterInput"
      />

      <input
        class="input is-rounded"
        type="text"
        placeholder="Destination"
        v-bind:class="{ is_selected: destinationIsSelected }"
        v-model="filters.destination"
        v-if="showAllFilters"
        @keyup.enter="onFilterInput"
      />

      <input
        class="input is-rounded"
        type="text"
        placeholder="Min Score"
        v-bind:class="{ is_selected: scoreStartIsSelected }"
        v-model="ranges.scoreStart"
        v-if="showAllFilters"
        @keyup.enter="onFilterInput"
      />
      <input
        class="input is-rounded"
        type="text"
        placeholder="Max Score"
        v-bind:class="{ is_selected: scoreEndIsSelected }"
        v-model="ranges.scoreEnd"
        v-if="showAllFilters"
        @keyup.enter="onFilterInput"
      />

      <b-dropdown
        rounded
        multiple
        aria-role="list"
        placeholder="Status"
        v-model="filters.status"
        @change="selectChange"
      >
        <button   v-bind:class="{ is_selected: statusIsSelected }" class="button is-rounded" type="button" slot="trigger">
          <span>Status ({{ filters.status.length }})</span>
          <b-icon icon="menu-down"></b-icon>
        </button>
        <b-dropdown-item value="APPROVED" aria-role="listitem">
          <span>Approved</span>
        </b-dropdown-item>
        <b-dropdown-item value="DENIED" aria-role="listitem">
          <span>Denied</span>
        </b-dropdown-item>
        <b-dropdown-item value="CANCELLED" aria-role="listitem">
          <span>Cancelled</span>
        </b-dropdown-item>
      </b-dropdown>
    </div>
    <!--https://iconify.design/icon-sets/mdi/-->
    <div style="margin-bottom: 10px">
      <button @click="onFilterInput" class="deep-blue button is-rounded" type="button" slot="trigger">
        <b-icon icon="check"></b-icon>
        <span>Apply</span>
      </button>
      <button @click="clearFilters" class="light-blue button is-rounded" type="button" slot="trigger">
        <b-icon icon="delete"></b-icon>
        <span>Clear</span>
      </button>
      <button @click="apply" style="float: right;" class="deep-blue button is-rounded" type="button" slot="trigger">
        <b-icon icon="refresh"></b-icon>
        <span>Refresh</span>
      </button>
      <button @click="downloadCsv" style="float: right;" class="deep-blue button is-rounded" type="button" slot="trigger">
        <b-icon icon="download"></b-icon>
        <span>Export</span>
      </button>
    </div>
    <b-table
      v-bind:class="{ home: home }"
      :selected="items.find((item) => item.requestid == $route.params.requestid)"
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
        <b-table-column label="Severity" field="severity" sortable>
          <b-tag class="capitalize" rounded :type="getSeverityTag(props.row.severity)">{{ props.row.severity | severityFilter}}</b-tag>
        </b-table-column>
        <b-table-column :visible="home" label="Score" field="score" sortable>{{ props.row.score | scoreFormat }}</b-table-column>
        <b-table-column
          label="Date"
          field="timestamp"
          sortable
        >{{ props.row.timestamp | dateFilter }}
        </b-table-column>
        <b-table-column style="max-width: 150px; word-break: break-word;" label="Session" field="sessionid" sortable>{{ props.row.sessionid }}
        </b-table-column>
        <b-table-column style="max-width: 150px; word-break: break-word;"  label="Request" field="requestid" sortable>
            <a @mouseover="paintRaw = true" @mouseleave="paintRaw = false" class="role-columns" @click="rowClick(props.row.requestid)">{{ props.row.requestid }}
            </a>
        </b-table-column>
        <b-table-column  label="Customer" field="userid" sortable>{{ props.row.userid }}
        </b-table-column>
        <b-table-column class="capitalize" label="Checkpoint" field="checkpoint" sortable>{{ props.row.checkpoint | severityFilter }}
        </b-table-column>
        <b-table-column :visible="home" label="Amount" field="amount" sortable>{{ props.row.amount | amountFilter}}
        </b-table-column>
        <b-table-column :visible="home" label="Currency" field="currency" sortable>{{ props.row.currency }}
        </b-table-column>
        <b-table-column :visible="home" label="Destination" field="destination" sortable>{{ props.row.destination}}
        </b-table-column>
        <b-table-column :visible="home" label="Status" field="status" sortable>{{ props.row.status }}
        </b-table-column>
      </template>
    </b-table>
    <div class="event-list-detail-sidebar">
      <portal to="home" v-if="!home">
        <SideBar :items="itemsDetail" v-on:changeHomeStatus="home = !home" :rootLevelItems="rootLevelItemsDetail"/>
      </portal>
      <ModalForm v-bind:isImageModalActive="modalActive" v-bind:infoModalMessage="infoModalMessage"></ModalForm>
    </div>
  </div>
</template>
<script>
  import Vue from "vue"
  import SideBar from "@/components/SideBar.vue"
  import ModalForm from "@/components/Modal.vue"
  import PortalVue from 'portal-vue'
  import $ from 'jquery'
  Vue.use(PortalVue);

  export default {
    name: "events",

    data() {
      return {
        customer:process.env.VUE_APP_CUSTOMER,
        modalActive : false,
        infoModalMessage : "",
        toBeCleard:false,
        paintRaw: false,
        home: true,
        scoreStartIsSelected: false,
        scoreEndIsSelected: false,
        timestampStartIsSelected: false,
        timestampEndIsSelected: false,
        sessionidIsSelected: false,
        requestidIsSelected: false,
        checkpointIsSelected: false,
        amountStartIsSelected: false,
        amountEndIsSelected	: false,
        currencyIsSelected: false,
        destinationIsSelected: false,
        useridIsSelected: false,
        deviceidIsSelected: false,
        statusIsSelected: false,
        severityIsSelected: false,
        desserts: [],
        showAllFilters: false,
        items: [],
        itemsDetail: [],
        rootLevelItemsDetail: [],
        loading: false,
        options: {
          totalItems: 0,
          itemsPerPage: "",
          sortField: "timestamp",
          sortOrder: "desc",
          defaultSortOrder: "desc",
          page: 1,
          perPage: 20
        },
        filters: {
          severity: [],
          status: [],
          checkpoint: []
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
      SideBar,
      ModalForm
    },
    props: ["id"],
    mounted() {
      if(this.$route.params.requestid){
        this.getEventById(this.$route.params.requestid);
        this.home = false;
      }else{
        this.home = true;
      }
      this.getData();
      this.getClientPortalInfo() ;
    },
    watch: {
      $route (to){
        if(to.params.requestid){
          this.getEventById(to.params.requestid);
          this.home = false;
        }else{
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
        let month = dt.getMonth() + 1  < 10 ? "0" + (dt.getUTCMonth() + 1) : (dt.getUTCMonth() + 1)
        let days = dt.getUTCDate() < 10 ? "0" + dt.getUTCDate() : dt.getUTCDate()
        let hours = dt.getUTCHours() < 10 ? "0" + dt.getUTCHours() : dt.getUTCHours()
        let minutes = dt.getUTCMinutes() < 10 ? "0" + dt.getUTCMinutes() : dt.getUTCMinutes()
        return (
          days + "/" + month + "/" + dt.getFullYear() + " " + hours + ":" + minutes
        )
      },
     severityFilter(value){
        if (!value) return "";
        let newVal = value ;
        if(newVal.includes("_")){
          newVal = newVal.replace(/_/g, ' ');
        }
        return   newVal ;
      },
      scoreFormat(value){
        let Stringvalue = String(value);
        if (Stringvalue.includes('.')){
          value = value.toFixed(2);
        }

        return value
      },
      amountFilter(value){
        if (!value) return "";
        let Stringvalue = String(value);
        let decimalSplit = Stringvalue.split('.')

        if(decimalSplit.length > 0) {
          value = value.toFixed(2);
        }
        else {
          value = Stringvalue+".00" ;
        }
        return value
      }
    },

    methods: {
      getClientPortalInfo(){
        console.log('\n');
        console.log("%c Client-Portal Information:" , 'color: #8dc63f; font-size: 20px');
        console.log('%c Version: ' + localStorage.getItem('VERSION') ,'color: #8dc63f') ;
        console.log('%c Release Date:' + localStorage.getItem('VERSION_RELEASE_DATE') ,'color: #8dc63f') ;
        console.log('%c Client: ' + this.customer ,'color: #8dc63f') ;
        console.log('%c Logged In User : ' + localStorage.user ,'color: #8dc63f') ;
        console.log('\n');
        },

      downloadCsv(){
        this.modalActive = false ;
        this.loading = true
        let params = {}
        let sortBy = {}
        sortBy[this.options.sortField] = this.options.sortOrder

        for (const property in this.dateFilters) {
          let newVal = ""
          if (this.dateFilters[property]) {
            let dt ;
            if (property =='timestampEnd'){
              dt = new Date(this.dateFilters[property])
              dt.setDate(dt.getDate() + 1);
            }
            else{
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

        this.$http.get('download-csv', {params: params}).then(response =>{
          this.modalActive = false ;
          if(!response || !response.data) {
            this.downloadCsv() ;
            return ;
          }

          var fileURL = window.URL.createObjectURL(new Blob([response.data]));
          var fileLink = document.createElement('a');

          fileLink.href = fileURL;
          fileLink.setAttribute('download', 'risk-events.csv');
          document.body.appendChild(fileLink);

          fileLink.click();
        }).catch(error => {
          if (error.response.status==409) {
             this.infoModalMessage = error.response.data ;
              this.modalActive = true ;
          }
          else if(error.response.status==401){
            this.$store.dispatch("logout").then(() => {
              this.$router.push("/login")
            })
          }
          this.errored = true
        }).finally(()=> {
          this.loading = false
        })
      },
      formatDate(value){
        if (!value) return ""
        let dt = new Date(value)
        let month = dt.getMonth() + 1
        let days = dt.getDate()
        return (
          days + "/" + month + "/" + dt.getFullYear()
        )
      },
     colorAppliedFilters(params){
       this.scoreStartIsSelected = false
       this.scoreEndIsSelected = false
       this.timestampStartIsSelected = false
       this.timestampEndIsSelected = false
       this.sessionidIsSelected = false
       this.requestidIsSelected = false
       this.checkpointIsSelected = false
       this.amountStartIsSelected = false
       this.amountEndIsSelected = false
       this.currencyIsSelected = false
       this.destinationIsSelected = false
       this.useridIsSelected = false
       this.deviceidIsSelected = false
       this.statusIsSelected = false
       this.severityIsSelected = false
       $('#dateStart').removeClass('is_selected')
       $('#dateEnd').removeClass('is_selected')

       let filters = params.filters
       let ranges =  params.ranges

        if(filters.severity.length > 0) this.severityIsSelected=true
        if(filters.status.length > 0) this.statusIsSelected = true
        if(filters.checkpoint.length > 0) this.checkpointIsSelected = true

       if(filters.currency) this.currencyIsSelected=true
       if(filters.destination) this.destinationIsSelected=true
       if(filters.userid) this.useridIsSelected=true
       if(filters.deviceid) this.deviceidIsSelected=true
       if(filters.sessionid) this.sessionidIsSelected=true
       if(filters.requestid) this.requestidIsSelected=true



       if(ranges.scoreStart)  this.scoreStartIsSelected=true
       if(ranges.amountEnd)  this.amountEndIsSelected=true
       if(ranges.scoreEnd)  this.scoreEndIsSelected=true
       if(ranges.timestampStart)  $('#dateStart').addClass('is_selected')
       if(ranges.timestampEnd) $('#dateEnd').addClass('is_selected')
       if(ranges.amountStart)  this.amountStartIsSelected=true


      },
      getEventById(id) {
        this.loading = true;
        this.$http
          .get("risk-events/" + id)
          .then(response => {
            this.rootLevelItemsDetail = []
            this.itemsDetail = []
            for (const property in response.data) {
              if (typeof response.data[property] === "object") {
                this.itemsDetail.push({
                  label: property,
                  items: response.data[property]
                })
              } else {
                this.rootLevelItemsDetail.push({
                  label: property,
                  value: response.data[property]
                })
              }
            }
          })
          .catch(error => {
            console.log(error)
            if(error.response.status==401){
              this.$store.dispatch("logout").then(() => {
                this.$router.push("/login")
              })
            }
            this.errored = true
          })
          .finally(() => (this.loading = false))
      },
      getData() {
        this.modalActive = false ;
        this.loading = true
        let params = {}
        let sortBy = {}
        sortBy[this.options.sortField] = this.options.sortOrder

        for (const property in this.dateFilters) {
          let newVal = ""
          if (this.dateFilters[property]) {
            let dt ;
            if (property =='timestampEnd'){
              dt = new Date(this.dateFilters[property])
              dt.setDate(dt.getDate() + 1);
            }
          else{
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
          .get("risk-events", {params: params})
          .then(response => {
            this.items = response.data.data
            this.options.totalItems = parseInt(response.data.pagination.total)
            this.options.itemsPerPage = parseInt(response.data.pagination.perPage)
            this.options.page = parseInt(response.data.pagination.currentPage)
            this.toBeCleard= false;
          })
          .catch(error => {
            console.log(error)
            if(error.response.status==401){
              this.$store.dispatch("logout").then(() => {
                this.$router.push("/login")
              })
            }
            this.errored = true
          })
          .finally(() => {
            this.loading = false
            if(this.$route.matched[1].name=='eventsDetails'){
              let sideBarElement = $('.vue-portal-target') ;
              sideBarElement.css('position', 'flex') ;
              let bTableElement = $('.b-table') ;
              bTableElement.css('height','600px');
            }
            else{
              let sideBarElement = $('.vue-portal-target') ;
              sideBarElement.css('position', 'inherit') ;
              let bTableElement = $('.b-table') ;
              bTableElement.css('height','auto');
            }
          })
      },
      apply(){
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]') ;
        if (page1){page1.click()}
        this.getData();
      },
      clearFilters(){
        localStorage.removeItem('cameFromELD') ;
        localStorage.removeItem('filters') ;
        localStorage.removeItem('ranges');
        localStorage.removeItem('sortBy');
        localStorage.removeItem('timestampStart');
        localStorage.removeItem('timestampEnd');

        this.dateFilters = {},
        this.filters = {
          severity: [],
            status: [],
            checkpoint: []
        },
        this.ranges = {},
        this.toBeCleard= true;
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]') ;
        if (page1){page1.click()}
        this.getData()
      },
      getSeverityTag(severity) {
        if (severity === "LOW") return "is-success"
        if (severity === "MEDIUM") return "is-warning"
        if (severity === "HIGH") return "is-danger"
        if (severity === "VERY_HIGH") return "is-danger"
        if (severity === "FAIL") return "is-info"
        if (severity === "EXPIRED") return "is-info"
        return "is-info"
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
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]') ;
        if (page1){page1.click()}
        this.getData()
      },
      selectChange() {
        this.modalActive = false ;
        if (this.timeout) clearTimeout(this.timeout)
        this.timeout = setTimeout(() => {
          this.getData()
        }, 500)
      },
      rowClick(requestid) {
        this.modalActive = false ;
        let sideBarElement = $('.vue-portal-target') ;
        sideBarElement.css('position', 'fixed') ;
        let bTableElement = $('.b-table') ;
        bTableElement.css('height','600px');
        this.home = false;
        this.$router.replace({
          name: "eventsDetails",
          params: {requestid: requestid}
        }).catch(error => {
          if(error.response.status==401){
            this.$store.dispatch("logout").then(() => {
              this.$router.push("/login")
            })
          }
          return error+1})
      },
      returnToEvents(){
        this.$router.push({name: 'home'})
        .catch(err => err+1)
      }

    }
  }
</script>
