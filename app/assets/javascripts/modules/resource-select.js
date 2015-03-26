"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");
var _ = require("underscore");

module.exports = BigBird.Module.extend({

  el: $('#resources'),

  events: {
    "change .js-resource_select": "OnSelectChange"
  },

  initialize: function() {
  },

  OnSelectChange: function(e) {
    e.preventDefault();
    e.stopPropagation();
    var selected_resource = $(e.currentTarget),
        parent = selected_resource.closest('.nested-fields'),
        resource = _.where(resources, {name: selected_resource.val()});

    $('.project_resources_allocation input', parent).val(resource[0].allocation);
    $('.project_resources_fee input', parent).val(resource[0].fee);

    console.log(resource[0].fee);
  }

});
