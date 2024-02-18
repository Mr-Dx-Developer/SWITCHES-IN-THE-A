const SetupProgressBar = () =>{
   //var bar = new ProgressBar.Path('#path-2', {
   //    easing: 'easeInOut',
   //    duration: 1400
   //});
   //
   //bar.set(0);
   //bar.animate(0.33)

  //  var bar4 = new ProgressBar.Path('#healthText', {
  //      easing: 'easeInOut',
  //      duration: 1400
  //  });
  //  bar4.set(0)
  //  bar4.animate(0.7)
//
  //  var bar5 = new ProgressBar.Path('#waterText', {
  //      easing: 'easeInOut',
  //      duration: 1400
  //  });
  //  bar5.set(0)
  //  bar5.animate(0.7)
//
  //  var bar6 = new ProgressBar.Path('#armorText', {
  //      easing: 'easeInOut',
  //      duration: 1400
  //  });
  //  bar6.set(0)
  //  bar6.animate(0.7)
  //  var bar7 = new ProgressBar.Path('#hungerText', {
  //      easing: 'easeInOut',
  //      duration: 1400
  //  });
  //  bar7.set(0)
  //  bar7.animate(0.7)
  //  var bar8 = new ProgressBar.Path('#staminaText', {
  //    easing: 'easeInOut',
  //    duration: 1400
  //});
  //bar8.set(0)
  //bar8.animate(0.7)
//  var bar9 = new ProgressBar.Path('#stressText', {
//    easing: 'easeInOut',
//    duration: 1400
//});
//bar9.set(0)
//bar9.animate(0.7)
}

/*! SVG Pie Progress Indicator | Ryan Detert | MIT License */
/*! based on SVG Pie Timer 0.9.1 | Anders Grimsrud, grint.no | github.com/agrimsrud/svgPieTimer.js */

// Date.now fix by Ari Fuchs, afuchs.tumblr.com/post/23550124774/date-now-in-ie8
Date.now = Date.now || function() { return +new Date };

function svgPieProgress(props){

  'use strict';

  var element = props.element,
    duration = props.duration || 1000,
    endTime = 0, 
    totalDuration = 0, 
    lastTotalProgress, totalProgress, endProgress,
    currentAngle = 0;

  if(!element) throw "SVG Pie Progress: Error - element required"
  
  this.progress =  (props.progress) ? props.progress : 0.0;
  
  this.updateProgress = function(progress){
    
    // We need to keep track of the current angle in case the progress gets updated
    // before the previous progress animation finishes
    lastTotalProgress = currentAngle / 360;
    var delta = progress - lastTotalProgress; 
    
    // this is how much extra we have to go for this progress update
    // progress will contain the new value
    // this.progress will contain the saved value from last time
    var segmentDuration = Math.floor(duration * (progress - this.progress));
    
    // this is how much we still have left from the previous time (if necessary)
    var timeLeft = Math.floor(duration * ( this.progress - lastTotalProgress )); 
    totalDuration = segmentDuration + timeLeft;    
    
    endTime = Date.now() + totalDuration;
    
    this.progress = endProgress = progress;
    frame(); 
  }
  
  function draw(element, angle) {
    var count = element.length;
      
    var rad = (angle * Math.PI / 180),
        x = Math.sin(rad) *  125, 
        y = Math.cos(rad) * -125, 
        mid = (angle > 180) ? 1 : 0, 
        shape = 'M 0 0 v -125 A 125 125 1 ' 
               + mid + ' 1 ' 
               +  x  + ' ' 
               +  y  + ' z';

    // If array of elements, draw each one

    if(element instanceof Array)
        while(count--)
            element[count].setAttribute('d', shape)
    else
        element.setAttribute('d', shape)
  }

      
  function frame() {
    
    var currentTime = Date.now(),
        remaining = endTime - currentTime;

    var currentSegmentProgress = ( 1 - remaining / totalDuration );
    var totalProgress = lastTotalProgress + currentSegmentProgress;
    var newAngle = 360 * totalProgress; 
    
    // make sure no small jump backwards due to rounding, etc
    if ( newAngle > currentAngle )
      currentAngle = newAngle; 
     

    if ( totalProgress >= endProgress ) {
            
      currentAngle = 360 * endProgress;
      lastTotalProgress = endProgress;
      
      // 360 degrees is the same as 0 degress so it won't look finished if we don't
      // set it back a little
      currentAngle = (endProgress >= 0.999) ? 359.999 : currentAngle;
      
      draw(element, currentAngle);
    
      return; 
    
    }

    draw(element, currentAngle);

    requestAnimationFrame(frame);
  };


};



var progress = {}

function init(loaderEl, border, val){
    var loader = document.getElementById(loaderEl),
    border = document.getElementById(border);
    if(progress[loaderEl] == undefined){
      progress[loaderEl]  = new svgPieProgress({
        element: [loader, border],
        duration: 400  // total time it would take without stopping from 0-100% 
      });
    }

  progress[loaderEl].updateProgress(val+.0)
}

