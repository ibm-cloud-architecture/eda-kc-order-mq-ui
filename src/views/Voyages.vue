<template>
  <v-row>
    <v-row>
      <p align="left">

      </p>
      <v-col>

      </v-col>
    </v-row>
    <v-row>
      <v-col sm="" offset-sm="2">
        <v-data-table
          :headers="headers"
          :items="voyages"
          :items-per-page="5"
          sort-by="lane_id"
          class="elevation-1"

        >
        <template #item.voyageID="{ item }">
        <v-dialog v-model="dialog" max-width="1200px">
          <template v-slot:activator="{ on }">
          <v-btn @click="getVoyage(item.voyageID)" color="light-blue darken-4" plain tile elevation=0  v-on="on"
           > {{item.voyageID}}</v-btn>
            </template>
              <v-card>
                <v-card-title>
                  <span class="headline">Details for VoyageId: {{item.voyageID}}  </span>
                </v-card-title>
                <v-container>
                  <v-data-table
                    :headers="itemheaders"
                    :items="voyageitems"
                    sort-by="id"
                    class="elevation-1"
                    >
                    </v-data-table>
                  </v-container>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="close"
                    >Close</v-btn
                  >

                </v-card-actions>

                </v-card>

          </v-dialog>
  </template>
        </v-data-table>
      </v-col>
    </v-row>
  </v-row>
</template>
<script>
import axios from "axios";

let backendURL = "http://localhost:8081/api/v1/voyages";
export default {
  name: "Voyages",
  data: () => ({
    dialog: false,
    transports: [],
    voyages: [],
    voyageitems:[],
    headers: [
      { text: "VoyageID", value: "voyageID", sortable: true },
      { text: "Origin", value: "origin", sortable: true },
      { text: "Destination", value: "destination", sortable: true },
      { text: "DepartureDate", value: "departureDate", sortable: true },
      { text: "ExpectedArrivalDate", value: "expectedArrivalDate", sortable: true },
      { text: "Status", value: "status", sortable: true },
      { text: "OrderIDs", value: "orderIDs" },
    ],
    itemheaders: [
      { text: "VoyageID", value: "voyageID", sortable: true },
      { text: "Origin", value: "origin", sortable: true },
      { text: "Destination", value: "destination", sortable: true },
      { text: "DepartureDate", value: "departureDate", sortable: true },
      { text: "ExpectedArrivalDate", value: "expectedArrivalDate", sortable: true },
      { text: "Status", value: "status", sortable: true },
      { text: "OrderIDs", value: "orderIDs" },
    ],
  }),
  created() {
    this.initialize();
  },
  mounted() {
    this.initialize();
  },
  methods: {
      initialize(){
        axios.get(backendURL)
          .then(resp => {
            this.voyages = resp.data;

        })
        .catch(e => {
            console.log("calling initialize" + e)
        });
        console.log("calling initialize in voyages")
      },
      getVoyage(voyageid){
        axios.get("http://localhost:8081/api/v1/voyages/history?voyageId="+voyageid)
          .then(resp => {
            this.voyageitems = resp.data;
            console.log(this.voyageitems)
        })
        .catch(e => {
            console.log("calling initialize" + e)
        });
        console.log("calling initialize in voyages")
      },
      close() {
        this.dialog = false;

      },
  },
};
</script>
<style>
p {
  text-indent: 10px;
}
</style>
