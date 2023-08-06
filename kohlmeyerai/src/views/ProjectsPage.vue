<script setup>
import BaseLayout from "@/layouts/default/BaseLayout";
</script>

<template>
  <BaseLayout>
    <v-container fluid>
      <!--Project Type Filters-->
      <v-row>
        <v-col cols="12">
          <h3 class="headline mb-4">Filter Project Type</h3>
          <v-chip-group
            v-model="selectedCategories"
            multiple
            selected-class="text-primary"
            row
          >
            <v-chip
              v-for="category in projectCategories"
              :key="category"
              :value="category"
              >{{ category }}
            </v-chip>
          </v-chip-group>
        </v-col>
      </v-row>
      <!--Tech Stack Filters-->
      <v-row>
        <v-col cols="12">
          <h3 class="headline mb-4">Filter Tech Stack</h3>
          <v-chip-group
            v-model="selectedTechStack"
            row
            multiple
            selected-class="text-primary"
          >
            <v-chip v-for="tech in technologyTags" :key="tech" :value="tech"
              >{{ tech }}
            </v-chip>
          </v-chip-group>
        </v-col>
      </v-row>
      <!--Project Tiles-->
      <v-row>
        <v-col
          xs="12"
          md="4"
          lg="4"
          v-for="(project, index) in selectedProjects"
          :key="index"
          fluid
        >
          <ProjectTile :project="project" />
        </v-col>
      </v-row>
    </v-container>
  </BaseLayout>
</template>

<script>
import ProjectTile from "@/components/ProjectTile.vue";
import { mapState } from "vuex";

export default {
  components: {
    ProjectTile,
  },
  computed: {
    ...mapState(["profile"]),
    selectedProjects() {
      if (
        this.selectedCategories.length === 0 &&
        this.selectedTechStack.length === 0
      ) {
        return this.profile.projects;
      }

      const checkCategories = (projectCategories, targetCategories) =>
        targetCategories.every((category) =>
          projectCategories.includes(category),
        );
      const checkTechStack = (projectTechStack, targetTechStack) =>
        targetTechStack.every((tech) => projectTechStack.includes(tech));

      return this.profile.projects.filter((project) => {
        return (
          checkCategories(project.categories, this.selectedCategories) &&
          checkTechStack(project.techStack, this.selectedTechStack)
        );
      });
    },
    projectCategories() {
      return [
        ...new Set(
          this.profile.projects.flatMap((project) => project.categories),
        ),
      ];
    },
    technologyTags() {
      return [
        ...new Set(
          this.profile.projects.flatMap((project) => project.techStack),
        ),
      ];
    },
  },
  data() {
    return {
      selectedCategories: [],
      selectedTechStack: [],
    };
  },
};
</script>

<style scoped>
.v-chip:hover {
  transform: scale(1.1);
  transition: transform 0.2s ease;
}

.v-chip:not(:hover) {
  transform: scale(1);
  transition: transform 0.2s ease;
}
</style>
