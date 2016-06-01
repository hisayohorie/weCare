$(document).on('ready', function() {
  $(".booking_button").on('click', function(e){
      e.preventDefault();
    $(".modal-dialog").fadeIn();
    $(".booking_modal").fadeIn();

  });

  $(".close").on('click', function(){
    $(".booking_modal").fadeOut();
    $(".modal-dialog").hide();
  });


});
