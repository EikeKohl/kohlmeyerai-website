<script setup>
import Layout from "@/layouts/default/Layout";

</script>

<template>
  <layout>
    <v-container fluid>
      <v-row>
        <v-col cols="12">
          <h3 class="headline mb-4">Filter Project Type</h3>
          <v-chip-group v-model="selectedCategories" multiple selected-class="text-primary" row>
            <v-chip
              v-for="category in projectCategories"
              :key="category"
              :value="category"
            >{{ category }}
            </v-chip>
          </v-chip-group>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12">
          <h3 class="headline mb-4">Filter Tech Stack</h3>
          <v-chip-group v-model="selectedTechStack" row multiple selected-class="text-primary">
            <v-chip
              v-for="tech in technologyTags"
              :key="tech"
              :value="tech"
            >{{ tech }}
            </v-chip>
          </v-chip-group>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="6" md="6" lg="6" v-for="(project, index) in selectedProjects" :key="index" fluid>
          <ProjectTile :project="project"/>
        </v-col>
      </v-row>

    </v-container>
  </layout>
</template>

<script>
import ProjectTile from '@/components/ProjectTile.vue';
import {mapState} from "vuex";

export default {
  components: {
    ProjectTile,
  },
  computed: {
    ...mapState(["profile"]),
    selectedProjects() {

      if (this.selectedCategories.length === 0 && this.selectedTechStack.length === 0) {
        return this.profile.projects;
      }

      return this.profile.projects.filter(project => {
        const categoryMatch = project.categories.some(category => this.selectedCategories.includes(category));
        const techStackMatch = project.techStack.some(tech => this.selectedTechStack.includes(tech));
        return categoryMatch | techStackMatch;
      })
    },
  },
  data() {
    return {
      projectCategories: ['Web Development', 'Machine Learning', 'Mobile App', 'Data Science'],
      technologyTags: ['Vue.js', 'React', 'Node.js', 'Python', 'Java'],
      selectedCategories: [],
      selectedTechStack: [],
    };
  },
};
</script>

