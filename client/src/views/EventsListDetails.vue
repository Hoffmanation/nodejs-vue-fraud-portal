<template>
  <div class="main-content">
    <div class="main-content single-event-wrap">
      <h1 class="page-title" style="cursor: pointer" @click="$router.push({name: 'home'})">
        <img v-bind:src="'/'+customer+'/icons/chevron_left.svg'" /> Back
      </h1>

      <h2
        v-if="rootLevelItems.find(o => o.label === 'Request Id')"
        class="page-subtitle"
      >Request ID: {{rootLevelItems.find(o => o.label === 'Request Id').value}}</h2>

      <div
        v-if="rootLevelItems.find(o => o.label === 'Severity')"
        :class="['tag', getSeverityTag(rootLevelItems.find(o => o.label === 'Severity').value), 'is-rounded', 'is-fullwidth']"
      >{{rootLevelItems.find(o => o.label === 'Severity').value }}</div>

      <h2 class="page-subtitle" v-if="rootLevelItems.length">General Information</h2>
      <table class="table single-event-table is-striped is-fullwidth" v-if="rootLevelItems.length">
        <tbody>
          <template v-for="(item, index) in rootLevelItems">
            <tr v-bind:key="index">
              <td>{{item.label}}</td>
              <td>{{item.value}}</td>
            </tr>
          </template>
        </tbody>
      </table>

      <template v-for="(item, index) in items">
        <h2 v-bind:key="index+'nested'" class="page-subtitle">{{item.label}}</h2>
        <TreeView v-bind:key="index" :items="item.items" />
      </template>
    </div>
  </div>
</template>

<script>
import TreeView from "@/components/TreeView.vue"
export default {

  name: "events-details",
  data() {
    return {
      customer:process.env.VUE_APP_CUSTOMER,
      items: [],
      rootLevelItems: []
    }
  },
  components: {
    TreeView
  },
  watch: {
    options: {
      handler() {
        this.getData()
      },
      deep: true
    }
  },
  mounted() {
    this.getData()
  },
  methods: {
    getData() {
      this.loading = true
      this.$http
        .get("risk-events/" + this.$route.params.requestid)
        .then(response => {
          this.rootLevelItems = []
          this.items = []
          for (const property in response.data) {
            if (typeof response.data[property] === "object") {
              this.items.push({
                label: property,
                items: response.data[property]
              })
            } else {
              this.rootLevelItems.push({
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
    getSeverityTag(severity) {
      if (severity === "LOW") return "is-success"
      if (severity === "MEDIUM") return "is-warning"
      if (severity === "HIGH") return "is-danger"
      if (severity === "VERY HIGH" || severity === "VERY_HIGH") return "is-danger"
      if (severity === "FAIL") return "is-info"
      if (severity === "EXPIRED") return "is-info"
      return "is-info"
    },
    rowClick(row) {
      this.$router.push({
        name: "eventsDetails",
        params: { requestid: row.requestid }
      })
    }
  }
}
</script>
