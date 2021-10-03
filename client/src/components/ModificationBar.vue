<template>
  <div class="sidebar-event-detail">
    <h1 class="page-title back" @click="changeHomeStatus">
      &#10005;
    </h1>




    <h2 class="page-subtitle">Request Data: </h2>

    <template >
      <table class="table single-event-table is-striped is-fullwidth">
        <tbody>
        <tr v-for="(key,val,index) in items" v-bind:key="index+1">
          <td>{{index+1}}.  {{val}}</td>
          <td>{{key}}</td>
        </tr>
        </tbody>
      </table>

    </template>

  </div>
</template>
<script>
  import $ from 'jquery'

  export default {
    data(){
      return{
        customer:process.env.VUE_APP_CUSTOMER,
        link: `${window.location.origin}/${process.env.VUE_APP_CUSTOMER}/event-details/${this.$route.params.requestid}`
      }
    },
    name: "ModBar",
    props: ["items"],
    components: {

    },
    mounted(){

    },
    methods:{
      changeHomeStatus: function () {
        let sideBarElement = $('.vue-portal-target') ;
        sideBarElement.css('position', 'inherit') ;
        sideBarElement.css('display', 'none !important') ;
        let bTableElement = $('.b-table') ;
        bTableElement.css('height','auto');
        this.$emit('changeHomeStatus')
        this.$router.push({name: 'audit'}).catch(err=> err+1)
      },
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
