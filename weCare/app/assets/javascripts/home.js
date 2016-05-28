$(document).ready(function() {
  /*! slides | https://gist.github.com/mhulse/66bcbb7099bb4beae530 */
  // (function($) {

    'use strict';
    if ($('[data-slides]').length > 0){

    var $slides = $('[data-slides]');
    var images = $slides.data('slides');
    var count = images.length;
    var slideshow = function() {

      $slides
        .css('background-image', 'url("' + images[Math.floor(Math.random() * count)] + '")')
        .show(0, function() {
          setTimeout(slideshow, 2000);
        });
    };

        slideshow();

  };

  //
  // }(jQuery));

});
