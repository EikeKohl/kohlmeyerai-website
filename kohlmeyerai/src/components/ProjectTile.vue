<template>
  <v-card style="padding: 12px" elevation="7">

    <v-row>
      <v-col cols="6">
        <v-card-title>
          <span class="headline">{{ project.title }}</span>
        </v-card-title>

        <v-card-subtitle class="mb-3">{{ project.abstract }}</v-card-subtitle>

        <v-card-item>
          <v-label>Category</v-label>
          <v-chip-group class="mb-2">
            <v-chip v-for="(category, index) in project.categories" :key="index" small>
              {{ category }}
            </v-chip>
          </v-chip-group>
        </v-card-item>

        <v-card-item>
          <v-label>Tech-Stack</v-label>
          <v-chip-group class="mb-3">
            <v-chip v-for="(tech, index) in project.techStack" :key="index" small>
              {{ tech }}
            </v-chip>
          </v-chip-group>
        </v-card-item>

        <v-card-subtitle class="mb-2">Project Duration: {{ project.duration }}</v-card-subtitle>
      </v-col>

      <v-col cols="6">
        <v-img height="200" width="400" :src="project.image" cover/>
      </v-col>
    </v-row>


    <v-card-actions>
      <v-btn @click="this.expanded=!this.expanded">Details</v-btn>
      <v-btn :href="project.githubLink" target="_blank" icon>
        <v-icon left>mdi-github</v-icon>
      </v-btn>
      <v-btn :href="project.mediumLink" target="_blank" icon>
        <v-icon left>mdi-medium</v-icon>
      </v-btn>
    </v-card-actions>

    <v-expand-transition>
      <v-card-text v-if="expanded">
        {{ project.description }}
      </v-card-text>
    </v-expand-transition>

  </v-card>
</template>

<script>
export default {
  props: {
    project: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      expanded: false,
    };
  },
};
</script>

<style>
.v-expand-transition {
  transition: height 0.3s ease-out;
}
</style>
