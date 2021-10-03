<template>
  <div class="sidebar-event-detail">
    <h1 class="page-title back" @click="changeHomeStatus">
      &#10005;
    </h1>
    <div class="request_container">
      <h1 class="page-subtitle requestedid-subtitle">Requested ID: {{$route.params.requestid}}
        <div class="clipboard">
          <div class="clipboard_tooltip">Copied!</div>
          <a data-label="Copy Event URL" class="is-primary is-bottom is-medium b-tooltip">
            <img style="margin-bottom: 7px;" @click="copyToClipboard"  v-bind:src="'/'+customer+'/icons/clipboard_icon.png'">
          </a>
        </div>
        <a id="new_tab" target="_blank" @click="createHref" data-label="Open in a new tab" class="is-primary is-top is-medium b-tooltip"><img v-bind:src="'/'+customer+'/icons/new-tab.png'"></a>

      </h1>

    </div>
    <input type="text" value="" id="helper_text">
    <!--    <h2-->
<!--      v-if="rootLevelItems.find(o => o.label === 'User ID')"-->
<!--      class="page-subtitle"-->
<!--    >Customer ID: {{rootLevelItems.find(o => o.label === 'User ID').value}}</h2>-->

    <div
      v-if="rootLevelItems.find(o => o.label === 'Severity')"
      :class="['tag', getSeverityTag(rootLevelItems.find(o => o.label === 'Severity').value), 'is-rounded', 'is-fullwidth']"
    >{{rootLevelItems.find(o => o.label === 'Severity').value}}</div>

    <h2 class="page-subtitle" v-if="rootLevelItems.length">General information</h2>
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
      <TreeView v-bind:key="index + Math.random()" :items="item.items" />
    </template>
    </div>
</template>
<script>
  import TreeView from "@/components/TreeView.vue"
  import $ from 'jquery'

  export default {
    data(){
      return{
        customer:process.env.VUE_APP_CUSTOMER,
        link: `${window.location.origin}/${process.env.VUE_APP_CUSTOMER}/event-details/${this.$route.params.requestid}`
      }
    },
  name: "SideBar",
  props: ["items","rootLevelItems"],
  components: {
    TreeView
  },
    mounted(){
      $('.clipboard_tooltip').css('display' , 'none')
      document.getElementById('new_tab').href = this.link;
    },
  methods:{
      createHref(){
        document.getElementById('new_tab').href = `${window.location.origin}/${process.env.VUE_APP_CUSTOMER}/event-details/${this.$route.params.requestid}`;
      },
    getSeverityTag(severity) {
      if (severity === "LOW") return "is-success"
      if (severity === "MEDIUM") return "is-warning"
      if (severity === "HIGH") return "is-danger"
      if (severity === "VERY_HIGH" || severity === "VERY HIGH") return "is-danger"
      if (severity === "FAIL") return "is-info"
      if (severity === "EXPIRED") return "is-info"
      return "is-info"
    },
    changeHomeStatus: function () {
      let sideBarElement = $('.vue-portal-target') ;
      sideBarElement.css('position', 'inherit') ;
      sideBarElement.css('display', 'none !important') ;
      let bTableElement = $('.b-table') ;
      bTableElement.css('height','auto');
      this.$emit('changeHomeStatus')
      this.$router.push({name: 'home'}).catch(err=> err+1)
    },
    copyToClipboard(){
      $('.clipboard_tooltip').css('display' , 'block')
      let helperInput = document.getElementById("helper_text");
      helperInput.value =`${window.location.origin}/${process.env.VUE_APP_CUSTOMER}/event-details/${this.$route.params.requestid}`;
      helperInput.select();
      document.execCommand("copy");
      setTimeout(function(){
        $('.clipboard_tooltip').css('display' , 'none')
      },1500)
    }
  }
}
</script>
<style scoped>

  .sidebar-event-detail{
    width: 100%;
    height: 100%;
    background-color: white;
    padding-left: 10px;
    position: relative;
    padding-top: 50px;
    overflow-y: auto;
    -webkit-box-shadow: 3px 3px 5px 6px #ccc;
    -moz-box-shadow:    3px 3px 5px 6px #ccc;
    box-shadow:         3px 3px 5px 6px #ccc;
  }

  .back{
    cursor: pointer;
    position: absolute;
    top: 20px;
    right: 20px;
  }

  .request_container{
    position: relative;
  }

  .request_container img{
    width: 15px;
    vertical-align: top;
    display: inline-block;
    margin-left: 10px;
    cursor: pointer;
  }

  .requestedid-subtitle{
    margin-bottom: 30px;
    display: inline-block;
    font-size: 17px;
  }
  #helper_text{
    position: absolute;
    left: -9999px;
  }

  .clipboard{
    display: inline-block;
    vertical-align: sub;
    position: relative;
  }

  .clipboard_tooltip{
    position: absolute;
    top: -20px;
    left: 70%;
    transform: translate(-50%,-50%);
    width: 50px;
    border-radius: 3px;
    height: 25px;
    background-color: #172B4D;
    color: white;
    line-height: 25px;
    font-size: 10px;
    text-align: center;
  }

  @keyframes cssAnimation {
    0% {
      opacity: 1;
    }
    25% {
      opacity: 0.75;
    }
    50% {
      opacity: 5;
    }
    75% {
      opacity: 0.25;
    }
    100% {
      opacity: 0;
    }
  }

li {
  list-style: none;
}
</style>
