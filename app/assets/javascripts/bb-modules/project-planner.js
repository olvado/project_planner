"use strict";

require("fabric-browserify");
var $ = require("jquery");
var _ = require("underscore");
var BigBird = require("bigbird");


module.exports = BigBird.Module.extend({

  el: '.project-planner',

  blockSize: 50,
  canvasHeight: 600,

  initialize: function() {
    var PP = this,
        url = PP.$el.data('json-url');

    PP.WeeksCanvas = new fabric.Canvas('project-planner_weeks');
    PP.ProjectsCanvas = new fabric.Canvas('project-planner_projects');
    PP.canvasHeight = PP.$el.height();
    PP.WeeksCanvas.setHeight(PP.canvasHeight);

    $.get(url, function(result) {
      PP.result = result;
      PP.weekCount = result.weeks.length;
      PP.canvasWidth = PP.blockSize * PP.weekCount;

      PP.WeeksCanvas.setWidth(PP.canvasWidth);
      PP.ProjectCanvas.setWidth(PP.canvasWidth);
      PP.setupWeeks();
      // PP.setUpBlocks();
    });

  },

  setupWeeks: function() {
    var PP = this,
        x = 0;
    

    _.each(PP.result.weeks, function(week) {
      var week = week.table,
          weekNo = week.number.toString();
      
      var toggler = new fabric.Rect({
            width: PP.blockSize,
            height: PP.blockSize,
            fill: 'rgba(204,204,204,0.5)'
          }),
          text = new fabric.IText(weekNo, {
            fontSize: 18,
            fontFamily: 'Arial',
            fill: 'black',
            textAligh: 'center',
            top: 8, left: 12,
            width: PP.blockSize,
            height: PP.blockSize,
          });

      var group = new fabric.Group([toggler, text], {
            left: x, top: PP.canvasHeight - PP.blockSize,
            width: PP.blockSize,
            height: PP.blockSize,
            lockMovementY: true,
            lockMovementX: true,
            lockScalingY: true,
            lockScalingX: true,
            lockRotation: true,
            hasControls: false,
            hoverCursor: 'pointer'
          });

      x += PP.blockSize;

      var line = new fabric.Line([0, 0, 0, PP.canvasHeight], {
            left: x, top: 0,
            stroke: 'rgba(204,204,204,0.75)',
            evented: false, selectable: false
          });
      PP.WeeksCanvas.add(line);
      PP.WeeksCanvas.add(group);
    });
    PP.WeeksCanvas.on("object:selected", function(week){
      console.log(week.isPrototypeOf(week));
    });
      
  }

});
