<template>
  <div class="main-content-dashboard" style="overflow: auto;">
    <div class="filters-wrapper" style="margin-top: 0px; margin-left: -3%;">

      <!--First Row - Current 24-hours Suspicious Activity -->
      <div class="grey-box">
        <strong class="white-text">Current 24-hours Suspicious Activity </strong>
      </div>

      <div class="gauge-row">
        <div v-bind:class="{loader:todaysSuspiciousCustomersLoader}"></div>
        <div id="todaysSuspiciousCustomers" class="gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousCustomersLoader}">
          <h2 class="page-subtitle gauge-box-text"> Suspicious Customers</h2>
          <p class="gauge-box-number"> {{ todaysSuspiciousCustomers }}</p>
        </div>

        <div style="left: 35%;" v-bind:class="{loader:todaysSuspiciousCustomersPercentLoader}"></div>
        <div id="todaysSuspiciousCustomersPercent" class="gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousCustomersPercentLoader}">
          <h2 class="page-subtitle gauge-box-text">
            <strong class="gauge-box-text-middel">{{ todaysSuspiciousCustomersPercent }}% </strong> Of Active Customers
          </h2>
          <hr class="gauge-box-vertical-line">
          <p style="text-align: center; margin-top: -4%;"> Current Active Customers   {{ todaysCustomers }}</p>
        </div>

        <div style="left: 60%;" v-bind:class="{loader:todaysSuspiciousTransactionPercentLoader}"></div>
        <div id="todaysSuspiciousTransactionPercent"  class="gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousTransactionPercentLoader}">
          <h2 class="page-subtitle gauge-box-text"> High Risk (transaction)</h2>
          <p class="gauge-box-number"> <strong style="font-size: 34px;" class="gauge-box-text-middel"> {{ todaysSuspiciousTransactionPercent }}%</strong></p>
        </div>

        <div style="left: 85%;" v-bind:class="{loader:todaysSuspiciousAmountPercentLoader}"></div>
        <div id="todaysSuspiciousAmountPercent" class="gauge-box" v-bind:class="{ coverSpin: todaysSuspiciousAmountPercentLoader}">
          <h2 class="page-subtitle gauge-box-text"> High Risk ({{currency}} {{currencySymbol}})</h2>
          <p class="gauge-box-number"><strong style="font-size: 34px;" class="gauge-box-text-middel"> {{ todaysSuspiciousAmountPercent }}%</strong></p>
        </div>
      </div>

      <!--Second Row - Current 24-hours Trends -->
      <div class="grey-box">
        <strong class="white-text">Current 24-hours Trends </strong>
      </div>

      <div class="gauge-row">
        <div style="left: 13%; top: 34%;" v-bind:class="{loader:todaysTransactionsBySeverityDataLoader}"></div>
        <div id="todaysTransactionsBySeverityData" class="gauge-box-middle" v-bind:class="{ coverSpin: todaysTransactionsBySeverityDataLoader}">
          <h2 class="page-subtitle gauge-box-text" style="margin-top: 19px;"> Transaction By Severity</h2>
          <!--Start Donut chart-->
          <pie-chart :chartData="todaysTransactionsBySeverityData" :data="todaysTransactionsBySeverityData" :styles="pieStyle"  v-if="!todaysTransactionsBySeverityDataLoader"></pie-chart>

          <!--End Donut chart-->
        </div>

        <div style="left: 47%; top: 34%;" v-bind:class="{loader:todaysAmountsBySeverityDataLoader}"></div>
        <div id="todaysAmountsBySeverityData" class="gauge-box-middle" v-bind:class="{ coverSpin: todaysAmountsBySeverityDataLoader}">
          <h2 class="page-subtitle gauge-box-text" style="margin-top: 19px;"> Amount By Severity</h2>
          <!--Start Donut chart-->
          <pie-chart :chartData="todaysAmountsBySeverityData" :data="todaysAmountsBySeverityData" :styles="pieStyle"  v-if="!todaysAmountsBySeverityDataLoader"></pie-chart>
          <!--End Donut chart-->

        </div>

        <div style="left: 82%; top: 35%;" v-bind:class="{loader:todaysRequestsByCheckpointDataLoader}"></div>
        <div id="todaysRequestsByCheckpointData" class="gauge-box-middle" v-bind:class="{ coverSpin: todaysRequestsByCheckpointDataLoader}">
            <h2 class="page-subtitle gauge-box-text" style="margin-top: 19px;"> Requests</h2>
          <!--Start bar chart-->
          <bar-chart :chartData="todaysRequestsByCheckpointData" :data="todaysRequestsByCheckpointData" :styles="Bartyle"  v-if="!todaysRequestsByCheckpointDataLoader"></bar-chart>
          <!--End bar chart-->
        </div>
      </div>

      <!--Third Row - Current 30 days Suspicious Activity -->
      <div class="grey-box">
        <strong class="white-text">Current 30 days Suspicious Activity </strong>
      </div>

      <div class="gauge-row">
        <div style="left: 10%; top: 58%;" v-bind:class="{loader:thisMonthSuspiciousCustomersLoader}"></div>
        <div class="gauge-box" v-bind:class="{ coverSpin: thisMonthSuspiciousCustomersLoader}">
          <h2 class="page-subtitle gauge-box-text"> Suspicious Customers</h2>
          <p class="gauge-box-number"> {{ thisMonthSuspiciousCustomers }}</p>
        </div>

        <div style="left: 35%; top: 58%;" v-bind:class="{loader:thisMonthSuspiciousCustomersPercentLoader}"></div>
        <div class="gauge-box" v-bind:class="{ coverSpin: thisMonthSuspiciousCustomersPercentLoader}">
          <h2  class="page-subtitle gauge-box-text">
            <strong class="gauge-box-text-middel">{{ thisMonthSuspiciousCustomersPercent }}% </strong> Of Active Customers
          </h2>
          <hr class="gauge-box-vertical-line">
          <p style="text-align: center; margin-top: -4%;"> Current Active Customers   {{ thisMonthCustomers }}</p>
        </div>

        <div style="left: 60%; top: 58%;" v-bind:class="{loader:thisMonthSuspiciousTransactionPercentLoader}"></div>
        <div class="gauge-box" v-bind:class="{ coverSpin: thisMonthSuspiciousTransactionPercentLoader}">
          <h2 class="page-subtitle gauge-box-text"> High Risk (transaction)</h2>
          <p class="gauge-box-number"> <strong style="font-size: 34px;" class="gauge-box-text-middel"> {{ thisMonthSuspiciousTransactionPercent }}%</strong></p>
        </div>

        <div style="left: 86%; top: 58%;" v-bind:class="{loader:thisMonthSuspiciousAmountPercentLoader}"></div>
        <div class="gauge-box" v-bind:class="{ coverSpin: thisMonthSuspiciousAmountPercentLoader}">
          <h2 class="page-subtitle gauge-box-text"> High Risk ({{currency}} {{currencySymbol}})</h2>
          <p class="gauge-box-number"><strong style="font-size: 34px;" class="gauge-box-text-middel"> {{ thisMonthSuspiciousAmountPercent }}%</strong></p>
        </div>
      </div>

      <!--Forth Row - Current 30 days Trends -->
      <div class="grey-box">
        <strong class="white-text">Current 30 days Trends</strong>
      </div>

      <div class="gauge-row">
        <div style="left: 13%; top: 83%;" v-bind:class="{loader:thisMonthTransactionsBySeverityDataLoader}"></div>
        <div class="gauge-box-middle" v-bind:class="{ coverSpin: thisMonthTransactionsBySeverityDataLoader}">
          <h2 class="page-subtitle gauge-box-text" style="margin-top: 19px;"> Transaction by Severity</h2>
          <!--Start Donut chart-->
          <pie-chart :chartData="thisMonthTransactionsBySeverityData" :data="thisMonthTransactionsBySeverityData" :styles="pieStyle"  v-if="!thisMonthTransactionsBySeverityDataLoader"></pie-chart>
          <!--End Donut chart-->
        </div>

        <div style="left: 47%; top: 83%;" v-bind:class="{loader:thisMonthAmountsBySeverityDataLoader}"></div>
        <div class="gauge-box-middle" v-bind:class="{ coverSpin: thisMonthAmountsBySeverityDataLoader}">
          <h2 class="page-subtitle gauge-box-text" style="margin-top: 19px;"> Amount By Severity</h2>
          <!--Start Donut chart-->
          <pie-chart :chartData="thisMonthAmountsBySeverityData" :data="thisMonthAmountsBySeverityData" :styles="pieStyle"  v-if="!thisMonthAmountsBySeverityDataLoader"></pie-chart>
          <!--End Donut chart-->
        </div>

        <div style="left: 82%; top: 83%;" v-bind:class="{loader:thisMonthRequestsByCheckpointDataLoader}"></div>
        <div class="gauge-box-middle" v-bind:class="{ coverSpin: thisMonthRequestsByCheckpointDataLoader}">
          <h2 class="page-subtitle gauge-box-text" style="margin-top: 19px;"> Requests</h2>
          <!--Start bar chart-->
          <bar-chart :chartData="thisMonthRequestsByCheckpointData" :data="thisMonthRequestsByCheckpointData" :styles="Bartyle"  v-if="!thisMonthRequestsByCheckpointDataLoader"></bar-chart>
          <!--End bar chart-->
        </div>
      </div>

    </div>
  </div>
</template>
<script>

  import PieChart from "@/charts/PieChart.js";

  import BarChart from "@/charts/BarChart.js";
  import $ from 'jquery'

  export default {
    name: "dashboard",
    data() {
      return {
      /**
       * Env var and global var's to be used by the page
       */
        //Custom Customer environment variable
        customer:process.env.VUE_APP_CUSTOMER,
        currencySymbol:"",
        currency:"",

        //xportal checkpoint Colors cache
        checkpointColors : {
          Register : "#282766",
          Login : "#23d160",
          General :  "#8DC63F",
          Add_Payment_Method  : "#ffdd57",
          Transaction  : "#ff3860"
        },


        /**
         * "Today's" data var's
         */
        //Todays Suspicious Activity
        todaysSuspiciousCustomers: "",
        todaysSuspiciousCustomersPercent: "",
        todaysCustomers: "",
        todaysSuspiciousTransactionPercent:"",
        todaysSuspiciousAmountPercent:"",

        //Todays Trends
        todaysVeryHighSeverityTransactions : 1,
        todaysMediumSeverityTransactions: 1 ,
        todaysLowSeverityTransactions: 1,
        todaysVeryHighSeverityAmounts : 1,
        todaysMediumSeverityAmounts: 1 ,
        todaysLowSeverityAmounts: 1,

        //Todays Gauge Components
        todaysTransactionsBySeverityData: null,
        todaysAmountsBySeverityData: null,
        todaysRequestsByCheckpointData:null,

        //Todays css Loaders
        todaysSuspiciousCustomersLoader: true,
        todaysSuspiciousCustomersPercentLoader: true,
        todaysCustomersLoader: true,
        todaysSuspiciousTransactionPercentLoader:true,
        todaysSuspiciousAmountPercentLoader:true,
        todaysVeryHighSeverityTransactionsLoader : true,
        todaysMediumSeverityTransactionsLoader: true,
        todaysLowSeverityTransactionsLoader: true,
        todaysVeryHighSeverityAmountsLoader : true,
        todaysMediumSeverityAmountsLoader: true,
        todaysLowSeverityAmountsLoader: true,
        todaysTransactionsBySeverityDataLoader: true,
        todaysAmountsBySeverityDataLoader: true,
        todaysRequestsByCheckpointDataLoader:true,


        /**
         * "Current month" data var's
         */
        //Current Month Suspicious Activity
        thisMonthSuspiciousCustomers: "",
        thisMonthSuspiciousCustomersPercent: "",
        thisMonthCustomers: "",
        thisMonthSuspiciousTransactionPercent:"",
        thisMonthSuspiciousAmountPercent:"",

        //Current Month Trends
        thisMonthVeryHighSeverityTransactions : 1,
        thisMonthMediumSeverityTransactions: 1 ,
        thisMonthLowSeverityTransactions: 1,
        thisMonthVeryHighSeverityAmounts : 1,
        thisMonthMediumSeverityAmounts: 1 ,
        thisMonthLowSeverityAmounts: 1,

        //Current Month Gauge Components
        thisMonthTransactionsBySeverityData: null,
        thisMonthAmountsBySeverityData: null,
        thisMonthRequestsByCheckpointData: null,

        //Current Month css Loaders
        thisMonthSuspiciousCustomersLoader: true,
        thisMonthSuspiciousCustomersPercentLoader: true,
        thisMonthCustomersLoader: true,
        thisMonthSuspiciousTransactionPercentLoader:true,
        thisMonthSuspiciousAmountPercentLoader:true,
        thisMonthVeryHighSeverityTransactionsLoader : true,
        thisMonthMediumSeverityTransactionsLoader: true,
        thisMonthLowSeverityTransactionsLoader: true,
        thisMonthVeryHighSeverityAmountsLoader : true,
        thisMonthMediumSeverityAmountsLoader: true,
        thisMonthLowSeverityAmountsLoader: true,
        thisMonthTransactionsBySeverityDataLoader: true,
        thisMonthAmountsBySeverityDataLoader: true,
        thisMonthRequestsByCheckpointDataLoader:true,
      }
    },
    components: {
      PieChart,BarChart
    },
    watch: {

    },
    filters: {

    },
    computed: {
      /**
       * Custom styling for vue-chartjs components
       */
      donutStyle () {
        return {
        position: 'relative',
        margin: 'auto',
        marginTop: '-4%',
        height: '22vh',
        width: '30vw'
        }
      },
      pieStyle () {
        return {
          position: 'relative',
          margin: 'auto',
          marginTop: '-2%',
          height: '15vh',
          width: '9vw'
        }
      },
      Bartyle () {
        return {
          position: 'relative',
          margin: 'auto',
          marginTop: '-2%',
          height: '20vh',
          width: '25vw'
        }
      }
    },

    mounted() {
      /**
       *On page load call functions to retrieve Today's/This month data analysis
       */
      console.log('\n');
      console.log("%c Dashboard Information:" , 'color: #4971cb; font-size: 20px');
      this.getCurrencySymbol(),
      this.getTodaysData(true),
      this.getTodaysData(false)
    },

    methods: {

       /** Function is called twice on page load - depends of the isYesterday boolean value:
       * 1.when isYesterday set to true - backend will send all "today's" data analysis
       * 2.when isYesterday set to false backend will send all "this month's" data analysis
       */
      getTodaysData(isYesterday){
         this.getTodaysCustomerGauge(isYesterday),
           this.getTodaysTransactionGauge(isYesterday),
           this.getTodaysAmountGauge(isYesterday)
         this.getTodaysSuspiciousCustomerGauge(isYesterday)
        this.getTodaysTransactionsBySeverityDonut(isYesterday),
        this.getTodaysAmountsBySeverityDonut(isYesterday),
        this.getTodaysRequestsBar(isYesterday)
      },

      /**
       * function that in case thers no data return from the API call will remove
       * everything from the data box and will append 'No Available Data'
       * @param boxId
       */
      appendNoData(boxId){
        $("#"+boxId).empty();
        $("#"+boxId).append("<h1 class=\"no-data\">No Available Data</h1>")
      },

      /**
       * Get Customer Currency and Currency Symbol Env var's
       */
      getCurrencySymbol(){
        this.$http.get("get-currency-symbol")
          .then(response => {
            this.currencySymbol = response.data.currencySymbol,
            this.currency = response.data.currency
          })
          .catch(error => {
            console.log(error)
            if(error.response.status==401){
              this.$store.dispatch("logout").then(() => {
                this.$router.push("/login")
              })
            }
          })
          .finally(() => (this.loading = false))
      },


      //***** From Here Blow - Functions for data analysis displayed in the dashboard charts/gauges ******//
      /**
       * Function get the Today's or Current month customer data analysis
       * @param isYesterday - a boolean value to determine if to get data from the current day or current month
       */
      getTodaysCustomerGauge(isYesterday){
        this.$http.get("get-todays-customer-gauge", {params: {isYesterdayRequest: isYesterday}})
          .then(response => {
            if (isYesterday) {
              let intId = setInterval(() => {
                  if (Number.isInteger(this.todaysSuspiciousCustomers)){
                    this.todaysCustomers = response.data['todaysCustomers'] || 0;
                    this.todaysSuspiciousCustomersPercent = this.todaysSuspiciousCustomers / this.todaysCustomers * 100;
                    this.todaysSuspiciousCustomersPercent = this.todaysSuspiciousCustomersPercent.toFixed(2);

                    this.todaysSuspiciousCustomersPercentLoader = false;
                    this.todaysCustomersLoader = false;

                    console.log("%c Current 24 Hours - Current Active Customers ---> " + this.todaysCustomers  , 'color: #4971cb');
                    console.log("%c Current 24 Hours - Of Active Customers ---> " + this.todaysSuspiciousCustomersPercent + " %" , 'color: #4971cb');

                    //In case there were no customers today
                    if(this.todaysSuspiciousCustomers==0){
                      this.appendNoData('todaysSuspiciousCustomersPercent')
                      this.appendNoData('todaysSuspiciousTransactionPercent')
                      this.appendNoData('todaysSuspiciousAmountPercent')
                    }
                    clearInterval(intId);
                  }
              }, 200);

            }
            else {
              let intId = setInterval(() => {
                if (Number.isInteger(this.thisMonthSuspiciousCustomers)){
                  this.thisMonthCustomers = response.data['todaysCustomers'] || 0;
                  this.thisMonthSuspiciousCustomersPercent = this.thisMonthSuspiciousCustomers / this.thisMonthCustomers * 100;
                  this.thisMonthSuspiciousCustomersPercent = this.thisMonthSuspiciousCustomersPercent.toFixed(2);

                  this.thisMonthSuspiciousCustomersPercentLoader = false;
                  this.thisMonthCustomersLoader = false;

                  console.log("%c Current 30 Days - Current Active Customers ---> " + this.thisMonthCustomers  , 'color: #4971cb');
                  console.log("%c Current 30 Days - Of Active Customers ---> " + this.thisMonthSuspiciousCustomersPercent +" %",'color: #4971cb');
                  clearInterval(intId);
                }
              }, 200);

            }
          })
          .catch(error => {console.log(error)})
          .finally(() => (this.loading = false))
      },
      /**
       * Function get the Today's or Current month customer data analysis
       * @param isYesterday - a boolean value to determine if to get data from the current day or current month
       */
      getTodaysSuspiciousCustomerGauge(isYesterday){
        this.$http.get("get-todays-suspicious-customer-gauge", {params: {isYesterdayRequest: isYesterday}})
          .then(response => {
            if (isYesterday) {
              this.todaysSuspiciousCustomers  =  response.data['todaysSuspiciousCustomers'] || 0;
              this.todaysSuspiciousCustomersLoader = false;
              console.log("%c Current 24 Hours - Suspicious Customers ---> " + this.todaysSuspiciousCustomers, 'color: #4971cb');

              //In case there were no customers today
              if(this.todaysSuspiciousCustomers==0){
                this.appendNoData('todaysSuspiciousCustomers')
              }

            }
            else {
              this.thisMonthSuspiciousCustomers  =  response.data['todaysSuspiciousCustomers'] || 0;
              this.thisMonthSuspiciousCustomersLoader = false;

              console.log("%c Current 30 Days - Suspicious Customers ---> " + this.thisMonthSuspiciousCustomers  , 'color: #4971cb');
            }
          })
          .catch(error => {console.log(error)})
          .finally(() => (this.loading = false))
      },







      /**
       * Function get the Today's or Current month Transaction data analysis
       * @param isYesterday - a boolean value to determine if to get data from the current day or current month
       */
      getTodaysTransactionGauge(isYesterday){
        this.$http.get("get-todays-transaction-gauge",{params: {isYesterdayRequest:isYesterday}})
          .then(response => {
            if(isYesterday) {
              this.todaysSuspiciousTransactionPercent = response.data['todaysSuspiciousTransactionPercent']  || 0  ;
              this.todaysSuspiciousTransactionPercent = this.todaysSuspiciousTransactionPercent.toFixed(2);
              this.todaysSuspiciousTransactionPercentLoader = false ;
              if(this.todaysSuspiciousTransactionPercent==0){this.appendNoData('todaysSuspiciousTransactionPercent')}
              console.log("%c Current 24 Hours - High Risk (transaction) ---> " + this.todaysSuspiciousTransactionPercent + ' %' , 'color: #4971cb');

            }
            else {
              this.thisMonthSuspiciousTransactionPercent = response.data['todaysSuspiciousTransactionPercent']  || 0  ;
              this.thisMonthSuspiciousTransactionPercent = this.thisMonthSuspiciousTransactionPercent.toFixed(2);
              this.thisMonthSuspiciousTransactionPercentLoader = false ;
              console.log("%c Current 30 Days - High Risk (transaction) ---> " + this.thisMonthSuspiciousTransactionPercent + ' %' , 'color: #4971cb');
            }
          })
          .catch(error => {console.log(error)})
          .finally(() => (this.loading = false))
      },

      /**
       * Function get the Today's or Current month Amount data analysis
       * @param isYesterday - a boolean value to determine if to get data from the current day or current month
       */
      getTodaysAmountGauge(isYesterday){
        this.$http.get("get-todays-amount-gauge", {params: {isYesterdayRequest:isYesterday}})
          .then(response => {
            let amountPrecent = response.data['todaysSuspiciousAmountPercent'] ;
            if(isYesterday) {
              this.todaysSuspiciousAmountPercent = amountPrecent  || 0  ;
              this.todaysSuspiciousAmountPercent = this.todaysSuspiciousAmountPercent.toFixed(2);
              this.todaysSuspiciousAmountPercentLoader = false ;
              if(this.todaysSuspiciousAmountPercent==0){this.appendNoData('todaysSuspiciousAmountPercent')}
              console.log("%c Current 24 Hours - High Risk ("+ this.currency + " " +this.currencySymbol+") ---> " + this.todaysSuspiciousAmountPercent + ' %' , 'color: #4971cb');
            }
            else {
              this.thisMonthSuspiciousAmountPercent = amountPrecent || 0  ;
              this.thisMonthSuspiciousAmountPercent = this.thisMonthSuspiciousAmountPercent.toFixed(2);
              this.thisMonthSuspiciousAmountPercentLoader = false  ;
              console.log("%c Current 30 Days - High Risk ("+ this.currency + " " +this.currencySymbol+") ---> " + this.thisMonthSuspiciousAmountPercent + ' %' , 'color: #4971cb');
            }
          })
          .catch(error => {console.log(error)})
          .finally(() => (this.loading = false))
      },

      /**
       * Function get the Today's or Current month Transactions By Severit data analysis
       * @param isYesterday - a boolean value to determine if to get data from the current day or current month
       */
      getTodaysTransactionsBySeverityDonut(isYesterday){
        this.$http.get("get-todays-transactions-by-severity",{params: {isYesterdayRequest:isYesterday}})
          .then(response => {
            //If data is from the current day
            if(isYesterday) {
            this.todaysVeryHighSeverityTransactions = response.data.todaysVeryHighSeverityTransactions  || 0  ;
            this.todaysMediumSeverityTransactions = response. data.todaysMediumSeverityTransactions  || 0  ;
            this.todaysLowSeverityTransactions = response.data.todaysLowSeverityTransactions   || 0  ;
            //In case no data is available disable sata-box
            if(this.todaysVeryHighSeverityTransactions===0 && this.todaysMediumSeverityTransactions===0 && this. todaysLowSeverityTransactions===0){this.appendNoData('todaysTransactionsBySeverityData')}
            //Construct Data for Donut-Chart
            this.todaysTransactionsBySeverityData= {
              labels: ['Very High', 'Medium', 'Low'],
              datasets: [{
                label: 'TransactionsBySeverity',
                backgroundColor: [this.checkpointColors.Transaction, this.checkpointColors.Add_Payment_Method, this.checkpointColors.General],
                data: [this.todaysVeryHighSeverityTransactions , this.todaysMediumSeverityTransactions, this.todaysLowSeverityTransactions]
              }]
            }
            console.log("%c Current 24 Hours - Transactions By Severity ---> " + this.logSeverity(this.todaysTransactionsBySeverityData),'color: #4971cb') ;
            this.todaysTransactionsBySeverityDataLoader = false ;
            }

            //If data is from the current month
            else {
              this.thisMonthVeryHighSeverityTransactions = response.data.todaysVeryHighSeverityTransactions ;
              this.thisMonthMediumSeverityTransactions = response. data.todaysMediumSeverityTransactions ;
              this. thisMonthLowSeverityTransactions = response.data.todaysLowSeverityTransactions ;


              this.thisMonthTransactionsBySeverityData = {
                labels: ['Very High', 'Medium', 'Low'],
                datasets: [{
                  label: 'TransactionsBySeverity',
                  backgroundColor: [this.checkpointColors.Transaction, this.checkpointColors.Add_Payment_Method, this.checkpointColors.General],
                  data: [this.thisMonthVeryHighSeverityTransactions , this.thisMonthMediumSeverityTransactions, this.thisMonthLowSeverityTransactions]
                }]
              }
              console.log("%c Current 30 Days - Transactions By Severity ---> " + this.logSeverity(this.thisMonthTransactionsBySeverityData),'color: #4971cb') ;
              if(this.todaysVeryHighSeverityTransactions===0 && this.todaysMediumSeverityTransactions===0 && this. todaysLowSeverityTransactions===0){this.appendNoData('todaysTransactionsBySeverityData')}
              this.thisMonthTransactionsBySeverityDataLoader = false
            }
          })
          .catch(error => {console.log(error)})
          .finally(() => (this.loading = false))
      },

      /**
       * Function get the Today's or Current month Amounts By Severity data analysis
       * @param isYesterday - a boolean value to determine if to get data from the current day or current month
       */
      getTodaysAmountsBySeverityDonut(isYesterday){
        this.$http.get("get-todays-amounts-by-severity",{params: {isYesterdayRequest:isYesterday}})
          .then(response => {
            if(isYesterday) {
              this.todaysVeryHighSeverityAmounts = response.data.todaysVeryHighSeverityAmounts  || 0  ;
              this.todaysMediumSeverityAmounts = response. data.todaysMediumSeverityAmounts || 0  ;
              this.todaysLowSeverityAmounts = response.data.todaysLowSeverityAmounts || 0  ;
              // In case No data returned disable data-box
              if(this.todaysVeryHighSeverityAmounts==0 && this.todaysMediumSeverityAmounts==0 && this. todaysLowSeverityAmounts==0){this.appendNoData('todaysAmountsBySeverityData')}
              //Construct Data
                this.todaysAmountsBySeverityData= {
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

              console.log("%c Current 24 Hours - Amount By Severity ---> " + this.logSeverity(this.todaysAmountsBySeverityData),'color: #4971cb') ;
              this.todaysAmountsBySeverityDataLoader = false ;
            }

            else{
              this.thisMonthVeryHighSeverityAmounts = response.data.todaysVeryHighSeverityAmounts  || 0  ;
              this.thisMonthMediumSeverityAmounts = response. data.todaysMediumSeverityAmounts  || 0  ;
              this. thisMonthLowSeverityAmounts = response.data.todaysLowSeverityAmounts  || 0  ;
              // In case No data returned disable data-box
              if(this.todaysVeryHighSeverityAmounts==0 && this.todaysMediumSeverityAmounts==0 && this. todaysLowSeverityAmounts==0){this.appendNoData('todaysAmountsBySeverityData')}
              //Construct Data
              this.thisMonthAmountsBySeverityData= {
                currencySymbol: this.currencySymbol,
                hoverBackgroundColor: "red",
                hoverBorderWidth: 10,
                labels: ["Very High", "Medium", "Low"],
                datasets: [{
                  label: "AmountsBySeverity",
                  backgroundColor: [this.checkpointColors.Transaction, this.checkpointColors.Add_Payment_Method, this.checkpointColors.General],
                  data: [this.thisMonthVeryHighSeverityAmounts, this.thisMonthMediumSeverityAmounts, this.thisMonthLowSeverityAmounts]
                }]
              }
              console.log("%c Current 30 Days - Amount By Severity ---> " + this.logSeverity(this.thisMonthAmountsBySeverityData),'color: #4971cb') ;
              this.thisMonthAmountsBySeverityDataLoader=false
            }
          })
          .catch(error => {console.log(error)})
          .finally(() => (this.loading = false))
      },

      /**
       * Function get the Today's or Current month requests data analysis
       * @param isYesterday - a boolean value to determine if to get data from the current day or current month
       */
      getTodaysRequestsBar(isYesterday){
        this.$http.get("get-todays-requests" ,{params: {isYesterdayRequest:isYesterday}})
          .then(response => {
            if(isYesterday) {
            this.todaysRegistersData = response.data.todaysRegistersData  || 0  ;
            this.todaysLoginsData = response.data.todaysLoginsData || 0  ;
            this.todaysGeneralsData = response.data.todaysGeneralsData  || 0  ;
            this.todaysAddPaymentMethodsData = response.data.todaysAddPaymentMethodsData  || 0  ;
            this.todaysTransactionsData = response.data.todaysTransactionsData  || 0  ;
            // In case No data returned disable data-box
            if(this.todaysRegistersData==0 && this.todaysLoginsData==0 && this. todaysGeneralsData==0 && this. todaysTransactionsData==0){this.appendNoData('todaysRequestsByCheckpointData')}
            //Construct data for Bar-Chart
            this.todaysRequestsByCheckpointData = {
                labels: ['Register' , 'Login' ,'General' ,'Add Payment Method','Transaction'],
                datasets: [{
                label: 'Data One',
                backgroundColor: ["#282766","#00e3d0","#8DC63F","#db6b09", "#e30000"],
                pointBackgroundColor: 'white',
                borderWidth: 2,
                pointBorderColor: '#249EBF',
                data: [this.todaysRegistersData,this.todaysLoginsData,this.todaysGeneralsData,this.todaysAddPaymentMethodsData,this.todaysTransactionsData]
              }]
            }
              console.log("%c Current 24 Hours - Requests ---> " + this.logSeverity(this.todaysRequestsByCheckpointData),'color: #4971cb') ;
              this.todaysRequestsByCheckpointDataLoader=false ;
            }
            else {
              this.thisMonthRegistersData = response.data.todaysRegistersData  || 0  ;
              this.thisMonthLoginsData = response.data.todaysLoginsData  || 0  ;
              this.thisMonthGeneralsData = response.data.todaysGeneralsData  || 0  ;
              this.thisMonthAddPaymentMethodsData = response.data.todaysAddPaymentMethodsData  || 0  ;
              this.thisMonthTransactionsData = response.data.todaysTransactionsData  || 0  ;
              //Construct data for Bar-Chart
              this.thisMonthRequestsByCheckpointData = {
                labels: ['Register' , 'Login' ,'General' ,'Add Payment Method','Transaction'],
                datasets: [{
                  label: 'Data One',
                  backgroundColor: ["#282766","#00e3d0","#8DC63F","#db6b09", "#e30000"],
                  pointBackgroundColor: 'white',
                  borderWidth: 2,
                  pointBorderColor: '#249EBF',
                  data: [this.thisMonthRegistersData,this.thisMonthLoginsData,this.thisMonthGeneralsData,this.thisMonthAddPaymentMethodsData,this.thisMonthTransactionsData]
                }]
              }
              console.log("%c Current 30 Days - Requests ---> " + this.logSeverity(this.thisMonthRequestsByCheckpointData),'color: #4971cb') ;
              this.thisMonthRequestsByCheckpointDataLoader = false;
            }

          })
          .catch(error => {console.log(error)})
          .finally(() => (this.loading = false))
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
