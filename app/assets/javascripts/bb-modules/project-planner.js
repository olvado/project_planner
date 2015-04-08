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

    $.get(url, function(result) {
      PP.result = result;
      PP.weekCount = result.weeks.length;
      
      PP.setupCanvas();
      PP.setUpWeeks();
      PP.setUpBlocks();
      PP.setUpEvents();
    });

  },

  setupCanvas: function() {
    this.canvas = new fabric.Canvas('project-planner');
    this.canvasWidth = this.blockSize * this.weekCount;
    this.canvasHeight = this.$el.height();
    this.canvas.setWidth(this.canvasWidth);
    this.canvas.setHeight(this.canvasHeight);
    this.canvas.selection = false;
  },

  setUpWeeks: function() {
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
            hoverCursor: 'pointer',
            dataType: "week",
            data: week
          });

      x += PP.blockSize;

      var line = new fabric.Line([0, 0, 0, PP.canvasHeight], {
            left: x, top: 0,
            stroke: 'rgba(204,204,204,0.75)',
            evented: false, selectable: false
          });
      PP.canvas.add(line);
      PP.canvas.add(group);
    });

      
  },

  setUpBlocks: function() {
    var PP = this,
        y  = 0;
    
    _.each(PP.result.projects, function(project) {
      var width = project.weeks * PP.blockSize,
          rect = new fabric.Rect({
            top: 0,
            left: 0,
            fill: project.color,
            width: width,
            height: PP.blockSize
          }),
          text = new fabric.Text(project.name, {
            top: 16,
            left: 8,
            fontSize: 16,
            fontFamily: "Arial"
          });

      var group = new fabric.Group([rect, text], {
        width: width,
        height: PP.blockSize,
        left: project.week * PP.blockSize,
        top: y,
        hasRotatingPoint: false,
        lockMovementY: true,
        lockScalingY: true,
        lockScalingFlip: true,
        dataType: "project",
        data: project,
        originX: 'left'
      })

      PP.canvas.add(group);
      y += PP.blockSize;
    });


  },

  setUpEvents: function() {
    var PP = this;

    this.canvas.on('object:modified', function(e) {
      var block = e.target,
          obj = block.toObject();
      if (block.dataType == "project") {
        block.setLeft(PP.nearestBlock(obj.left));
        PP.resetScaleToWidth(block);
      }
    });

    this.canvas.on("object:selected", function(obj) {
      switch(obj.target.dataType) {
        case "week":
          console.log(obj.target);
          break;
        case "project":
          PP.saveBlockData(obj.target);
          break;
      }

    });
  },

  saveBlockData: function(block) {
    console.log(block);
  },

  nearestBlock: function(n) {
    return this.blockSize * Math.round(n / this.blockSize);
  },

  resetScaleToWidth: function(block) {
    var obj = block.toObject(),
        rect = block._objects[0],
        text = block._objects[1],
        width = this.nearestBlock(obj.width * obj.scaleX);

    rect.setWidth(width);
    rect.setLeft(-(width/2));
    text.setLeft(-(width/2) + 8);

    block.setWidth(width);
    block.setScaleX(1);
  }

});
