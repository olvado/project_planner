"use strict";

var $ = require('jquery');
var BigBird = require('bigbird');

// BigBird Nodules
var Messenger = require('./bb-modules/messenger');
var ResourceSelect = require('./bb-modules/resource-select');
var ProjectDetails = require('./bb-modules/project-planner/project-details');
var ProjectPlanner = require('./bb-modules/project-planner/project-planner');

// BigBird Initializer
var initializer = new BigBird.Initializer({
  modules: {
    common: {
      initialize: function initializeAction() {
        var messenger = new Messenger();
      }
    },
    projects: {
      new: function() {
        var resourceSelect = new ResourceSelect();
      },
      index: function() {
        var projectDetails = new ProjectDetails();
        var projectPlanner = new ProjectPlanner();
      }
    }
  }
});
