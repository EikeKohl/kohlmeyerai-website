<script setup>
import Layout from "@/layouts/default/Layout";

</script>

<template>
  <layout>
    <v-container>

      <v-row justify="center">

        <v-card rounded max-width="1000" elevation="7">

          <v-row>
            <v-col cols="4">
              <v-img cover height="300" width="300" src="@/assets/BusinessCasual.jpg"/>
            </v-col>

            <v-col cols="6">
              <v-card-title>{{ profile.name }}</v-card-title>
              <v-card-subtitle>{{ profile.jobTitle }}</v-card-subtitle>
              <v-card-text> {{ profile.about }}</v-card-text>
              <v-card-actions class="d-flex justify-center">
                <v-btn variant="tonal" color="primary" @click="sendMail">
                  Contact
                </v-btn>
              </v-card-actions>
            </v-col>

          </v-row>

        </v-card>

      </v-row>

      <v-row justify="center">

        <v-carousel>


        </v-carousel>

      </v-row>

    </v-container>
  </layout>
</template>

<script>
import {mapState} from "vuex";

export default {
  methods: {
    sendMail() {
      {
        window.location.href = `mailto:${this.profile.contacts.email}?subject=${encodeURIComponent(this.defaultSubject)}&body=${encodeURIComponent(this.defaultBody)}`;
      }
    }
  },
  computed: {
    ...mapState(["profile", "defaultSubject", "defaultBody"]),
  },
}
</script>
