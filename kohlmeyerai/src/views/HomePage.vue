<script setup>
import BaseLayout from "@/layouts/default/BaseLayout";
</script>

<template>
  <BaseLayout>
    <v-container class="my-8">
      <v-row justify="center">
        <v-card rounded max-width="1000" elevation="7">
          <v-row>
            <v-col cols="4">
              <v-img
                cover
                height="300"
                width="300"
                src="@/assets/BusinessCasual.jpg"
              />
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
    </v-container>

    <v-container class="my-8">
      <v-row justify="center">
        <v-card
          rounded
          max-width="1000"
          elevation="7"
          title="Recommendations"
          class="text-center"
        >
          <v-carousel
            cycle
            hide-delimiter-background
            show-arrows="hover"
            interval="5000"
            height="250"
            style="padding: 20px"
          >
            <v-carousel-item
              v-for="(recommendation, index) in profile.recommendations"
              :key="index"
              class="d-flex justify-center align-center"
            >
              <v-card
                rounded
                max-width="1000"
                elevation="5"
                style="background-color: #e3ecf7"
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
