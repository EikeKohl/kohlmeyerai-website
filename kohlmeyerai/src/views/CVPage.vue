<script setup>
import BaseLayout from "@/layouts/default/BaseLayout";
</script>

<template>
  <BaseLayout>
    <v-container class="py-6">
      <v-row>
        <v-col cols="12" md="8">
          <v-timeline side="end">
            <!-- Experience section -->
            <v-timeline-item hide-dot="true">
              <template #opposite>
                <h2 class="headline mb-4">Experience</h2>
              </template>
            </v-timeline-item>

            <v-timeline-item
              v-for="(exp, index) in profile.experience"
              :key="index"
              :icon="exp.icon"
              size="small"
            >
              <template #opposite>
                <div class="caption">{{ exp.start }} - {{ exp.end }}</div>
              </template>
              <template #default>
                <v-card class="timeline-card" elevation="7">
                  <v-card-title>{{ exp.title }}</v-card-title>
                  <v-card-subtitle
                    >{{ exp.company }} - {{ exp.location }}</v-card-subtitle
                  >
                  <v-card-text> {{ exp.description }}</v-card-text>
                </v-card>
              </template>
            </v-timeline-item>

            <!-- Education section -->
            <v-timeline-item hide-dot="true">
              <template #opposite>
                <h2 class="headline mb-4">Education</h2>
              </template>
            </v-timeline-item>

            <v-timeline-item
              v-for="(edu, index) in profile.education"
              :key="index"
              :icon="edu.icon"
              size="small"
            >
              <template #opposite>
                <div class="caption">{{ edu.start }} - {{ edu.end }}</div>
              </template>
              <template #default>
                <v-card class="timeline-card" elevation="7">
                  <v-card-title>{{ edu.degree }}</v-card-title>
                  <v-card-subtitle>{{ edu.university }}</v-card-subtitle>
                  <v-card-text>
                    <div>{{ edu.description }}</div>
                  </v-card-text>
                </v-card>
              </template>
            </v-timeline-item>
          </v-timeline>
        </v-col>
        <v-col cols="12" md="4">
          <!-- Skills section -->
          <h2 class="headline mb-4">Technologies</h2>
          <v-chip-group>
            <v-chip v-for="(skill, index) in profile.technologies" :key="index">
              {{ skill }}
            </v-chip>
          </v-chip-group>

          <!-- Certificates section -->
          <h2 class="headline mb-4 mt-6">Certificates</h2>
          <v-list>
            <v-list-item-group>
              <v-list-item
                v-for="(certificate, index) in profile.certificates"
                :key="index"
              >
                <v-list-item-content>
                  <v-list-item-title>{{ certificate.name }}</v-list-item-title>
                  <v-list-item-subtitle>{{
                    certificate.issued_by
                  }}</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>

          <!-- Languages section -->
          <h2 class="headline mb-4">Languages</h2>
          <v-chip-group>
            <v-chip v-for="language in profile.languages" :key="language">
              {{ language }}
            </v-chip>
          </v-chip-group>
        </v-col>
      </v-row>
    </v-container>
  </BaseLayout>
</template>

<script>
import { mapState } from "vuex";

export default {
  computed: {
    ...mapState(["profile", "defaultSubject", "defaultBody"]),
  },
};
</script>

<style>
.timeline-card {
  max-width: 800px; /* Adjust the max-width as per your preference */
  margin: 0 auto;
  padding: 10px;
  border-radius: 8px;
  /*box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);*/
  background-color: #fff;
}
</style>
