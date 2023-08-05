/**
 * plugins/index.js
 *
 * Automatically included in `./src/main.js`
 */

// Plugins
import { loadFonts } from "./webfontloader";
import vuetify from "./vuetify";
import router from "../router";

/**
 * @param {App<Element>} app
 */
export function registerPlugins(app) {
  loadFonts();
  app.use(vuetify).use(router);
}
