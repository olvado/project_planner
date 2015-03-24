"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");

module.exports = BigBird.Module.extend({

  el: $('.app'),

  events: {
    "click .js-block": "OnBlockToggle"
  },

  initialize: function() {
    console.log('initialize');
  },

  OnBlockToggle: function(e) {
    e.preventDefault();
    e.stopPropagation();
    $(e.currentTarget).toggleClass('is-active');
  }

});
