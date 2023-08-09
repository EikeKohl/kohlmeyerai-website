<script setup>
import BaseLayout from "@/layouts/default/BaseLayout";
import { openLink } from "@/utils";
</script>

<template>
  <BaseLayout>
    <v-container class="my-8" fluid>
      <v-row justify="center">
        <v-card rounded max-width="1000" elevation="7">
          <v-row>
            <v-col xs="12" md="4" lg="4">
              <v-img
                cover
                height="320"
                width="320"
                src="@/assets/business-casual.jpg"
                class="mx-auto"
              />
            </v-col>

            <v-col xs="12" md="6" lg="6">
              <v-card-title>{{ profile.name }}</v-card-title>
              <v-card-subtitle>{{ profile.jobTitle }}</v-card-subtitle>
              <v-card-text> {{ profile.about }}</v-card-text>
              <v-card-actions class="d-flex justify-center">
                <v-btn variant="tonal" color="#0A283E" @click="sendMail">
                  Contact
                </v-btn>
              </v-card-actions>
            </v-col>
            <v-col xs="12" md="2" lg="2" align-self="center">
              <v-img
                src="@/assets/qr.svg"
                height="120"
                width="120"
                class="mx-auto"
              ></v-img>
            </v-col>
          </v-row>
        </v-card>
      </v-row>
    </v-container>

    <v-container class="my-8" fluid>
      <v-row justify="center">
        <v-card rounded max-width="1000" elevation="7">
          <v-carousel
            cycle
            hide-delimiter-background
            show-arrows="hover"
            interval="5000"
            class="fill-height"
            style="padding: 20px"
            hide-delimiters
          >
            <v-carousel-item
              v-for="(recommendation, index) in profile.recommendations"
              :key="index"
              @click="openLink(profile.contacts.linkedin)"
            >
              <v-card
                rounded
                max-width="1000"
                elevation="5"
                style="background-color: #f0ede5"
              >
                <v-card-title>{{ recommendation.name }}</v-card-title>
                <v-card-subtitle>{{ recommendation.title }}</v-card-subtitle>
                <v-card-text> {{ recommendation.text }}</v-card-text>
              </v-card>
            </v-carousel-item>
          </v-carousel>
        </v-card>
      </v-row>
    </v-container>
  </BaseLayout>
</template>

<script>
import { mapState } from "vuex";

export default {
  methods: {
    sendMail() {
      {
        window.location.href = `mailto:${
          this.profile.contacts.email
        }?subject=${encodeURIComponent(
          this.defaultSubject,
        )}&body=${encodeURIComponent(this.defaultBody)}`;
      }
    },
  },
  computed: {
    ...mapState(["profile", "defaultSubject", "defaultBody"]),
  },
};
</script>

<style scoped>
.v-carousel-item:hover {
  cursor: pointer;
}
</style>
