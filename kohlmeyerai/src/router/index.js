import { createRouter, createWebHistory } from 'vue-router'
// Import the components for the pages
import Home from "@/views/Home.vue";
import Projects from "@/views/Projects.vue";
import CV from "@/views/CV.vue";
import Contact from "@/views/Contact.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/projects",
    name: "Projects",
    component: Projects,
  },
  {
    path: "/cv",
    name: "CV",
    component: CV,
  },
  {
    path: "/contact",
    name: "Contact",
    component: Contact,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
