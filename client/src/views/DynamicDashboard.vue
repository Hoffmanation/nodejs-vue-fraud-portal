<template>

  <div class="main-content-dashboard" style="overflow: auto;">
    <div class="title" v-bind:class="{eventsTitle: !home}"><img class="back-events" v-if="!home"
                                                                v-bind:src="'/'+customer+'/icons/chevron_left.svg'">
      <h1 class="page-title">Reports</h1></div>
    <div class="filters-wrapper">
      <h2 class="dynamic-page-subtitle">
        <b-tooltip :label="(showAllFilters ? 'Collapse':'Expand') + ' filters'">
          <b-icon
            :icon="showAllFilters ? 'arrow-collapse-horizontal' : 'arrow-expand-horizontal'"
            @click.native="showAllFilters=!showAllFilters"
          ></b-icon>
        </b-tooltip>
        Filters:
      </h2>

      <!--    Filters Start  -->
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
        placeholder="Min Score"
        v-bind:class="{ is_selected: scoreStartIsSelected }"
        v-model="ranges.scoreStart"
        @keyup.enter="onFilterInput"
      />
      <input
        class="input is-rounded"
        type="text"
        placeholder="Max Score"
        v-bind:class="{ is_selected: scoreEndIsSelected }"
        v-model="ranges.scoreEnd"
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
        <button v-bind:class="{ is_selected: statusIsSelected }" class="button is-rounded" type="button" slot="trigger">
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
      <!--    Filters End -->
      <br>
      <br>
      <br>
      <br>

      <!--    Charts   -->
      <!--First Row - Current 24-hours Suspicious Activity -->
      <div class="dynamic-grey-box">
        <strong style="color: #8898AA;">Suspicious Activity </strong>
      </div>

      <div  ref="element" class="gauge-row">

        <div v-bind:class="{loader:todaysSuspiciousCustomersLoader}"></div>
        <div id="todaysSuspiciousCustomers" class="dynamic-gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousCustomersLoader}">
          <h2 class="dynamic-page-subtitle dynamic-gauge-box-text"> Suspicious Customers</h2>
          <p class="gauge-box-number"> {{ todaysSuspiciousCustomers }}</p>
        </div>

        <div style="left: 35%;"
             v-bind:class="{loader:todaysSuspiciousCustomersPercentLoader}"></div>
        <div id="todaysSuspiciousCustomersPercent" class="dynamic-gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousCustomersPercentLoader}">
          <h2 class="dynamic-page-subtitle dynamic-gauge-box-text">
            <strong class="gauge-box-text-middel">{{ todaysSuspiciousCustomersPercent }}% </strong>Of Active Customers
          </h2>
          <hr class="gauge-box-vertical-line">
          <p style="text-align: center; margin-top: -4%;"> Current Active Customers {{todaysCustomers }}</p>
        </div>

        <div style="left: 60%;" v-bind:class="{loader:todaysSuspiciousTransactionPercentLoader}"></div>
        <div id="todaysSuspiciousTransactionPercent" class="dynamic-gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousTransactionPercentLoader}">
          <h2 class="dynamic-page-subtitle dynamic-gauge-box-text"> High Risk (transaction)</h2>
          <p class="gauge-box-number"><strong style="font-size: 34px;"  class="gauge-box-text-middel"> {{todaysSuspiciousTransactionPercent }}%</strong></p>
        </div>

        <div style="left: 85%;" v-bind:class="{loader:todaysSuspiciousAmountPercentLoader}"></div>
        <div id="todaysSuspiciousAmountPercent" class="dynamic-gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousAmountPercentLoader}">
          <h2 class="dynamic-page-subtitle dynamic-gauge-box-text"> High Risk ({{currency}} {{currencySymbol}})</h2>
          <p class="gauge-box-number"><strong style="font-size: 34px;"  class="gauge-box-text-middel"> {{todaysSuspiciousAmountPercent }}%</strong></p>
        </div>
      </div>

      <!--Second Row - Current 24-hours Trends -->
      <div class="dynamic-grey-box">
        <strong style="color: #8898AA;">Trends </strong>
      </div>

      <div class="gauge-row">
        <div style="left: 13%; top: 34%;"></div>
        <div id="todaysTransactionsBySeverityData" class="dynamic-gauge-box-middle">
          <h2 class="dynamic-page-subtitle dynamic-gauge-box-text" style="margin-top: 19px;">Transaction By Severity</h2>
          <!--Start Donut chart-->
          <pie-chart :chartData="todaysTransactionsBySeverityData"  :data="todaysTransactionsBySeverityData" :styles="pieStyle"  v-if="!todaysTransactionsBySeverityDataLoader"></pie-chart>
          <!--End Donut chart-->
        </div>

        <div style="left: 47%; top: 34%;"></div>
        <div id="todaysAmountsBySeverityData" class="dynamic-gauge-box-middle">
          <h2 class="dynamic-page-subtitle dynamic-gauge-box-text" style="margin-top: 19px;"> Amount By Severity</h2>
          <!--Start Donut chart-->
          <pie-chart :chartData="todaysAmountsBySeverityData" :data="todaysAmountsBySeverityData" :styles="pieStyle" v-if="!todaysAmountsBySeverityDataLoader"></pie-chart>
          <!--End Donut chart-->
        </div>

        <div style="left: 82%; top: 35%;"></div>
        <div id="todaysRequestsByCheckpointData" class="dynamic-gauge-box-middle">
          <h2 class="dynamic-page-subtitle dynamic-gauge-box-text" style="margin-top: 19px;">
            Requests</h2>
          <!--Start bar chart-->
          <bar-chart :chartData="todaysRequestsByCheckpointData" :data="todaysRequestsByCheckpointData" :styles="Bartyle" v-if="!todaysRequestsByCheckpointDataLoader"></bar-chart>
          <!--End bar chart-->
        </div>
      </div>
      <!-- Charts End -->


    </div>
  </div>


</template>
<script>

  import PieChart from "@/charts/PieChart.js";

  import BarChart from "@/charts/BarChart.js";
  import $ from 'jquery'
  import Vue from "vue";

  export default {
    name: "dashboard",
    data() {
      return {
        /**
         * Env var and global var's to be used by the page
         */
        //Custom Customer environment variable
        customer: process.env.VUE_APP_CUSTOMER,
        currencySymbol: "",
        currency: "",

        //xportal checkpoint Colors cache
        checkpointColors: {
          Register: "#282766",
          Login: "#23d160",
          General: "#8DC63F",
          Add_Payment_Method: "#ffdd57",
          Transaction: "#ff3860"
        },


        /**
         * "Today's" data var's
         */
        //Todays Suspicious Activity
        todaysSuspiciousCustomers: "",
        todaysSuspiciousCustomersPercent: "",
        todaysCustomers: "",
        todaysSuspiciousTransactionPercent: "",
        todaysSuspiciousAmountPercent: "",

        //Todays Trends
        todaysVeryHighSeverityTransactions: 1,
        todaysMediumSeverityTransactions: 1,
        todaysLowSeverityTransactions: 1,
        todaysVeryHighSeverityAmounts: 1,
        todaysMediumSeverityAmounts: 1,
        todaysLowSeverityAmounts: 1,

        //Todays Gauge Components
        todaysTransactionsBySeverityData: null,
        todaysAmountsBySeverityData: null,
        todaysRequestsByCheckpointData: null,

        //Todays css Loaders
        todaysSuspiciousCustomersLoader: false,
        todaysSuspiciousCustomersPercentLoader: false,
        todaysCustomersLoader: false,
        todaysSuspiciousTransactionPercentLoader: false,
        todaysSuspiciousAmountPercentLoader: false,
        todaysVeryHighSeverityTransactionsLoader: false,
        todaysMediumSeverityTransactionsLoader: false,
        todaysLowSeverityTransactionsLoader: false,
        todaysVeryHighSeverityAmountsLoader: false,
        todaysMediumSeverityAmountsLoader: false,
        todaysLowSeverityAmountsLoader: false,
        todaysTransactionsBySeverityDataLoader: true,
        todaysAmountsBySeverityDataLoader: true,
        todaysRequestsByCheckpointDataLoader: true,

        //Other variables used by the dashboard filter
        home: true,
        showAllFilters: false,
        isFullPage: false,
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
        sortBy: {},
        scoreStartIsSelected: false,
        scoreEndIsSelected: false,
        timestampStartIsSelected: false,
        timestampEndIsSelected: false,
        sessionidIsSelected: false,
        requestidIsSelected: false,
        checkpointIsSelected: false,
        amountStartIsSelected: false,
        amountEndIsSelected: false,
        currencyIsSelected: false,
        destinationIsSelected: false,
        useridIsSelected: false,
        statusIsSelected: false,
        severityIsSelected: false,
      }
    },

    components: {
      PieChart, BarChart
    },

    watch: {},

    model: {
      prop: 'home',
      event: 'onChangeHomeStatus'
    },

    filters: {},

    computed: {
      /**
       * Custom styling for vue-chartjs components
       */
      donutStyle() {
        return {
          position: 'relative',
          margin: 'auto',
          marginTop: '-4%',
          height: '22vh',
          width: '30vw'
        }
      },
      pieStyle() {
        return {
          position: 'relative',
          margin: 'auto',
          marginTop: '-2%',
          height: '15vh',
          width: '12vw'
        }
      },
      Bartyle() {
        return {
          position: 'relative',
          margin: 'auto',
          marginTop: '-2%',
          height: '25vh',
          width: '25vw'
        }
      }
    },

    mounted() {
      /**
       *On page load call functions.
       */
      this.getCurrencySymbol(),
      this.getData()
    },

    methods: {

      /**
       * function that in case thers no data return from the API call will remove
       * everything from the data box and will append 'No Available Data'
       * @param boxId
       */
      appendNoData(boxId) {
        $("#" + boxId).empty();
        $("#" + boxId).append("<h1 class=\"no-data\">No Available Data</h1>")
      },

      /**
       * Get Customer Currency and Currency Symbol Env var's
       */
      getCurrencySymbol() {
        this.$http.get("get-currency-symbol")
          .then(response => {
            this.currencySymbol = response.data.currencySymbol,
              this.currency = response.data.currency
          })
          .catch(error => {
            console.log(error)
            if (error.response.status == 401) {
              this.$store.dispatch("logout").then(() => {
                this.$router.push("/login")
              })
            }
          })
          .finally(() => (this.isLoading = false))
      },

      /**
       * When calling the getData() function from dropdown menu
       */
      selectChange() {
        if (this.timeout) clearTimeout(this.timeout)
        this.timeout = setTimeout(() => {
          this.getData()
        }, 500)
      },

      /**
       * Clean the screen in case no filter was chosen by the user
       */
      noFiltersChosen(params){
        return params.filters.checkpoint.length==0 && params.filters.severity.length==0 && params.filters.status.length==0 && Object.keys(params.ranges).length === 0  ;
      },

      /**
       * color the applied filters chosen by the user
       * @param params
       */
      colorAppliedFilters(params) {
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
        this.statusIsSelected = false
        this.severityIsSelected = false
        $('#dateStart').removeClass('is_selected')
        $('#dateEnd').removeClass('is_selected')
        let filters = params.filters
        let ranges = params.ranges
        if (filters.severity.length > 0) this.severityIsSelected = true
        if (filters.status.length > 0) this.statusIsSelected = true
        if (filters.checkpoint.length > 0) this.checkpointIsSelected = true
        if (filters.currency) this.currencyIsSelected = true
        if (filters.destination) this.destinationIsSelected = true
        if (filters.userid) this.useridIsSelected = true
        if (filters.sessionid) this.sessionidIsSelected = true
        if (filters.requestid) this.requestidIsSelected = true
        if (ranges.scoreStart) this.scoreStartIsSelected = true
        if (ranges.amountEnd) this.amountEndIsSelected = true
        if (ranges.scoreEnd) this.scoreEndIsSelected = true
        if (ranges.timestampStart) $('#dateStart').addClass('is_selected')
        if (ranges.timestampEnd) $('#dateEnd').addClass('is_selected')
        if (ranges.amountStart) this.amountStartIsSelected = true
      },

      /**
       *
       * Format the Date which displayed in the ui
       * @param value
       * @returns {string}
       */
      formatDate(value) {
        if (!value) return ""
        let dt = new Date(value)
        let month = dt.getMonth() + 1
        let days = dt.getDate()
        return (
          days + "/" + month + "/" + dt.getFullYear()
        )
      },

      /**
       * When clicking on the 'Apply' button
       */
      onFilterInput() {
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]');
        if (page1) {
          page1.click()
        }
        this.getData()
      },

      /**
       * Clear all saved filters
       */
      clearFilters() {
        //Clear page Variables
          this.$forceUpdate();
          this.dateFilters = {},
          this.filters = {
            severity: [],
            status: [],
            checkpoint: []
          },
          this.ranges = {},

          this.todaysSuspiciousCustomers= "";
          this.todaysSuspiciousCustomersPercent= "";
          this.todaysCustomers= "";
          this.todaysSuspiciousTransactionPercent= "";
          this.todaysSuspiciousAmountPercent= "";

          //Clear Today's Trends
          this.todaysVeryHighSeverityTransactions= 1;
          this.todaysMediumSeverityTransactions= 1;
          this.todaysLowSeverityTransactions= 1;
          this.todaysVeryHighSeverityAmounts= 1;
          this.todaysMediumSeverityAmounts= 1;
          this.todaysLowSeverityAmounts= 1;

        //Clear Today's Gauge Components
        this.todaysRequestsByCheckpointData = {
          labels: ['Register', 'Login', 'General', 'Add Payment Method', 'Transaction'],
          datasets: [{
            label: 'Data One',
            backgroundColor: ["#282766", "#00e3d0", "#8DC63F", "#db6b09", "#e30000"],
            pointBackgroundColor: 'white',
            borderWidth: 2,
            pointBorderColor: '#249EBF',
            data: [0,0,0,0,0]
          }]
        }

        this.todaysTransactionsBySeverityData = {
          labels: ['Very High', 'Medium', 'Low'],
          datasets: [{
            label: 'TransactionsBySeverity',
            backgroundColor: [this.checkpointColors.Transaction, this.checkpointColors.Add_Payment_Method, this.checkpointColors.General],
            data: [0,0,0]
          }]
        }

        this.todaysAmountsBySeverityData = {
          hoverBackgroundColor: "red",
          hoverBorderWidth: 10,
          labels: ["Very High", "Medium", "Low"],
          datasets: [{
            label: "AmountsBySeverity",
            backgroundColor: [this.checkpointColors.Transaction, this.checkpointColors.Add_Payment_Method, this.checkpointColors.General],
            data: [0,0,0]
          }]
        }

        this.getData();

      },

      /**
       * When clicking on the 'Refresh' button
       */
      apply() {
        let page1 = document.querySelector('a[aria-label="Page 1."][class="pagination-link"]');
        if (page1) {
          page1.click()
        }
        this.getData();
      },

      /**
       * Main Data function - will retrieve data from the backend based on the user criteria filters
       */
      getData() {
        console.log('\n');
        console.log("%c Dynamic Dashboard Information:" , 'color: #00e3d0; font-size: 20px');

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

        //Uncomment the below In case client dont want the default entry view (data from last 24 hours)
        /* if (this.noFiltersChosen(params)) {
            this.clearFilters() ;
            return ;
        }*/

        const loadingComponent = this.$buefy.loading.open({
          container: this.isFullPage ? null : this.$refs.element
        })

        this.$http
          .get("risk-events-dynamic-dashboard", {params: params})
          .then(response => {

            //First row - Suspicious Activity
            this.todaysSuspiciousCustomers = response.data['todaysSuspiciousCustomers']|| 0 ;
            this.todaysCustomers = response.data['todaysCustomers'] || 0;
            this.todaysSuspiciousCustomersPercent = response.data['todaysSuspiciousCustomersPercent'] || 0;
            this.todaysSuspiciousCustomersPercent = this.todaysSuspiciousCustomersPercent.toFixed(2);

            console.log("%c Current 24 Hours - Suspicious Customers ---> " + this.todaysSuspiciousCustomers  , 'color: #00e3d0');
            console.log("%c Current 24 Hours - Current Active Customers ---> " + this.todaysCustomers  , 'color: #00e3d0');
            console.log("%c Current 24 Hours - Of Active Customers ---> " + this.todaysSuspiciousCustomersPercent +" %" , 'color: #00e3d0');

            this.todaysSuspiciousCustomersPercentLoader = false;
            this.todaysSuspiciousCustomersLoader = false;
            this.todaysCustomersLoader = false;


            //In case there were no customers today - append 'No Data' to gauge boxes
            // if(this.todaysCustomers==0){
            //   this.appendNoData('todaysSuspiciousCustomers')
            //   this.appendNoData('todaysSuspiciousCustomersPercent')
            //   this.appendNoData('todaysSuspiciousTransactionPercent')
            //   this.appendNoData('todaysSuspiciousAmountPercent')
            // }


            this.todaysSuspiciousTransactionPercent = response.data['todaysSuspiciousTransactionPercent'] || 0
            this.todaysSuspiciousTransactionPercent = this.todaysSuspiciousTransactionPercent.toFixed(2);
            this.todaysSuspiciousTransactionPercentLoader = false;
            console.log("%c Current 24 Hours - High Risk (transaction) ---> " + this.todaysSuspiciousTransactionPercent + ' %' , 'color: #00e3d0');
            //if(this.todaysSuspiciousTransactionPercent==0){this.appendNoData('todaysSuspiciousTransactionPercent')}


            this.todaysSuspiciousAmountPercent = response.data['todaysSuspiciousAmountPercent'] || 0
            this.todaysSuspiciousAmountPercent = this.todaysSuspiciousAmountPercent.toFixed(2);
            this.todaysSuspiciousAmountPercentLoader = false;
            console.log("%c Current 24 Hours - High Risk ("+ this.currency + " " +this.currencySymbol+") ---> " + this.todaysSuspiciousAmountPercent + ' %' , 'color: #00e3d0');
            //if(this.todaysSuspiciousAmountPercent==0){this.appendNoData('todaysSuspiciousAmountPercent')}


            //Second row - Trends
            this.todaysVeryHighSeverityTransactions = response.data.todaysVeryHighSeverityTransactions;
            this.todaysMediumSeverityTransactions = response.data.todaysMediumSeverityTransactions;
            this.todaysLowSeverityTransactions = response.data.todaysLowSeverityTransactions;
            //if(this.todaysVeryHighSeverityTransactions===0 && this.todaysMediumSeverityTransactions===0 && this. todaysLowSeverityTransactions===0){this.appendNoData('todaysTransactionsBySeverityData')}
            this.todaysTransactionsBySeverityData = {
              labels: ['Very High', 'Medium', 'Low'],
              datasets: [{
                label: 'TransactionsBySeverity',
                backgroundColor: [this.checkpointColors.Transaction, this.checkpointColors.Add_Payment_Method, this.checkpointColors.General],
                data: [this.todaysVeryHighSeverityTransactions, this.todaysMediumSeverityTransactions, this.todaysLowSeverityTransactions]
              }]
            }
            this.todaysTransactionsBySeverityDataLoader = false;
            console.log("%c Current 24 Hours - Transactions By Severity ---> " + this.logSeverity(this.todaysTransactionsBySeverityData),'color: #00e3d0') ;


            this.todaysVeryHighSeverityAmounts = response.data.todaysVeryHighSeverityAmounts || 0
            this.todaysMediumSeverityAmounts = response.data.todaysMediumSeverityAmounts || 0
            this.todaysLowSeverityAmounts = response.data.todaysLowSeverityAmounts || 0
            //if(this.todaysVeryHighSeverityAmounts==0 && this.todaysMediumSeverityAmounts==0 && this. todaysLowSeverityAmounts==0){this.appendNoData('todaysAmountsBySeverityData')}
            this.todaysAmountsBySeverityData = {
              currencySymbol: this.currencySymbol,
              hoverBackgroundColor: "red",
              hoverBorderWidth: 10,
              labels: ["Very High", "Medium", "Low"],
              datasets: [{
                label: "AmountsBySeverity",
                backgroundColor: [this.checkpointColors.Transaction, this.checkpointColors.Add_Payment_Method, this.checkpointColors.General],
                data: [this.todaysVeryHighSeverityAmounts, this.todaysMediumSeverityAmounts, this.todaysLowSeverityAmounts]
              }]
            }

            this.todaysAmountsBySeverityDataLoader = false;
            console.log("%c Current 24 Hours - Amount By Severity ---> " + this.logSeverity(this.todaysAmountsBySeverityData),'color: #00e3d0') ;

            this.todaysRegistersData = response.data.todaysRegistersData  || 0;
            this.todaysLoginsData = response.data.todaysLoginsData || 0;
            this.todaysGeneralsData = response.data.todaysGeneralsData || 0;
            this.todaysAddPaymentMethodsData = response.data.todaysAddPaymentMethodsData || 0;
            this.todaysTransactionsData = response.data.todaysTransactionsData || 0;
            //if (this.todaysRegistersData == 0 && this.todaysLoginsData == 0 && this.todaysGeneralsData == 0 && this.todaysTransactionsData == 0) {this.appendNoData('todaysRequestsByCheckpointData')}
            this.todaysRequestsByCheckpointData = {
              labels: ['Register', 'Login', 'General', 'Add Payment Method', 'Transaction'],
              datasets: [{
                label: 'Data One',
                backgroundColor: ["#282766", "#00e3d0", "#8DC63F", "#db6b09", "#e30000"],
                pointBackgroundColor: 'white',
                borderWidth: 2,
                pointBorderColor: '#249EBF',
                data: [this.todaysRegistersData, this.todaysLoginsData, this.todaysGeneralsData, this.todaysAddPaymentMethodsData, this.todaysTransactionsData]
              }]
            }
            console.log("%c Current 24 Hours - Requests ---> " + this.logSeverity(this.todaysRequestsByCheckpointData),'color: #00e3d0') ;
            this.todaysRequestsByCheckpointDataLoader = false;
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
            loadingComponent.close() ;
          })
      },

      /**
       * Log the chart data (for monitor purposes)
       * @param data
       * @returns {string}
       */
      logSeverity(data){
        let transactionsBySeverityJson = {} ;
        for(let x =0 ; x<=data.labels.length ; x++){
          transactionsBySeverityJson[data.labels[x]] = data.datasets[0].data[x] ;
        }
        return JSON.stringify(transactionsBySeverityJson) ;
      }

    },

  }
</script>
