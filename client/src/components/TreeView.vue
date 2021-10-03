<template>
  <table class="table single-event-table is-striped is-fullwidth">
    <tbody>
      <tr v-for="(item, index) in rootLevelItems" v-bind:key="index">
        <td>{{item.label}}</td>
        <td>{{item.value}}</td>
      </tr>
      <tr v-for="(item, index) in nestedItems" v-bind:key="index+'nested'">
        <td>
          <h3 class="page-subtitle">{{item.label}}</h3>
          <TreeView :items="item.items" />
        </td>
      </tr>
    </tbody>
  </table>
</template>
<script>
export default {
  customer:process.env.VUE_APP_CUSTOMER,
  name: "TreeView",
  props: ["items"],
  data() {
    return {
      rootLevelItems: [],
      nestedItems: []
    }
  },
  mounted() {
    this.nestedItems = []
    this.rootLevelItems = []
    for (const property in this.items) {
      if (typeof this.items[property] === "object") {
        this.nestedItems.push({ label: property, items: this.items[property] })
      } else {
        this.rootLevelItems.push({
          label: property,
          value: this.items[property]
        })
      }
    }
  }
}
</script>
<style scoped>
li {
  list-style: none;
}
</style>
