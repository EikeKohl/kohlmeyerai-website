/**
 * main.js
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */
// Style
import "./styles/main.css";
// Components
import App from './App.vue'

// Store
import store from "./store.js";

// Composables
import { createApp } from 'vue'

// Plugins
import { registerPlugins } from '@/plugins'

const app = createApp(App)

registerPlugins(app)

app.use(store).mount('#app')
