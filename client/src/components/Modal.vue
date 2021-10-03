<template>
  <section>

    <b-modal
      :active.sync="isImageModalActive"
      has-modal-card
      trap-focus
      aria-role="dialog"
      aria-modal
    >
      <div class="modal-card" style="width: auto">
        <header class="modal-card-head">
          <p class="modal-card-title">Information</p>
          <button
            type="button"
            class="delete"
            @click="isImageModalActive = false"/>
        </header>
        <section class="modal-card-body">
          <h2>{{infoModalMessage}}</h2>
        </section>
        <footer class="modal-card-foot">
          <button class="button" type="button" @click="isImageModalActive = false">Close</button>
        </footer>
      </div>
    </b-modal>
  </section>
</template>

<script>

  export default {
    customer:process.env.VUE_APP_CUSTOMER,
    name: "ModalForm",
    props: ['isImageModalActive','infoModalMessage'],
    data() {
      return {
      }
    },
    mounted() {

    },

    filters: {

    },
    methods: {
    }
  }
</script>
