// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import { Turbo } from "@hotwired/turbo-rails";
import "jquery";

Turbo.session.drive = false;
import "controllers";

//= require jquery
//= require jquery_ujs

import * as jq from "jquery";

// Define a variable to check in inlined HTML script
window.importmapScriptsLoaded = true;
