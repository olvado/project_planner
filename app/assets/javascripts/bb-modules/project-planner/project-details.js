"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");

module.exports = BigBird.Module.extend({

  el: $('.js-project-details'),

  subscriptions: {
    "project:details": "updateDetails"
  },

  updateDetails: function(project_url) {
    var PP = this;
    $.get(project_url, function(result) {
      var title = result.project.name;
      PP.$el.html(result);
    });
  }

});
