<template>
<div>
  <v-row>
    <v-col sm="" offset-sm="2">
      <v-data-table
        :headers="headers"
        :items="orders"
        sort-by="id"
        class="elevation-1"
        >
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>Orders</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-spacer></v-spacer>
            <v-dialog v-model="dialog" max-width="1200px">
              <template v-slot:activator="{ on }">
                <v-btn  color="primary" dark class="mb-2" v-on="on"
                  >New Order</v-btn>

              </template>


              <v-card>
                <v-card-title>
                  <span class="headline">{{ formTitle }}  </span>
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.customerID"
                          label="customerID"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-select
                          :items="products"
                          v-model="editedItem.productID"
                          label="ProductID"
                        ></v-select>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                      <v-menu
                        ref="menu2"
                        v-model="menu2"
                        :close-on-content-click="false"
                        :return-value.sync="editedItem.expectedDeliveryDate"
                        transition="scale-transition"
                        offset-y
                        min-width="290px"
                      >
                        <template v-slot:activator="{ on, attrs }">
                          <v-text-field
                            v-model="editedItem.expectedDeliveryDate"
                            label="Delivery Date"
                            prepend-icon="mdi-calendar"
                            readonly
                            v-bind="attrs"
                            v-on="on"
                          ></v-text-field>
                        </template>
                        <v-date-picker
                          v-model="editedItem.expectedDeliveryDate"
                          label="Pick Up Date"
                          required
                        >
                          <v-spacer></v-spacer>
                          <v-btn text color="primary" @click="menu2 = false">
                            Cancel
                          </v-btn>
                          <v-btn
                            text
                            color="primary"
                            @click="$refs.menu2.save(editedItem.expectedDeliveryDate)"
                          >
                            OK
                          </v-btn>
                        </v-date-picker>
                      </v-menu>
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.quantity"
                          label="Quantity"
                          required
                        ></v-text-field>
                      </v-col>

                      <v-col cols="12" sm="6" md="4">
                        <v-menu
                          ref="menu"
                          v-model="menu"
                          :close-on-content-click="false"
                          :return-value.sync="editedItem.pickupDate"
                          transition="scale-transition"
                          offset-y
                          min-width="290px"
                        >
                          <template v-slot:activator="{ on, attrs }">
                            <v-text-field
                              v-model="editedItem.pickupDate"
                              label="Pickup Date"
                              prepend-icon="mdi-calendar"
                              readonly
                              v-bind="attrs"
                              v-on="on"
                            ></v-text-field>
                          </template>
                          <v-date-picker
                            v-model="editedItem.pickupDate"
                            label="Pick Up Date"
                            required
                          >
                            <v-spacer></v-spacer>
                            <v-btn text color="primary" @click="menu = false">
                              Cancel
                            </v-btn>
                            <v-btn
                              text
                              color="primary"
                              @click="$refs.menu.save(editedItem.pickupDate)"
                            >
                              OK
                            </v-btn>
                          </v-date-picker>
                        </v-menu>
                      </v-col>
                    </v-row>
                    <v-row>
                    <pre><b> Pick up Address </b></pre>

                    </v-row>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.pickupAddress.street"
                          label="Address Line 1"
                          required
                        ></v-text-field>
                        <v-text-field
                          v-model="editedItem.pickupAddress.zipcode"
                          label="ZipCode"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.pickupAddress.city"
                          label="City"
                          required
                        ></v-text-field>
                        <v-text-field
                          v-model="editedItem.pickupAddress.country"
                          label="Country"
                          required
                        ></v-text-field>
                          </v-col>
                        <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.pickupAddress.state"
                          label="State"
                          required
                        ></v-text-field>

                      </v-col>
                      </v-row>
                      <v-row>
                      <pre> <b>Delivery  Address </b></pre>

                      </v-row>
                      <v-row>
                        <v-col cols="12" sm="6" md="4">
                          <v-text-field
                            v-model="editedItem.destinationAddress.street"
                            label="Address Line 1"
                            required
                          ></v-text-field>
                          <v-text-field
                            v-model="editedItem.destinationAddress.zipcode"
                            label="ZipCode"
                            required
                          ></v-text-field>
                        </v-col>
                        <v-col cols="12" sm="6" md="4">
                          <v-text-field
                            v-model="editedItem.destinationAddress.city"
                            label="City"
                            required
                          ></v-text-field>
                          <v-text-field
                            v-model="editedItem.destinationAddress.country"
                            label="Country"
                            required
                          ></v-text-field>
                            </v-col>
                          <v-col cols="12" sm="6" md="4">
                          <v-text-field
                            v-model="editedItem.destinationAddress.state"
                            label="State"
                            required
                          ></v-text-field>

                        </v-col>
                        </v-row>
                  </v-container>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="close"
                    >Cancel</v-btn
                  >
                  <v-btn color="blue darken-1" text @click="save">Save</v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>
        <template v-slot:item.actions="{ item }">
          <v-icon small class="mr-2" @click="editItem(item)">
            mdi-pencil
          </v-icon>
          <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
        </template>
      </v-data-table>
    </v-col>
  </v-row>
</div>
</template>

<script>
import axios from "axios";

let backendURL = "/api/v1/orders";
export default {
  name: "Orders",
  data: () => ({

    orders_reload: 0,
    timer: "",
    counter: 0,
    orders: [],
    vaccineTypes: ["COVID-19", "H1N1"],
    products: ["P01", "P02", "P03"],
    editedIndex: -1,
    respItem: {
        orderID: "",
        customerID: "",
        productID: "",
        voyageID: "",
        containerID: "",
        status: ""

        },
    editedItem: {
      customerID: "",
      expectedDeliveryDate: new Date().toISOString().substr(0, 10),
      pickupDate: new Date().toISOString().substr(0, 10),
      quantity: 10,
      productID: "P01",
      pickupAddress: {
          street: "1 main street",
          city: "SF",
          country: "USA",
          state: "CA",
          zipcode: "92000"
        },
      destinationAddress: {
        street: "12 main street",
        city: "Shanghai",
        country: "China",
        state: "China",
        zipcode: "92001"
      }
    },
    defaultItem: {
      id: -1,
      customerID: "New Customer",
      expectedDeliveryDate:  new Date().toISOString().substr(0, 10),
      pickupDate:  new Date().toISOString().substr(0, 10),
      quantity: 0,
      productID: "P01",
      pickupAddress: {
          street: "1 main street",
          city: "SF",
          country: "USA",
          state: "CA",
          zipcode: "92000"
        },
      destinationAddress: {
        street: "12 main street",
        city: "Shanghai",
        country: "China",
        state: "China",
        zipcode: "92001"
      }
    },
    dialog: false,
    menu: false,
    menu2: false,
    headers: [
      { text: "orderID", value: "orderID", sortable: true },
      { text: "customerID", value: "customerID", sortable: true },
      { text: "productID", value: "productID", sortable: true },
      { text: "voyageID", value: "voyageID", sortable: true },
      { text: "containerID", value: "containerID", sortable: true },
      { text: "Status", value: "status" },
    ],
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Order" : "Edit Order";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
  },
  created() {
    this.updateData();

  },
  mounted() {

    console.log("intialize mounted")
  },
  methods: {
  testFunction: function () {
    //  var v = this;
      setInterval(function () {
        this.orders_reload = this.orders_reload + 1;
    }, 2000);
    console.log("reloaded" + this.orders_reload )
   },

    initialize(){
      axios.get(backendURL)
        .then(resp => {
          this.orders = resp.data;
        })
        .catch(e => {
            console.log("calling initialize" + e)
        });
        console.log("calling initialize")
    },
    updateData() {
      this.timer = setInterval(() => {
        this.initialize();
        }, 2000)

    },
    editItem(item) {
      this.editedIndex = this.orders.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },
    deleteItem(item) {
      console.log(item);
    },
    close() {
      this.dialog = false;
      this.$nextTick(() => {
        //this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
        this.initialize();

      });
    },
    save() {
      if ( this.editedItem.productID == "P02" ){
        this.editedItem.productID = "REFEER_FAILS"
      }

      if (this.editedIndex > -1) {
        axios
          .put(backendURL + "/" + this.editedItem.id, this.editedItem)
          .then((resp) => (this.respItem = resp.data));
        Object.assign(this.orders[this.editedIndex], this.respItem);
      } else {
        axios
          .post(backendURL, this.editedItem)
          .then((resp) => (this.respItem = resp.data));

          this.orders.push(this.respItem);
      }
      this.close();
    },
  },
};


</script>
