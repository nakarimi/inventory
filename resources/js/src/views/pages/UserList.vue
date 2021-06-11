<template lang="">
<div>
  <vx-card>
    <vs-table ref="table" :data="users" stripe pagination :max-items="10">
      <template slot="thead">
        <vs-th>#</vs-th>
        <vs-th>Email</vs-th>
        <vs-th>Name</vs-th>
        <vs-th>Branch</vs-th>
        <vs-th>Phone</vs-th>
        <vs-th>Status/Role</vs-th>
        <vs-th></vs-th>
      </template>
      <template slot-scope="{data}">
        <tbody>
          <vs-tr :data="tr" :key="i" v-for="(tr, i) in data">
            <vs-td>
              <p class="cursor-pointer">{{ (i+ (10 * ($refs.table.currentx - 1 ))) + 1 }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.email }}</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.first_name + ' ' + tr.last_name }}</p>
            </vs-td>
            <vs-td>
              <p v-if="tr.branch">{{ tr.branch.name }} ({{ tr.branch.code }})</p>
            </vs-td>
            <vs-td>
              <p>{{ tr.phone }}</p>
            </vs-td>
            <vs-td>
              <p @click="approveAccount(tr.id, tr)" class="capitalize" :class="(tr.status == 'Approved')? 'text-success' : 'text-danger' ">{{ (tr.roles.length > 0) ? tr.roles[0].name : '' }}
                <feather-icon title="Approve Account" icon="UserPlusIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="ml-2 cursor-pointer" />
              </p>
            </vs-td>
            <vs-td>
              <span class="cursor-pointer hover:text-success" @click="$router.push(`/user/edit/${tr.id}`).catch(() => {})">
                <feather-icon icon="EditIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
              <span class="cursor-pointer hover:text-danger" @click="deleteEntity(tr.id)">
                <feather-icon icon="TrashIcon" svgClasses="w-5 h-5 hover:text-danger stroke-current" class="cursor-pointer" />
              </span>
            </vs-td>
          </vs-tr>
        </tbody>
      </template>
    </vs-table>
  </vx-card>
</div>
</template>

<script>
import vSelect from "vue-select";
export default {
  data() {
    return {
      users: [],
    }
  },
  components: {
    "v-select": vSelect,
  },
  created() {
    this.loadUsers()
  },
  methods: {

    // Approve accounts that created and need admin permission
    approveAccount(id, data) {
      (async () => {

        /* roleOptions can be an object or Promise */
        const roleOptions = new Promise((resolve) => {
          resolve({
            'customer': 'Customer',
            'accounter': 'Accounter',
            'admin': 'Admin',
          })
        })

        const {
          value: user_role
        } = await swal.fire({
          title: 'Select what role this user has?',
          input: 'radio',
          icon: 'question',
          inputOptions: roleOptions,
          inputValidator: (value) => {
            if (!value) {
              return 'You need to choose something!'
            }
          }
        })

        if (user_role) {
          swal.fire({
            title: 'Are you sure ???',
            text: "If you continue, this account will access to the system !!!",
            icon: 'question',
            showCancelButton: true,
          }).then((result) => {
            if (result.isConfirmed) {
              this.axios.post('/api/approve/user/' + id, {
                  user_role: user_role,
                  user: data
                }).then((response) => {
                  swal.fire({
                    title: 'Completed!',
                    text: "User status approved successfully!",
                    icon: 'success',
                  })
                  this.loadUsers()
                })
                .catch(() => {
                  swal.fire(
                    'Failed!',
                    'Operation rejected, please check the system!',
                    'error'
                  )
                });
            }
          })
        }

      })()

    },
    // Delete the item from system, asking confirmation and show message in response.
    deleteEntity(id) {
      swal.fire({
        title: 'Are you sure ???',
        text: "If you continue, this item and all related contents will not exist anymore !!!",
        icon: 'question',
        showCancelButton: true,
      }).then((result) => {
        if (result.isConfirmed) {
          this.axios.delete(`/api/users/${id}`)
            .then((id) => {
              swal.fire({
                title: 'Completed!',
                text: "Item removed from system successfully!",
                icon: 'success',
              })

              // Reload the data to show valid information to the table.
              this.loadUsers();
            })
            .catch(() => {
              swal.fire(
                'Failed!',
                'Operation rejected, please check the system for REFERENCES!',
                'error'
              )
            });
        }
      })
    },

    // Load exist users to be listed on the table.
    loadUsers() {
      this.axios.get('/api/users').then((response) => {
        this.users = response.data
      }).catch(() => {})
    }
  }

}
</script>

<style lang="">

</style>
