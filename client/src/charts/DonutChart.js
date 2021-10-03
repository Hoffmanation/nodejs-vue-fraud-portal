import { Pie, mixins } from "vue-chartjs";
const { reactiveProp } = mixins

export default {
  extends: Pie,
  mixins: [reactiveProp],
  props: ["data",'options'],
  mounted () {
    this.renderChart(this.data, {
      borderWidth: "10px",
      hoverBackgroundColor: "red",
      hoverBorderWidth: "10px",
      responsive: true,
      maintainAspectRatio: false,
      pieceLabel: {
        mode: 'percentage',
        precision: 1
      },
    })
  }
};
