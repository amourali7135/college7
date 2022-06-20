// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "./controllers"
import "bootstrap"

import { initProgramform, _initProgramform }
from './init_programform.js';
import { initUserform, _initUserform } from './init_userform.js';
import { initAutocomplete, _initAutocomplete } from './init_autocomplete.js';

// my own experiment 
document.addEventListener("DOMContentLoaded", () => {
    // Your code to run since DOM is loaded and ready
    
  });
  
  
  initProgramform();
    initUserform();
    initAutocomplete();