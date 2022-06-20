// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "./controllers"
import "bootstrap"

import { initProgramform, _initProgramform }
from '../functions/init_programform';
import { initUserform, _initUserform } from '../functions/init_userform';
import { initAutocomplete, _initAutocomplete } from '../functions/init_autocomplete';

// my own experiment 
document.addEventListener("DOMContentLoaded", () => {
    // Your code to run since DOM is loaded and ready
    initProgramform();
    initUserform();
    initAutocomplete();
  });
  
  
  