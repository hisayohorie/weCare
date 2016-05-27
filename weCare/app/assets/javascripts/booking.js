$(document).on('ready', function() {
  $(".booking_button").on('click', function(e){
    $(".booking_modal").fadeIn();
    e.preventDefault();

  });

  $(".close").on('click', function(){
    $(".booking_modal").fadeOut();
  });
});
