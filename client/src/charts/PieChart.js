import { Doughnut, mixins } from "vue-chartjs";
/*import Dash from '@/views/Dashboard.vue'*/
const { reactiveProp } = mixins

export default {
  extends: Doughnut,
  mixins: [reactiveProp],
  props: ["data",'options','currencySymbol'],

  data() {
    return {

    }
  },
  mounted() {
    // this.chartData is created in the mixin.
    // If you want to pass options please create a local options object
    this.renderChart(this.data, {
      borderWidth: "10px",
      hoverBackgroundColor: "red",
      hoverBorderWidth: "10px",

      responsive: true,
      maintainAspectRatios: false,
      legend: {
        position: 'left',
        display: false
      },
      tooltips: {
        enabled: true,
        callbacks: {
          label:function (tooltipItem, data) {
            let dataset = data.datasets[tooltipItem.datasetIndex]
            let currentValue = dataset.data[tooltipItem.index]
            if (dataset.label=='AmountsBySeverity')
            return data.labels[tooltipItem.index] + ": " +data.currencySymbol + currentValue ;

            return data.labels[tooltipItem.index] + ": " +currentValue ;
          }
        }
      }
    });
  },
  methods: {
/*    getCurrencySymbol(){
      console.log('getCurrencySymbol');
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
    },*/
  }
};
