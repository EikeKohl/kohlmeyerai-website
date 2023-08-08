<template>
  <v-card style="padding: 12px" elevation="7" min-height="800">
    <!--Header-->
    <v-row>
      <v-col>
        <v-card-title>
          <span class="headline">{{ project.title }}</span>
        </v-card-title>

        <v-card-text class="mb-3">{{ project.abstract }}</v-card-text>
      </v-col>
      <v-img height="200" width="400" :src="project.image" cover />
    </v-row>
    <!--Tags and Duration-->
    <v-row>
      <v-col>
        <v-card-item>
          <v-card-title style="font-size: medium">Category</v-card-title>
          <v-chip-group class="mb-2">
            <v-chip
              v-for="(category, index) in project.categories"
              :key="index"
              small
            >
              {{ category }}
            </v-chip>
          </v-chip-group>
        </v-card-item>

        <v-card-item>
          <v-card-title style="font-size: medium">Tech-Stack</v-card-title>
          <v-chip-group class="mb-3">
            <v-chip
              v-for="(tech, index) in project.techStack"
              :key="index"
              small
            >
              {{ tech }}
            </v-chip>
          </v-chip-group>
        </v-card-item>

        <v-card-text class="mb-2"
          >Project Duration: {{ project.duration }}</v-card-text
        >
      </v-col>
    </v-row>
    <!--Links and Buttons-->
    <v-card-actions>
      <v-btn @click="this.expanded = !this.expanded">Details</v-btn>
      <v-btn
        v-if="project.githubLink"
        :href="project.githubLink"
        target="_blank"
        icon
      >
        <v-icon left>fa-brands fa-github</v-icon>
      </v-btn>
      <v-btn
        v-if="project.mediumLink"
        :href="project.mediumLink"
        target="_blank"
        icon
      >
        <v-icon left>fa-brands fa-medium</v-icon>
      </v-btn>
    </v-card-actions>
    <!--Full Description-->
    <v-expand-transition>
      <v-card-text v-if="expanded" style="background-color: #f5f5f5">
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
