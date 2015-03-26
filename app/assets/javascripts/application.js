"use strict";

var $ = require('jquery');
var BigBird = require('bigbird');

// BigBird Nodules
var Blocks = require('modules/blocks');
var ResourceSelect = require('modules/resource-select');

// BigBird Initializer
var initializer = new BigBird.Initializer({
  modules: {
    common: {
      initialize: function initializeAction() {
        var blocks = new Blocks();
      }
    },
    projects: {
      new: function() {
        var resourceSelect = new ResourceSelect();
      }
    }
  }
});
