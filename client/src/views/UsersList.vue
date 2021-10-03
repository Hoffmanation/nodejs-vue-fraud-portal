<template>
  <div class="main-content users">
    <h1 class="page-title">Profiles</h1>
    <div class="filters-wrapper">
      <div>
        <h2 class="page-subtitle">Filters:</h2>
        <input
          class="input is-rounded"
          type="text"
          v-model="filters.name"
          @keyup.enter="onFilterInput"
          placeholder="Name"
        />
        <input
          class="input is-rounded"
          type="text"
          v-model="filters.email"
          @keyup.enter="onFilterInput"
          placeholder="Email"
        />
        <b-dropdown
          rounded
          multiple
          aria-role="list"
          placeholder="Status"
          v-model="filters.role"
          @change="selectChange"
        >
          <button class="button is-rounded" type="button" slot="trigger">
            <span>Role ({{ filters.role.length }})</span>
            <b-icon icon="menu-down"></b-icon>
          </button>
          <b-dropdown-item value="developer" aria-role="listitem">
            <span>Developer</span>
          </b-dropdown-item>
          <b-dropdown-item value="admin" aria-role="listitem">
            <span>Admin</span>
          </b-dropdown-item>
          <b-dropdown-item value="analyst" aria-role="listitem">
            <span>Analyst</span>
          </b-dropdown-item>
        </b-dropdown>
        <b-datepicker
          placeholder="Created Start"
          icon="calendar-today"
          class="is-rounded"
          v-model="dateFilters.created_atStart"
          editable
        >
          <button class="button is-danger" @click="dateFilters.created_atStart = null">
            <b-icon icon="close"></b-icon>
            <span>Clear</span>
          </button>
        </b-datepicker>
        <b-datepicker
          placeholder="Create End"
          icon="calendar-today"
          v-model="dateFilters.created_atEnd"
          editable
        >
          <button class="button is-danger" @click="dateFilters.created_atEnd = null">
            <b-icon icon="close"></b-icon>
            <span>Clear</span>
          </button>
        </b-datepicker>
      </div>
      <div>
        <button v-bind:disabled='disableAddUser' class="button is-rounded" @click="isAddUserModalActive = true">
          <span class="icon is-small">
            <img src="icons/addNew.svg" />
          </span>
          <span>Add new</span>
        </button>
        <b-modal
          :active.sync="isAddUserModalActive"
          has-modal-card
          trap-focus
          aria-role="dialog"
          aria-modal
        >
          <div class="modal-card">
            <header class="modal-card-head">
              <p class="modal-card-title">Create New User</p>
            </header>
            <section class="modal-card-body">
              <b-field>
                <b-input
                  rounded
                  type="email"
                  v-model="newUserInfo.email"
                  placeholder="New user email"
                />
              </b-field> <b-field>
                <b-input
                  rounded
                  type="text"
                  v-model="newUserInfo.name"
                  placeholder="New user name"
                />
              </b-field>
              <b-field>
                <b-select rounded expanded placeholder="Role" v-model="newUserInfo.role">
                  <option value="developer" selected>Developer</option>
                  <option value="analyst">Analyst</option>
                  <option value="admin">Admin</option>
                </b-select>
              </b-field>
            </section>
            <footer class="modal-card-foot">
              <button
                class="button is-rounded"
                type="button"
                @click="isAddUserModalActive = false"
              >Close</button>
              <!--<button class="button is-rounded is-primary" @click="submitNewUser" >Create</button> -->
              <button class="button is-rounded is-primary">Create</button>
            </footer>
          </div>
        </b-modal>
      </div>
    </div>
    <b-table
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
      @sort="onSort"
      @click="rowClick"
    >
      <template slot-scope="props">
        <b-table-column class="profile-columns" label="Name" field="name" sortable>{{ props.row.name }}</b-table-column>
        <b-table-column class="profile-columns" label="Email" field="email" sortable>{{ props.row.email }}</b-table-column>
        <b-table-column class="profile-columns" label="Role" field="role" sortable>{{ props.row.role }}</b-table-column>
        <b-table-column
          label="Created"
          field="created_at"
          sortable
          class="role-columns"
        >{{ props.row.created_at | dateFilter }}</b-table-column>
        <b-table-column
          label="Updated"
          field="updated_at"
          sortable
          class="role-columns"
        >{{ props.row.updated_at | dateFilter }}</b-table-column>
      </template>
    </b-table>
    <b-modal
      :active.sync="isEditUserModalActive"
      has-modal-card
      trap-focus
      aria-role="dialog"
      aria-modal
    >
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Edit user</p>
        </header>
        <section class="modal-card-body">
          <b-field label="Email">
            <b-input rounded type="email" v-model="editModel.email" />
          </b-field>
          <b-field label="Name">
            <b-input rounded type="name" v-model="editModel.name" />
          </b-field>
          <b-field label="Role">
            <b-select rounded expanded placeholder="Role" v-model="editModel.role">
              <option value="developer">Developer</option>
              <option value="analyst">Analyst</option>
              <option value="admin">Admin</option>
            </b-select>
          </b-field>
        </section>
        <footer class="modal-card-foot">
          <button
            class="button is-rounded"
            type="button"
            @click="isEditUserModalActive = false"
          >Close</button>
          <button class="button is-rounded is-primary" @click="submitEditUser">Update</button>
          <button class="button is-rounded is-primary" @click="submitResetUserPassword">Reset Password</button>
          <button class="button is-rounded is-danger" @click="deleteUser">Delete user</button>
        </footer>
      </div>
    </b-modal>
  </div>
</template>
<script>
import Vue from "vue"
export default {
  customer:process.env.VUE_APP_CUSTOMER,
  name: "UsersList",
  data() {
    return {
      editModel: {},
      totalItems: 0,
      disableAddUser: false,
      isAddUserModalActive: false,
      isEditUserModalActive: false,
      items: [],
      loading: true,
      options: {
        totalItems: 0,
        itemsPerPage: "",
        sortField: "created_at",
        sortOrder: "desc",
        defaultSortOrder: "desc",
        page: 1,
        perPage: 20
      },
      filters: {
        role: []
      },
      ranges: {},
      newUserInfo: {},
      dateFilters: {}
    }
  },
  mounted() {
    this.getData()
  },
  watch: {
    dateFilters: {
      handler: function() {
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
        return (
          days + "/" + month + "/" + dt.getFullYear()
        )
    }
  },
  methods: {
    getData() {
      this.loading = true
      let params = {}
      let sortBy = {}
      sortBy[this.options.sortField] = this.options.sortOrder
      params.sort = sortBy

      params.currentPage = this.options.page
      params.perPage = this.options.itemsPerPage
      params.filters = this.filters
      params.ranges = this.ranges

      this.$http
        .get("users", { params: params })
        .then(response => {
          this.items = response.data.data
          this.options.totalItems = parseInt(response.data.pagination.total)
          this.options.itemsPerPage = parseInt(response.data.pagination.perPage)
          this.options.page = parseInt(response.data.pagination.currentPage)
        })
        .catch(error => {
          console.log(error)
          if(error.response.status==401){
            this.$store.dispatch("logout").then(() => {
              this.$router.push("/login")
            })
          }
          this.errored = true
          this.disableAddUser=true
        })
        .finally(() => (this.loading = false))
    },
    submitNewUser() {
      this.loading = true
      this.isAddUserModalActive = false
      this.$http
        .post("users", {
          role: this.newUserInfo.role,
          name: this.newUserInfo.name,
          email: this.newUserInfo.email
        })
        .then(response => {
          console.log(response)
          this.getData()
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
    submitEditUser() {
      this.loading = true
      this.isEditUserModalActive = false
      this.$http
        .put("users/" + this.editModel.id, {
          role: this.editModel.role,
          email: this.editModel.email,
          name: this.editModel.name,
          userId: this.editModel.id
        })
        .then(response => {
          console.log(response)
          this.getData()
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
    deleteUser() {
      this.loading = true
      this.isEditUserModalActive = false
      this.$http
        .delete("users/" + this.editModel.id, {data: {
          userId: this.editModel.id,
          role: this.editModel.role,
          name: this.editModel.name,
          email: this.editModel.email
        }})
        .then(response => {
          console.log(response)
          this.getData()
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
    submitResetUserPassword() {
      this.loading = true
      this.isEditUserModalActive = false
      this.$http
        .post("reset-password/" + this.editModel.id, {
          userId: this.editModel.id,
          role: this.editModel.role,
          name: this.editModel.name,
          email: this.editModel.email
        })
        .then(response => {
          console.log(response)
          this.getData()
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
    onFilterInput() {
      this.getData()
    },
    selectChange() {
      if (this.timeout) clearTimeout(this.timeout)
      this.timeout = setTimeout(() => {
        this.getData()
      }, 1000)
    },
    onPageChange(page) {
      this.options.page = page
      this.getData()
    },
    onSort(field, order) {
      this.options.sortField = field
      this.options.sortOrder = order
      this.getData()
    },
    rowClick(row) {
      this.editModel = JSON.parse(JSON.stringify(row))
      this.isEditUserModalActive = true
    }
  }
}
</script>
