"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");

module.exports = BigBird.Module.extend({

  el: $('.js-messenger'),

  subscriptions: {
    "messenger:send": "updateMessage"
  },

  updateMessage: function(msg) {
    this.$el.html(msg);
  }

});
