<template>
  <div>
    <h3>Welcome to the Saga with MQ pattern design pattern demonstration!!!!</h3>
    <div class="outer">

      <div class="inner">
      <h4 style="line-height: 50px;">Demonstration script</h4>
      <p>
        The  <b> <a target="_blank" href="https://ibm-cloud-architecture.github.io/refarch-eda/patterns/saga/">[Saga pattern]</a> </b> helps to support a long running
        transaction that can be broken up to a collection of sub transactions that can be interleaved any way with other transactions.
        The SAGA orchestration is done by the order service that sends commands to drive each SAGA participant on what to do and when.
        To support strong consistency and exactly once delivery we are using Queues.<br>
        The Saga will be started by adding a new order, or updating major characteristics of an existing order.
        The demonstration illustrates the happy path, where each participants respond positively, and one incomplete path, where the order
        will not be satisfied because of lack of refrigerator containers. So the compensation logic will roll back the Vessel assignment.

      </p>

      </div>
      <div>
        <v-img
          alt="IBM Cloud Logo"
          class="shrink mr-2"
          contain
          src="../assets/saga-orchestrate.png"
          transition="scale-transition"
          width="900px"
        />
      </div>
    </div>
  </div>
</template>
<style scoped>
.outer {
  width: 100%;
  margin: 0 auto;
  line-height: 30px;
}

.inner {
  text-align: left;
  margin-left: 50px;
}
</style>

<script>
//import axios from "axios";

export default {
  name: "Home",
  data: () => {
      return {
        version: {},
        title: process.env.VUE_APP_TITLE
      }
  },
  created() {
    this.initialize();
  },
  methods: {
    initialize() {
    //  axios.get("http://localhost:8081/api/v1/voyages").then((resp) => (this.version = resp.data));
    console.log("none")

    }
  }
};
</script>
