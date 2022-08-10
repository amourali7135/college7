// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;
import "./controllers";
import "bootstrap";

// Using MRUJS for easier migration to Rails 7 so that old AJAX methods work while I refactor them via Turbo.  
import mrujs from "mrujs";
import { JsErb } from "mrujs/plugins"

// Turbo must be set before starting mrujs for proper compatibility with querySelectors.
window.Turbo = Turbo;
mrujs.start({
  plugins: [
    JsErb()
  ]
})

import { initProgramform, _initProgramform } from "./init_programform.js";
import { initUserform, _initUserform } from "./init_userform.js";
import { initAutocomplete, _initAutocomplete } from "./init_autocomplete.js";
// import {initTurboformremove, _initTurboformremove } from "./init_turboformremove.js"

// my own experiment
// document.addEventListener("DOMContentLoaded", () => {
//   // Your code to run since DOM is loaded and ready
// });

initProgramform();
initUserform();
initAutocomplete();
// initTurboformremove();



