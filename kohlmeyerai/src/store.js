import { createStore } from "vuex";

import profileData from "@/assets/profile.yaml"; // Assuming you have imported the YAML file

export default createStore({
  state: {
    profile: profileData,
    defaultSubject: "Kohlmeyer AI Job Inquiry",
    defaultBody: "Please describe your project.",
  },
});
