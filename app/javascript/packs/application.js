import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "script.js"

import "jquery";
import "popper.js";
import "bootstrap";
import { createPopper } from '@popperjs/core';
import "../stylesheets/application";
import Trix from "trix";
import "@rails/actiontext";

Rails.start()
Turbolinks.start()
ActiveStorage.start()


import { trix } from "trix/dist/trix";
import './dropdown';
import './tag_skill';
import "./submit_prevention";
