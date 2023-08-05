<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <v-toolbar-title class="mr-12 text-h6 font-weight-bold">
        <span class="clickable" @click="$router.push('/')">Kohlmeyer AI</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-tabs v-model="activeTab" color="white" grow>
        <v-tab
          v-for="(item, index) in navigationLinks"
          :key="index"
          :to="item.to"
        >
          {{ item.label }}
        </v-tab>
      </v-tabs>
    </v-app-bar>

    <!-- Content slot -->
    <v-main>
      <v-container>
        <slot></slot>
      </v-container>
    </v-main>

    <!-- Footer -->
    <v-footer color="primary" app dark class="py-4">
      <v-row justify="center" class="py-3">
        <v-icon
          v-for="(item, index) in socialMediaLinks"
          :key="index"
          class="mx-4 clickable"
          size="x-large"
          @click="openLink(item.link)"
        >
          {{ item.icon }}
        </v-icon>
      </v-row>
    </v-footer>
  </v-app>
</template>

<script>
import { mapState } from "vuex";

export default {
  computed: {
    ...mapState(["profile", "defaultSubject", "defaultBody"]),
    socialMediaLinks() {
      // Wait until profile data is available before accessing it
      if (this.profile && this.profile.contacts) {
        return [
          { icon: "mdi-linkedin", link: this.profile.contacts.linkedin },
          { icon: "mdi-github", link: this.profile.contacts.github },
          {
            icon: "mdi-email",
            link: `mailto:${
              this.profile.contacts.email
            }?subject=${encodeURIComponent(
              this.defaultSubject,
            )}&body=${encodeURIComponent(this.defaultBody)}`,
          },
          { icon: "fa-medium", link: this.profile.contacts.medium },
        ];
      }
      // Return an empty array if profile data is not available yet
      return [];
    },
  },
  data() {
    return {
      activeTab: 0, // Index of the currently active tab
      navigationLinks: [
        { label: "About", to: "/" },
        { label: "Projects", to: "/projects" },
        { label: "CV", to: "/cv" },
      ],
    };
  },
  methods: {
    openLink(link) {
      window.open(link, "_blank");
    },
  },
};
</script>

<style>
.clickable {
  cursor: pointer;
}

/* Increase footer size */
.v-footer {
  height: 60px;
}
</style>