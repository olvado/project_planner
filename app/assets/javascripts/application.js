"use strict";

var $ = require('jquery');
var BigBird = require('bigbird');

// BigBird Nodules
var Blocks = require('bb-modules/blocks');
var ResourceSelect = require('bb-modules/resource-select');
var ProjectPlanner = require('bb-modules/project-planner');

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
      },
      index: function() {
        var projectPlanner = new ProjectPlanner();
      }
    }
  }
});
