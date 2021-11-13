// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("channels")
require("jquery")
require("easy-autocomplete")

require("bootstrap")
require("flatpickr")


import "packs/task_types"
import "packs/clm_work_items"
import "packs/cards"
import flatpickr from "flatpickr";



require("../stylesheets/application.scss")
require('./nested-forms/addFields')
